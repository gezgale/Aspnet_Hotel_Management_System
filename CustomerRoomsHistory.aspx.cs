using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerRoomsHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                UdfGetData();
            }
            catch { Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString()); }
        }
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (int.Parse(Session["UserTypeID"].ToString()) == 1)//مدیر
        {
            TitleP.Visible = true;
            TitleP.InnerText = "سوابق اتاقهای گرفته شده کلیه مشتریان";
        }
        else
        {
            TitleP.Visible = true;
            TitleP.InnerText = "سوابق اتاقهای گرفته شده مشتری";
        }

            
    }

    private void UdfGetData()
    {
        if (int.Parse(Session["UserTypeID"].ToString()) == 1)//مدیر
        {
            MainLscDataContext db = new MainLscDataContext();
            var Q = (from row in db.XtblCustomerTookedRooms select row).ToList();
            GridView2.DataSource = Q;
            GridView2.DataBind();
        }
        else
        {
            MainLscDataContext db = new MainLscDataContext();
            var Q = (from row in db.XtblCustomerTookedRooms where row.CustomerID == int.Parse(Session["UserID"].ToString()) select row).ToList();
            GridView2.DataSource = Q;
            GridView2.DataBind();
        }

    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        UdfGetData();
    }
}