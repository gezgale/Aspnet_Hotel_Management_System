using System;
using System.Data;
using System.Data.Linq;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AzadSazieOtagh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserTypeID"] == null)
        {
            Response.Redirect("~/Default.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        if (!IsPostBack)
        {
            dropFill();
        }
        try
        {
            int PardakhtID = int.Parse(Request.QueryString["ID"].ToString().Trim());
            Lbl_Pardakht.Visible = true;
            if (PardakhtID == 1)
            {
                Lbl_Pardakht.Text = "پرداخت انجام شد.";
            }
            else if (PardakhtID == 2)
            {
                Lbl_Pardakht.Text = "پرداخت لغو شد.";
            }
        }
        catch
        {
            Lbl_Pardakht.Visible = false;
        }
    }

    private void dropFill()
    {
        clsDbConnection db = new clsDbConnection();
        DataTable dt = new DataTable();

        dt = db.dbSelect("SELECT   RoomID, RoomNumber  FROM   tblRooms  WHERE     (RoomStatuse = 3)  ORDER BY RoomID DESC");
        DrpRooms.DataSource = dt;

        DrpRooms.DataTextField = "RoomNumber";
        DrpRooms.DataValueField = "RoomID";
        DrpRooms.DataBind();

        //DropDownList1.Items.Add("انتخاب مشتری");
        DrpRooms.Items.Insert(0, new ListItem("انتخاب کد اتاق", "0"));
    }

    private void txtClear()
    {
        TxtEnter.Text = "";
        TxtPrePayment.Text = "";
        TxtExit.Text = "";
        TxtTotalDaysResidence.Text = "";
        TxtPerNightPrice.Text = "";
        TxtTotalResidenceCost.Text = "";
        TxtOtherCosts.Text = "";
        TxtDiscount.Text = "";
        TxtTotal.Text = "";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            UDF_Calculate();
            //clsDbConnection db = new clsDbConnection();

            String p1, p2, p3;
            p1 = TxtExit.Text.Substring(0, 4);
            p2 = TxtExit.Text.Substring(5, 2);
            p3 = TxtExit.Text.Substring(8, 2);
            clsShamsi shd = new clsShamsi(int.Parse(p1), int.Parse(p2), int.Parse(p3));
            Session.Add("a10", UdfGetReserverID(int.Parse(DrpRooms.SelectedValue.ToString())));
            Session.Add("a11", shd.MiladiDate.ToShortDateString().Replace("/", "-").Trim());
            Session.Add("a12", int.Parse(TxtTotalDaysResidence.Text.Trim()));
            Session.Add("a13", Decimal.Parse(TxtPerNightPrice.Text.Trim()));
            Session.Add("a14", Decimal.Parse(TxtTotalResidenceCost.Text.Trim()));
            Session.Add("a15", Decimal.Parse(TxtOtherCosts.Text.Trim()));
            Session.Add("a16", Decimal.Parse(TxtDiscount.Text.Trim()));
            Session.Add("a17", Decimal.Parse(TxtTotal.Text.Trim()));
            Session.Add("a18", int.Parse(DrpRooms.SelectedValue.ToString()));
            Session.Add("a19", "1");
            Response.Redirect("~/ParDakhtPage.aspx?ID=" + DateTime.Now.Ticks.ToString());
            //db.exeCommand(@"UPDATE tblEECus SET ExitDate = '" + shd.MiladiDate.ToShortDateString().Replace("/", "-").Trim() + "' , StayNights = '" + int.Parse(TextBox4.Text.Trim()) + "' , PriceOfPerNight = CONVERT(money, '" + Decimal.Parse(TxtPerNightPrice.Text.Trim()) + "') , ToTalPriceOfStay = CONVERT(money, '" + Decimal.Parse(TextBox6.Text.Trim()) + "') , PriceOfOtherServices = CONVERT(money, '" + Decimal.Parse(TextBox7.Text.Trim()) + "') , DiscountOfCustomer = CONVERT(money, '" + Decimal.Parse(TextBox8.Text.Trim()) + "') , TotalDebtPayment = CONVERT(money, '" + Decimal.Parse(TextBox9.Text.Trim()) + "') , TasviehBit = CONVERT(int, '1') WHERE RoomID='" + int.Parse(DrpRooms.SelectedValue.ToString()) + "' AND TasviehBit=0");
            //clsDbConnection db1 = new clsDbConnection();
            //db1.exeCommand("UPDATE tblRooms SET RoomStatuse = 1 WHERE RoomID = '" + int.Parse(DrpRooms.SelectedValue.ToString()) + "'");

            //dropFill();
            //Label12.Visible = true;
            //Label12.Text = "عملیات تسویه حساب با موفقیت ثبت شد.";
            //txtClear();
        }
        catch (Exception er)
        {
            Label12.Visible = true;
            Label12.Text = "اشکالی در عملیات ثبت به وجود آمده است" + Environment.NewLine + er.Message;
        }
    }

    private int UdfGetReserverID(int intReservedRoomID)
    {
        MainLscDataContext db = new MainLscDataContext();
        tblEECus r = db.tblEECus.Single(n => n.RoomID == intReservedRoomID && n.TasviehBit != 1);
        Session.Add("CustNameSname", r.tblUser.NameCS + " " + r.tblUser.SnameCS + " - کد مشتری: " + r.tblUser.UserID.ToString());
        return r.CustomerID;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        UDFGetInfo2();
        System.Threading.Thread.Sleep(2000);
        UDF_Calculate();
    }

    private void UDF_Calculate()
    {
        try
        {
            Decimal Kosoorat, Bedehiha, TotalDebt;
            Kosoorat = Decimal.Parse(TxtPrePayment.Text.Trim()) + Decimal.Parse(TxtDiscount.Text.Trim());
            Bedehiha = Decimal.Parse(TxtTotalResidenceCost.Text.Trim()) + Decimal.Parse(TxtOtherCosts.Text.Trim());
            TotalDebt = Bedehiha - Kosoorat;
            TxtTotal.Text = TotalDebt.ToString();
        }
        catch
        {

        }
    }

    protected void BtnCachPay_Click(object sender, EventArgs e)
    {
        UDF_Calculate();
        UDF_Calculate();
        clsDbConnection db = new clsDbConnection();

        String p1, p2, p3;
        p1 = TxtExit.Text.Substring(0, 4);
        p2 = TxtExit.Text.Substring(5, 2);
        p3 = TxtExit.Text.Substring(8, 2);
        String StrDescription = "سند پرداختی بابت ثبت ورود شماره " + UdfGetRegID(true).ToString() + " می باشد.";
        SavePaymentHistory(UdfGetRegID(false), StrDescription);
        clsShamsi shd = new clsShamsi(int.Parse(p1), int.Parse(p2), int.Parse(p3));
        db.exeCommand(@"UPDATE tblEECus SET ExitDate = '" + shd.MiladiDate.ToShortDateString().Replace("/", "-").Trim() + "' , StayNights = '" + int.Parse(TxtTotalDaysResidence.Text.Trim()) + "' , PriceOfPerNight = CONVERT(money, '" + Decimal.Parse(TxtPerNightPrice.Text.Trim()) + "') , ToTalPriceOfStay = CONVERT(money, '" + Decimal.Parse(TxtTotalResidenceCost.Text.Trim()) + "') , PriceOfOtherServices = CONVERT(money, '" + Decimal.Parse(TxtOtherCosts.Text.Trim()) + "') , DiscountOfCustomer = CONVERT(money, '" + Decimal.Parse(TxtDiscount.Text.Trim()) + "') , TotalDebtPayment = CONVERT(money, '" + Decimal.Parse(TxtTotal.Text.Trim()) + "') , TasviehBit = CONVERT(int, '1') WHERE RoomID='" + int.Parse(DrpRooms.SelectedValue.ToString()) + "' AND TasviehBit=0");
        clsDbConnection db1 = new clsDbConnection();
        db1.exeCommand("UPDATE tblRooms SET RoomStatuse = 1 WHERE RoomID = '" + int.Parse(DrpRooms.SelectedValue.ToString()) + "'");

        dropFill();
        Label12.Visible = true;
        Label12.Text = "عملیات تسویه حساب با موفقیت ثبت شد.";
        txtClear();
    }

    private int UdfGetRegID(Boolean BlnType)
    {
        MainLscDataContext db = new MainLscDataContext();
        tblEECus t = db.tblEECus.Single(n => n.RoomID == int.Parse(DrpRooms.SelectedValue.ToString()) && n.TasviehBit != 1);
        if (BlnType)
        {
            return t.EnID;
        }
        else
        {
            return t.CustomerID;
        }
    }
    private void SavePaymentHistory(int intCustomerID, String StrPaymentDescription)
    {
        clsShamsi mm = new clsShamsi(DateTime.Now);
        MainLscDataContext db1 = new MainLscDataContext();
        tblCustomerPayment p = new tblCustomerPayment();

        p.CustomerUserID = intCustomerID;
        p.PayedDate = DateTime.Now;
        p.PayedDateShamsi = mm.ShamsiDate;
        p.PayedDescription = StrPaymentDescription;
        p.PayedPrice = Decimal.Parse(TxtTotal.Text);
        p.PayForTypeID = 1;

        db1.tblCustomerPayments.InsertOnSubmit(p);
        db1.SubmitChanges();
    }

    protected void DrpRooms_TextChanged(object sender, EventArgs e)
    {
        UDFGetInfo();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        UDFGetInfo();
    }

    private void UDFGetInfo()
    {
        try
        {
            DateTime dat1, dat2;
            int DiferDays = 0;
            txtClear();
            clsDbConnection db = new clsDbConnection();
            DataTable dt = new DataTable();

            dt = db.dbSelect("SELECT     RoomID, EnteredDate, FirstPayment  FROM  tblEECus  WHERE     (TasviehBit = 0) AND (RoomID = '" + int.Parse(DrpRooms.SelectedValue.ToString()) + "')");
            clsShamsi dts = new clsShamsi(DateTime.Parse(dt.Rows[0][1].ToString()));
            dat1 = DateTime.Parse(dt.Rows[0][1].ToString());
            dat2 = DateTime.Now;
            TimeSpan Difer = dat2.Subtract(dat1);
            DiferDays = int.Parse(Difer.Days.ToString());
            TxtTotalDaysResidence.Text = DiferDays.ToString();

            TxtEnter.Text = dts.ShamsiDate;
            TxtPrePayment.Text = dt.Rows[0][2].ToString();
            dts = new clsShamsi(DateTime.Now);
            TxtExit.Text = dts.ShamsiDate;

            db = new clsDbConnection();
            dt = new DataTable();
            dt = db.dbSelect("SELECT     RoomID, PriceOfPerNight  FROM  tblRooms WHERE     (RoomID = '" + int.Parse(DrpRooms.SelectedValue.ToString()) + "')");
            TxtPerNightPrice.Text = dt.Rows[0][1].ToString();

            TxtTotalResidenceCost.Text = Convert.ToString(Decimal.Parse(TxtTotalDaysResidence.Text.Trim()) * Decimal.Parse(TxtPerNightPrice.Text.Trim()));
            TxtOtherCosts.Text = "0";
            TxtDiscount.Text = "0";
        }
        catch (Exception ee)
        {
            //Response.Write(ee.Message);
            txtClear();
        }
    }

    private void UDFGetInfo2()
    {
        LblMessage.Visible = false;
        try
        {
            DateTime dat1, dat2;
            int DiferDays = 0;
            //txtClear();
            clsDbConnection db = new clsDbConnection();
            DataTable dt = new DataTable();

            dt = db.dbSelect("SELECT     RoomID, EnteredDate, FirstPayment  FROM  tblEECus  WHERE     (TasviehBit = 0) AND (RoomID = '" + int.Parse(DrpRooms.SelectedValue.ToString()) + "')");
            clsShamsi dts = new clsShamsi(DateTime.Parse(dt.Rows[0][1].ToString()));
            dat1 = DateTime.Parse(dt.Rows[0][1].ToString());
            try
            {
                dat2 = clsShamsi.UDFShamsiToMiladi(TxtExit.Text.Trim());
                TimeSpan Difer = dat2.Subtract(dat1);
                DiferDays = int.Parse(Difer.Days.ToString());
                TxtTotalDaysResidence.Text = DiferDays.ToString();
            }
            catch (Exception tt)
            {
                LblMessage.Visible = true;
                LblMessage.Text = "قالب تاریخ شمسی اشتباه وارد شده است";
                Response.Write(tt.Message);
                return;
            }
            

            TxtEnter.Text = dts.ShamsiDate;
            TxtPrePayment.Text = dt.Rows[0][2].ToString();
            //dts = new clsShamsi(DateTime.Now);
            //TxtExit.Text = dts.ShamsiDate;

            db = new clsDbConnection();
            dt = new DataTable();
            dt = db.dbSelect("SELECT     RoomID, PriceOfPerNight  FROM  tblRooms WHERE     (RoomID = '" + int.Parse(DrpRooms.SelectedValue.ToString()) + "')");
            TxtPerNightPrice.Text = dt.Rows[0][1].ToString();

            TxtTotalResidenceCost.Text = Convert.ToString(Decimal.Parse(TxtTotalDaysResidence.Text.Trim()) * Decimal.Parse(TxtPerNightPrice.Text.Trim()));
            //TxtOtherCosts.Text = "0";
            //TxtDiscount.Text = "0";
        }
        catch (Exception ee)
        {
            Response.Write(ee.Message);
            txtClear();
        }
    }

    protected void BtnGetInfo_Click(object sender, EventArgs e)
    {
        UDFGetInfo();
    }
}
