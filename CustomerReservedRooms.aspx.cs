using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerReservedRooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        UdfGetRoomsStates();
    }

    private void UdfGetRoomsStates()
    {
        MainLscDataContext db = new MainLscDataContext();
        var Query1 = (from rowN in db.tblRezerveRooms where rowN.CustomerID == int.Parse(Session["UserID"].ToString()) select rowN).ToList();
        var Query = (from row1 in db.tblRooms
                     join row2 in db.tblRoomStates
                     on row1.RoomStatuse equals row2.StatID
                     join row3 in db.tblRoomTypes
                     on row1.RoomType equals row3.RoomTypeID
                     join row4 in db.tblRoomFloors
                     on row1.RoomFloorID equals row4.RoomFloorID
                     join row5 in db.tblRezerveRooms 
                     on row1.RoomID equals row5.RoomID
                     where Query1.Select(n=> n.RoomID).Contains(row1.RoomID)
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
                         ImagePath = (row1.RoomStatuse == 1 ? "~/images/RoomIsReservable.png" : "~/images/RoomIsUnReservable.png"),
                         ReserveCode =  row5.RezrveID.ToString()
                     }).ToList();
        DtLstRooms.DataSource = Query;
        DtLstRooms.DataBind();
    }
}