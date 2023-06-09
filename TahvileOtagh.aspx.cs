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

public partial class TahvileOtagh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (!IsPostBack)
        {
            clsShamsi shd = new clsShamsi(DateTime.Now);
            TextBox1.Text = TextBox4.Text = shd.ShamsiDate;
            TextBox2.Text = TextBox3.Text = "0";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel3.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        clsDbConnection db = new clsDbConnection();
        DataTable dt = new DataTable();

        dt = db.dbSelect("SELECT     ' مبلغ هر شب اقامت: ' + STR(tblRooms.PriceOfPerNight) + ' - ' + + ' نوع اتاق : ' + tblRoomTypes.RoomTypeDescription AS Expr1 FROM  tblRooms INNER JOIN tblRoomTypes ON tblRooms.RoomType = tblRoomTypes.RoomTypeID WHERE  (tblRooms.RoomNumber = N'" + DropDownList2.SelectedItem.ToString() + "') ");

        Label10.Text = dt.Rows[0][0].ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        String p1, p2, p3;
        p1 = TextBox1.Text.Substring(0, 4);
        p2 = TextBox1.Text.Substring(5, 2);
        p3 = TextBox1.Text.Substring(8, 2);
        clsShamsi shd = new clsShamsi(int.Parse(p1), int.Parse(p2), int.Parse(p3));
        clsDbConnection db = new clsDbConnection();

        db.exeCommand("INSERT INTO tblEECus  (CustomerID , RoomID , EnteredDate , FirstPayment , TasviehBit) VALUES ('" + int.Parse(DropDownList1.SelectedValue.ToString()) + "' , '" + int.Parse(DropDownList2.SelectedValue.ToString()) + "' , '" + shd.MiladiDate.ToShortDateString().Replace("/", "-").Trim() + "' , CONVERT(money, '" + Decimal.Parse(TextBox2.Text.Trim()) + "' ) , CONVERT(int, '0'))");
        
        clsDbConnection db1 = new clsDbConnection();
        db1.exeCommand("UPDATE tblRooms SET RoomStatuse = 3 WHERE RoomID = '" + int.Parse(DropDownList2.SelectedValue.ToString()) + "'");

        DropDownList1.DataBind();
        DropDownList2.DataBind();
        Label12.Visible = true;
        Label12.Text = "ثبت تحویل دهی اتاق با موفقیت انجام شد";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        String p1, p2, p3;
        clsDbConnection db = new clsDbConnection();
        clsDbConnection db1 = new clsDbConnection();
        clsDbConnection db2 = new clsDbConnection();
        clsDbConnection db3 = new clsDbConnection();

        DataTable dt1 = new DataTable();

        int MyRowId = int.Parse(DropDownList3.SelectedValue.ToString());

        dt1 = db1.dbSelect("SELECT     CustomerID, RoomID, RezerveDate  FROM    tblRezerveRoom  WHERE     (RezrveID = '" + MyRowId + "')");
        p1 = TextBox4.Text.Substring(0, 4);
        p2 = TextBox4.Text.Substring(5, 2);
        p3 = TextBox4.Text.Substring(8, 2);
        clsShamsi shd = new clsShamsi(int.Parse(p1), int.Parse(p2), int.Parse(p3));

        db.exeCommand("INSERT INTO tblEECus  (CustomerID , RoomID , EnteredDate , FirstPayment , TasviehBit) VALUES ('" + int.Parse(dt1.Rows[0][0].ToString()) + "' , '" + int.Parse(dt1.Rows[0][1].ToString()) + "' , '" + shd.MiladiDate.ToShortDateString().Replace("/", "-").Trim() + "' , CONVERT(money, '" + Decimal.Parse(TextBox3.Text.Trim()) + "') , CONVERT(int, '0'))");
        db2.exeCommand("DELETE FROM tblRezerveRoom WHERE RezrveID= '" + int.Parse(DropDownList3.SelectedValue.ToString()) + "'");
        db3.exeCommand("UPDATE tblRooms SET RoomStatuse = 3 WHERE RoomID = '" + int.Parse(dt1.Rows[0][1].ToString()) + "'");

        DropDownList3.DataBind();
        Label8.Visible = true;
        Label8.Text = "ثبت تحویل دهی اتاق با موفقیت انجام شد";
    }
}
