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

public partial class MainAdminCheker : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("Default.aspx?ID=AdminNotFound_" + DateTime.Now.Ticks.ToString());
        }
        else if (int.Parse(Session["UserTypeID"].ToString()) != 1)
        {
            Response.Redirect("Default.aspx?ID=AdminNotFound_" + DateTime.Now.Ticks.ToString());
        }
    }
}
