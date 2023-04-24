using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ServJadid : System.Web.UI.Page
{
    protected void grdFill()
    {
        clsDbConnection db = new clsDbConnection();
        GridView1.DataSource = db.SP_dbOut("sp_ServicesDef_SelectAll");
        GridView1.DataBind();
    }

    protected void dbFill()
    {
        try
        {
            MainLscDataContext db = new MainLscDataContext();
            TextBox2.Text = Year1.Text + "/" + Month1.SelectedValue.ToString() + "/" + Day1.Text;
            tblServicesDef s = new tblServicesDef();
            s.ExpireBit = false;
            s.FromCityID = int.Parse(DrpFromCity.SelectedValue.ToString());
            s.Quantity = int.Parse(TextBox3.Text.Trim());
            s.ServiceDate = TextBox2.Text.Trim();
            s.ServiceDescript = TextBox1.Text.Trim();
            s.ToCityID = int.Parse(DrpToCity.SelectedValue.ToString());
            s.UnitTicketPrice = Decimal.Parse(TxtTicketPrice.Text.Trim());

            db.tblServicesDefs.InsertOnSubmit(s);
            db.SubmitChanges();

            grdFill();
            txtClear();
        }
        catch (Exception ee)
        {
            LblMessage.Visible = true;
            LblMessage.Text = "سرویس ایجاد نشد . . ." + ee.Message;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }

        if (!IsPostBack)
        {
            grdFill();
            drpDathAdd();
        }
    }

    protected void drpDathAdd()
    {
        if (!IsPostBack)
        {
            clsDbConnection db = new clsDbConnection();
            DataTable dt = new DataTable();

            dt = db.dbSelect("SELECT TOP 100 PERCENT MonthID, MonthName FROM  tblMonthHa ORDER BY MonthID");

            Month1.DataTextField = "MonthName";
            Month1.DataValueField = "MonthID";
            Month1.DataSource = dt;
            Month1.DataBind();

            for (int i = 1; i <= 31; i++)
            {
                if (i < 10)
                {
                    Day1.Items.Add("0" + i.ToString());
                }
                else
                {
                    Day1.Items.Add(i.ToString());
                }
            }
            for (int i = 1400; i <= 1410; i++)
            {
                Year1.Items.Add(i.ToString());
            }
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        grdFill();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        clsDbConnection db = new clsDbConnection();
        db.cmd.Parameters.Add("@ServiceID", SqlDbType.Int).Value = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[1].Text);
        db.exeCommandSp("sp_ServicesDef_DeleteRow");
        grdFill();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        grdFill();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Boolean akkk = false;
        clsDbConnection dbUpdate = new clsDbConnection();
        CheckBox sssw = (CheckBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0];
        if (sssw.Checked)
        {
            akkk = true;
        }
        else
        {
            akkk = false;
        }

        //dbUpdate.cmd.Parameters.Add("@ServiceID", SqlDbType.Int).Value = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[1].Text);
        //dbUpdate.cmd.Parameters.Add("@ServiceDescript", SqlDbType.NVarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        //dbUpdate.cmd.Parameters.Add("@ServiceDate", SqlDbType.NVarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        //dbUpdate.cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text);
        //dbUpdate.cmd.Parameters.Add("@ExpireBit", SqlDbType.Bit).Value = akkk;
        //dbUpdate.cmd.Parameters.Add("@FromCityID", SqlDbType.Int).Value = int.Parse(((DropDownList)GridView1.FindControl("DropDownList1")).SelectedValue.ToString());//int.Parse(DrpFromCity.SelectedValue.ToString());
        //dbUpdate.cmd.Parameters.Add("@ToCityID", SqlDbType.Int).Value = int.Parse(((DropDownList)GridView1.FindControl("DropDownList2")).SelectedValue.ToString());

        MainLscDataContext db = new MainLscDataContext();
        tblServicesDef s = db.tblServicesDefs.Single(n=> n.ServiceID == Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[1].Text));

        s.ExpireBit = akkk;
        //s.FromCityID = int.Parse(((DropDownList)GridView1.FindControl("DropDownList1")).SelectedValue.ToString());
        s.Quantity = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text);
        s.ServiceDate = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        s.ServiceDescript = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        //s.ToCityID = int.Parse(((DropDownList)GridView1.FindControl("DropDownList2")).SelectedValue.ToString());

        db.SubmitChanges();

        dbUpdate.exeCommand("sp_ServicesDef_Update");
        GridView1.EditIndex = -1;
        grdFill();
    }

    protected void txtClear()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (int.Parse(DrpFromCity.SelectedValue.ToString()) != int.Parse(DrpToCity.SelectedValue.ToString()))
        {
            dbFill();
            LblMessage.Visible = true;
            LblMessage.Text = "پرواز جدید ایجاد شد . . .";
        }
        else
        {
            LblMessage.Visible = true;
            LblMessage.Text = "مبدا و مقصد نمی توانند یکسان باشند . . .";
        }
    }
}
