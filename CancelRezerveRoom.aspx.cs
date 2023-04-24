using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CancelRezerveRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CustomerReservedRooms.aspx?ID=" + DateTime.Now.Ticks.ToString());
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        if (UdfIsOwnRoom(int.Parse(Request.QueryString[0].ToString())) == true)
        {
            UDFCancelReserve(int.Parse(Request.QueryString[0].ToString()));
        }
        else
        {
            Label2.Visible = true;
            Label2.Text = "اتاق جاری توسط شما رزرو نشده است . . .";
        }
    }

    private void UDFCancelReserve(int intRoomID)
    {
        MainLscDataContext db = new MainLscDataContext();
        tblRezerveRoom r = db.tblRezerveRooms.Single(n => n.RoomID == intRoomID && n.CustomerID == int.Parse(Session["UserID"].ToString()));
        db.tblRezerveRooms.DeleteOnSubmit(r);
        db.SubmitChanges();
        db = new MainLscDataContext();
        tblRoom r1 = db.tblRooms.Single(n => n.RoomID == intRoomID);
        r1.RoomStatuse = 1;
        db.SubmitChanges();
        Response.Redirect("~/CustomerReservedRooms.aspx?ID=" + DateTime.Now.Ticks.ToString());
    }

    /// <summary>
    /// بررسی اینکه آیا اتاق مورد نظر مربوط به کاربر لاگین کرده می باشد یا خیر
    /// </summary>
    /// <param name="intRoodID"></param>
    /// <returns></returns>
    private Boolean UdfIsOwnRoom(int intRoomID)
    {
        MainLscDataContext db = new MainLscDataContext();
        try
        {
            tblRezerveRoom r = db.tblRezerveRooms.Single(n => n.RoomID == intRoomID && n.CustomerID == int.Parse(Session["UserID"].ToString()));
            return true;
        }
        catch
        {
            return false;
        }
    }
}