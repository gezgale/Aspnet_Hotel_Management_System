using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clsDbConnection db = new clsDbConnection();
        DataTable dt = new DataTable();

        dt = db.dbSelect("SELECT UserID, UserName, UserTypeID, [NameCS] ,[SnameCS] FROM tblUsers WHERE     (UserName = '" + TextBox1.Text.Trim() + "') AND (UsePassChar = '" + TextBox2.Text.Trim() + "')");

        if (dt.Rows.Count <= 0)
        {
            Response.Write("<script>alert('نام کاربری و یا کلمه عبور صحیح وارد نشده است')</script>");
        }
        else
        {
            Session.Add("UserName", dt.Rows[0][1].ToString());
            Session.Add("UserTypeID", dt.Rows[0][2].ToString().Trim());
            Session.Add("UserID", dt.Rows[0][0].ToString());
            Session.Add("UserTotalNameSname", dt.Rows[0][3].ToString() + " " + dt.Rows[0][4].ToString());
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
    }
}
