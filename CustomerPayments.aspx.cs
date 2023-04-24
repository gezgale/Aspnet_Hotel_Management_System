using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerPayments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (int.Parse(Session["UserTypeID"].ToString()) == 1)//مدیر
        {
            //Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
            LinqDataSource1.TableName = "XtblCustomerPayments";
            LinqDataSource1.Where = "CustomerUserID > 0";
            TitleP.Visible = true;
            TitleP.InnerText = "سوابق پرداختهای کلیه مشتریان";
        }
    }
}