using System;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using dtsUsersTableAdapters;

public partial class EditUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (!IsPostBack)
        {
            textFill();
        }
    }

    private void textFill()
    {
        try
        {
            tblUsersTableAdapter tbl1 = new tblUsersTableAdapter();
            dtsUsers.tblUsersDataTable dt1 = new dtsUsers.tblUsersDataTable();
            tbl1.FillBy2(dt1, Session["UserName"].ToString());
            TxtUserName.Text = dt1.Rows[0][1].ToString();
            TxtPassword.TextMode = TextBoxMode.Password;
            TxtPassword.Attributes.Add("Value", dt1.Rows[0][2].ToString());
            TxtPasswordRepeat.TextMode = TextBoxMode.Password;
            TxtPasswordRepeat.Attributes.Add("Value", dt1.Rows[0][2].ToString());
            TxtEmail.Text = dt1.Rows[0][8].ToString();
            TxtWebsite.Text = dt1.Rows[0][9].ToString();
            TxtName.Text = dt1.Rows[0][3].ToString();
            TxtSName.Text = dt1.Rows[0][4].ToString();
            TxtPhoneNumber.Text = dt1.Rows[0][5].ToString();
            TxtMobile.Text = dt1.Rows[0][6].ToString();
        }
        catch
        {
            Response.Redirect("Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //tblUsersTableAdapter tb1 = new tblUsersTableAdapter();
        //dtsUsers.tblUsersDataTable dt1 = new dtsUsers.tblUsersDataTable();

        //clsDbConnection dbT = new clsDbConnection();
        //DataTable dtt = new DataTable();

        //dtt = dbT.dbSelect("SELECT UserName, UserTypeID , UserMail  FROM  tblUsers  WHERE (UserName = N'" + Session["UserName"].ToString() + "')");
        //TxtPhoneNumber.Text.Trim(), TxtMobile.Text.Trim(), int.Parse(dtt.Rows[0][1].ToString()), TxtEmail.Text.Trim() , TxtWebsite.Text.Trim(), int.Parse(dtt.Rows[0][1].ToString()));
        MainLscDataContext db = new MainLscDataContext();
        tblUser u = db.tblUsers.Single(n => n.UserName == TxtUserName.Text);
        u.UsePassChar = TxtPassword.Text;
        u.NameCS = TxtName.Text;
        u.SnameCS = TxtSName.Text;
        u.Phone = TxtPhoneNumber.Text;
        u.Mobile = TxtMobile.Text;
        u.UserWebSite = TxtWebsite.Text;
        db.SubmitChanges();
        System.Threading.Thread.Sleep(2000);
        textFill();
        Label12.Visible = true;
        Label12.Text = "عملیات بروز رسانی اطلاعات کاربری با موفقیت انجام شد";
    }
}
