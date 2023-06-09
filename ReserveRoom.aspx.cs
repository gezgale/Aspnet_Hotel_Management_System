using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

public partial class ReserveRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (!IsPostBack)
        {
            dbReservedAll();
        }
        if (UdfCanReserveRoome() != true)
        {
            Button1.Enabled = false;
            Label2.Visible = true;
            Label2.Font.Size = 25;
            Label2.Text = "این اتاق قابل رزرو شدن نمی باشد . . .";
        }
        else
        {
            UdfGetRoomsStates(int.Parse(Request.QueryString[0].ToString()));
        }
    }

    private void UdfGetRoomsStates(int intRoomID)
    {
        MainLscDataContext db = new MainLscDataContext();
        var Query = (from row1 in db.tblRooms
                     join row2 in db.tblRoomStates
                     on row1.RoomStatuse equals row2.StatID
                     join row3 in db.tblRoomTypes
                     on row1.RoomType equals row3.RoomTypeID
                     join row4 in db.tblRoomFloors
                     on row1.RoomFloorID equals row4.RoomFloorID
                     where row1.RoomID == intRoomID
                     select new
                     {
                         row1.RoomID,
                         row1.RoomNumber,
                         row2.RoomStatuseDesc,
                         row3.RoomTypeDescription,
                         row4.RoomFloorTitle,
                         row1.RoomBed,
                         PriceOfPerNight = Decimal.Parse(row1.PriceOfPerNight.ToString()).ToString("N0"),
                         //EnabState = (row1.RoomStatuse == 1 ? true : false),
                         ImagePath = (row1.RoomStatuse == 1 ? "~/images/RoomIsReservable.png" : "~/images/RoomIsUnReservable.png")
                     }).ToList();
        DtLstRooms.DataSource = Query;

        DtLstRooms.DataBind();
    }

    protected void UdfReserveRoom()
    {
        if (Session["UserName"] != null)
        {
            int RoomNo = int.Parse(Request.QueryString[0].ToString());
            clsDbConnection db = new clsDbConnection();
            db.exeCommand("UPDATE tblRooms SET RoomStatuse = 2 WHERE RoomID = '" + RoomNo + "' AND RoomStatuse = 1");
            clsDbConnection db1 = new clsDbConnection();
            clsShamsi shd = new clsShamsi(DateTime.Now);
            String MyShamsiDate = shd.ShamsiDate;

            db1.exeCommand("INSERT INTO tblRezerveRoom VALUES ('" + int.Parse(Session["UserID"].ToString()) + "' , '" + RoomNo + "' , '" + MyShamsiDate + "')");

            clsDbConnection db2 = new clsDbConnection();
            DataTable dt2 = new DataTable();

            dt2 = db2.dbSelect("SELECT     RezrveID   FROM   tblRezerveRoom  WHERE   (CustomerID = '" + int.Parse(Session["UserID"].ToString()) + "') AND (RoomID = '" + RoomNo + "') AND (RezerveDate = N'" + MyShamsiDate + "')");

            //GridView1.DataBind();
            Label2.Visible = true;
            dbReservedAll();
            Label2.Text = "عملیات رزرو با موفقیت انجام شد. کد رزرو شما: " + dt2.Rows[0][0].ToString() + " می باشد." + "<BR>" + "لطفا برای مراجعه و تحویل گیری اتاق این کد را همراه داشته باشید.";
            Button1.Enabled = false;
        }
        else
        {
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
    }

    private Boolean UdfCanReserveRoome()
    {
        MainLscDataContext db = new MainLscDataContext();
        try
        {
            tblRoom r = db.tblRooms.Single(n => n.RoomStatuse == 1 && n.RoomID == int.Parse(Request.QueryString[0].ToString()));
            return true;
        }
        catch
        {
            return false;
        }
    }

    private void dbReservedAll()
    {
        if (Session["UserName"] != null)
        {
            clsDbConnection db = new clsDbConnection();
            DataTable dt = new DataTable();
            dt = db.dbSelect("SELECT     RoomID, RoomStatuse  FROM  tblRooms WHERE     (RoomStatuse = 1)");
            Image1.Visible = false;

            if (dt.Rows.Count <= 0)
            {
                Image1.Visible = true;
            }
        }
        else
        {
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        UdfReserveRoom();
    }
}
