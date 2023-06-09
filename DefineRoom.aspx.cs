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
using dtsRoomsTableAdapters;

public partial class DefineRoom : System.Web.UI.Page
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
        clsDbConnection db = new clsDbConnection();
        DataTable dt = new DataTable();
        Label12.Visible = false;
        dt = db.dbSelect("SELECT     RoomNumber  FROM    tblRooms  WHERE     (RoomNumber = N'" + TextBox1.Text.Trim() + "')");
        if (dt.Rows.Count <= 0)
        {
            tblRoomsTableAdapter tblRoom = new tblRoomsTableAdapter();
            tblRoom.Insert(TextBox1.Text.Trim(), int.Parse(DropDownList1.SelectedValue.ToString()), int.Parse(TextBox2.Text.Trim()), Decimal.Parse(TextBox3.Text.Trim()), int.Parse(DropDownList2.SelectedValue.ToString()));
            Label12.Visible = true;
            Label12.Text = "اتاق جدید ثبت گردید";
            GridView1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }
        else
        {
            Label12.Visible = true;
            Label12.Text = "کد وارد شده تکراری است";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
    }
}
