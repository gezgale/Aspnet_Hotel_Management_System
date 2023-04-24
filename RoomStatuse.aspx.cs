using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RoomStatuse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (!IsPostBack)
        {
            UdfBindDropDownList();
            UdfGetRoomsStates();
            //dbReservedAll();
        }
    }

    private void UdfGetRoomsStates(int intRoomStateID=0)
    {
        MainLscDataContext db = new MainLscDataContext();
        if (intRoomStateID == 0)
        {
            var Query = (from row1 in db.tblRooms
                         join row2 in db.tblRoomStates
                         on row1.RoomStatuse equals row2.StatID
                         join row3 in db.tblRoomTypes
                         on row1.RoomType equals row3.RoomTypeID
                         join row4 in db.tblRoomFloors
                         on row1.RoomFloorID equals row4.RoomFloorID
                         select new
                         {
                             row1.RoomID,
                             row1.RoomNumber,
                             row2.RoomStatuseDesc,
                             row3.RoomTypeDescription,
                             row4.RoomFloorTitle,
                             row1.RoomBed,
                             row1.PriceOfPerNight,
                             EnabState = (row1.RoomStatuse == 1 ? true : false),
                             RezervePageLink = "~/ReserveRoom.aspx?PageID=" + row1.RoomID + "&PageMainID=" + DateTime.Now.Ticks.ToString(),
                             ImagePath = (row1.RoomStatuse == 1 ? "~/images/RoomIsReservable.png" : "~/images/RoomIsUnReservable.png")

                         }).ToList();
            DtLstRooms.DataSource = Query;
        }
        else
        {
            var Query = (from row1 in db.tblRooms
                         join row2 in db.tblRoomStates
                         on row1.RoomStatuse equals row2.StatID
                         join row3 in db.tblRoomTypes
                         on row1.RoomType equals row3.RoomTypeID
                         join row4 in db.tblRoomFloors
                         on row1.RoomFloorID equals row4.RoomFloorID
                         where row1.RoomStatuse == intRoomStateID
                         select new
                         {
                             row1.RoomID,
                             row1.RoomNumber,
                             row2.RoomStatuseDesc,
                             row3.RoomTypeDescription,
                             row4.RoomFloorTitle,
                             row1.RoomBed,
                             row1.PriceOfPerNight,
                             EnabState = (row1.RoomStatuse == 1 ? true : false),
                             RezervePageLink = "~/ReserveRoom.aspx?PageID=" + row1.RoomID + "&PageMainID=" + DateTime.Now.Ticks.ToString(),
                             ImagePath = (row1.RoomStatuse == 1 ? "~/images/RoomIsReservable.png" : "~/images/RoomIsUnReservable.png")

                         }).ToList();
            DtLstRooms.DataSource = Query;
        }
        DtLstRooms.DataBind();
    }

    public int UdfGetRowsCount()
    {
        clsDbConnection db = new clsDbConnection();
        System.Data.DataTable dt = new System.Data.DataTable();
        dt = db.dbSelect("SELECT [RoomFloorID]  ,[RoomFloorTitle]  ,[CountOfUse]  FROM [XtblCountOfPerGroup] order by  [CountOfUse] desc");
        return int.Parse(dt.Rows[0]["CountOfUse"].ToString());
    }

    private void dbReservedAll()
    {
        if (Session["UserName"] != null)
        {
            clsDbConnection db = new clsDbConnection();
            System.Data.DataTable dt = new System.Data.DataTable();
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

    private void UdfBindDropDownList()
    {
        MainLscDataContext db = new MainLscDataContext();
        List<tblRoomState> lstStateu = new List<tblRoomState>();
        lstStateu = (from row1 in db.tblRoomStates select row1).ToList<tblRoomState>();
        lstStateu.Add(new tblRoomState { StatID = 0, RoomStatuseDesc = "نمایش همه وضعیت ها . . ." });
        DrpRoomState.DataSource = lstStateu.OrderBy(n=> n.StatID);
        DrpRoomState.DataTextField = "RoomStatuseDesc";
        DrpRoomState.DataValueField = "StatID";
        DrpRoomState.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        UdfGetRoomsStates(int.Parse(DrpRoomState.SelectedValue.ToString()));
    }
}