using System;
using System.Data;
using System.Linq;

public partial class ReserveTicket : System.Web.UI.Page
{
    
    protected void drpDownfill()
    {
        int tedad;

        clsDbConnection db = new clsDbConnection();
        DropDownList1.DataSource = db.dbSelect(@"SELECT     dbo.tblServicesDef.ServiceID, 
                      dbo.tblServicesDef.ServiceDescript + N'  ' + dbo.tblServicesDef.ServiceDate + N' ' + N' مبدا ' + dbo.tblCountryCities.Name + N' مقصد ' + tblCountryCities_1.Name AS Expr1,
                       dbo.tblServicesDef.ExpireBit
                        FROM         dbo.tblServicesDef INNER JOIN
                      dbo.tblCountryCities ON dbo.tblServicesDef.FromCityID = dbo.tblCountryCities.CountryCityID INNER JOIN
                      dbo.tblCountryCities AS tblCountryCities_1 ON dbo.tblServicesDef.ToCityID = tblCountryCities_1.CountryCityID WHERE(dbo.tblServicesDef.ExpireBit = 0)");
        DropDownList1.DataTextField = "Expr1";
        DropDownList1.DataValueField = "ServiceID";
        DropDownList1.DataBind();
        DropDownList1.Items.Add("انتخاب فرمائید");
        tedad = DropDownList1.Items.Count - 1;
        DropDownList1.SelectedIndex = tedad;
        userIDfind();
    }

    protected void userIDfind()
    {
        clsDbConnection db = new clsDbConnection();

        TextBox2.Text = Session["UserTotalNameSname"].ToString();
        TextBox3.Text = Session["UserID"].ToString(); 
        TextBox1.Text = db.dtShamsi();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (!IsPostBack)
        {
            drpDownfill();
            drpDathAdd();
            grdReserved();
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

    protected void dbIns()
    {
        clsDbConnection db = new clsDbConnection();
        TextBox1.Text = Year1.Text + "/" + Month1.SelectedValue.ToString() + "/" + Day1.Text;
        db.cmd.Parameters.Add("@RezerveDate", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
        db.cmd.Parameters.Add("@RezerverID", SqlDbType.Int).Value = int.Parse(TextBox3.Text.Trim());
        db.cmd.Parameters.Add("@ServiceID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
        db.cmd.Parameters.Add("@QuanTity", SqlDbType.Int).Value = int.Parse(TextBox4.Text.Trim());
        db.cmd.Parameters.Add("@TotalPrice", SqlDbType.NVarChar).Value = TextBox5.Text.Trim();
        db.cmd.Parameters.Add("@Notes", SqlDbType.NVarChar).Value = TextBox6.Text.Trim();
        db.cmd.Parameters.Add("@FishNumber", SqlDbType.NVarChar).Value = TextBox7.Text.Trim();

        db.exeCommandSp("sp_RezerveTickets_Insert");

        drpDownfill();
        txtClear();
        Label2.Visible = true;
        Label2.Text = "رزرو بلیط انجام شد.";
    }

    protected void dbInsSes()
    {
        TextBox1.Text = Year1.Text + "/" + Month1.SelectedValue.ToString() + "/" + Day1.Text;
        Session.Add("RezerveDate", TextBox1.Text.Trim());
        Session.Add("RezerverID", int.Parse(TextBox3.Text.Trim()));
        Session.Add("ServiceID", DropDownList1.SelectedValue);
        Session.Add("QuanTity", int.Parse(TextBox4.Text.Trim()));
        Session.Add("TotalPrice", TextBox5.Text.Trim());
        Session.Add("Notes", TextBox6.Text.Trim());
        Session.Add("FishNumber", TextBox7.Text.Trim());
    }

    protected void dbCalcMandeBelit()
    {
        clsDbConnection db = new clsDbConnection();
        clsDbConnection db2 = new clsDbConnection();

        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();


        if (DropDownList1.SelectedIndex != (DropDownList1.Items.Count - 1))
        {
            try
            {
                dt = db.dbSelect(@"SELECT     DERIVEDTBL.ServiceID AS dd, DERIVEDTBL.Expr1 AS ForookhteShode, DERIVEDTBL_1.dd3, DERIVEDTBL_1.dd4 AS KolleTarif, DERIVEDTBL_1.dd4 - DERIVEDTBL.Expr1 AS Mandeh FROM   (SELECT     ServiceID, SUM(QuanTity) AS Expr1 FROM  tblRezerveTickets GROUP BY ServiceID
                        HAVING      (ServiceID = '" + DropDownList1.SelectedValue + "')) DERIVEDTBL CROSS JOIN (SELECT     ServiceID AS dd3, Quantity AS dd4 FROM  (SELECT  ServiceID, Quantity FROM  tblServicesDef WHERE (ExpireBit = 0) AND (ServiceID = '" + DropDownList1.SelectedValue + "')) DERIVEDTBL) DERIVEDTBL_1");
                Label1.Text = "قابل رزرو = " + dt.Rows[0][4].ToString();
            }
            catch
            {
                dt2 = db2.dbSelect("SELECT     ServiceID, Quantity FROM   tblServicesDef WHERE     (ExpireBit = 0) AND (ServiceID = '" + DropDownList1.SelectedValue + "')");
                Label1.Text = "قابل رزرو = " + dt2.Rows[0][1].ToString();
            }
        }
        else 
        {
            Label1.Text = "انتخاب سرویس";
        }

        
    }

    protected void grdReserved()
    {
        clsDbConnection db = new clsDbConnection();
        DataTable dt = new DataTable();

        dt = db.dbSelect(@"SELECT     RezerveTickets.RezerveDate AS [تاریخ خرید], ServicesDef.ServiceDate AS [تاریخ حرکت], ServicesDef.ServiceDescript AS [شرح سرویس], 
                      RezerveTickets.QuanTity AS [تعداد بلیطهای رزروی], (CASE WHEN ExpireBit > 0 THEN 'منقضی شده' ELSE 'قابل استفاده' END) AS وضعیت, tblCountryCities_1.Name AS مبدا, 
                      dbo.tblCountryCities.Name AS مقصد , RezerveTickets.RezerveID as RIDSD
                            FROM         dbo.tblServicesDef AS ServicesDef INNER JOIN
                      dbo.tblRezerveTickets AS RezerveTickets ON ServicesDef.ServiceID = RezerveTickets.ServiceID INNER JOIN
                      dbo.tblCountryCities ON ServicesDef.ToCityID = dbo.tblCountryCities.CountryCityID INNER JOIN
                      dbo.tblCountryCities AS tblCountryCities_1 ON ServicesDef.FromCityID = tblCountryCities_1.CountryCityID
                        WHERE  (RezerveTickets.RezerverID = '" + int.Parse(TextBox3.Text.Trim()) +"') ORDER BY RezerveTickets.RezerveID DESC");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void txtClear()
    {
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        dbIns();
        grdReserved();
    }

    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        dbCalcMandeBelit();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        grdReserved();
    }

    protected void BtnOnlinePay_Click(object sender, EventArgs e)
    {
        dbInsSes();
        Session.Add("a19", "2");
        Session.Add("a17", TextBox5.Text.Trim());
        Session.Add("a10" , Session["UserID"].ToString());
        Session.Add("CustNameSname", TextBox2.Text.Trim());
        Response.Redirect("~/ParDakhtPage.aspx?ID=" + DateTime.Now.Ticks.ToString());
    }

    protected void BtnCalc_Click(object sender, EventArgs e)
    {
        try
        {
            MainLscDataContext db = new MainLscDataContext();
            tblServicesDef d = db.tblServicesDefs.Single(n => n.ServiceID == int.Parse(DropDownList1.SelectedValue.ToString()));
            TextBox5.Text = (d.UnitTicketPrice * (int.Parse(TextBox4.Text.Trim()))).ToString("N0");
        }
        catch
        {
            TextBox5.Text = "0";
        }
    }
}