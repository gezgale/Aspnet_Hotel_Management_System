using System;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ParDakhtPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "صفحه پرداخت آنلاین";
        try
        {
            TxtPrice.Text = Session["a17"].ToString();
            TextBox1.Text = Session["CustNameSname"].ToString();
        }
        catch { TxtPrice.Text = "0"; }
    }

    protected void Btn_Cancel_Click(object sender, EventArgs e)
    {
        try
        {
            if (short.Parse(Session["a19"].ToString()) == 1)
            {
                Response.Redirect("~/AzadSazieOtagh.aspx?ID=" + DateTime.Now.Ticks.ToString());
            }
            else
            {
                Response.Redirect("~/ReserveTicket.aspx?MID=" + DateTime.Now.Ticks.ToString());
            }
        }
        catch
        {
            Session.Clear();
            Response.Redirect("~/Default.aspx?MID=" + DateTime.Now.Ticks.ToString());
        }
    }

    protected void Btn_Pardakht_Click(object sender, EventArgs e)
    {
        if (Session["MyRanNump"].ToString().Trim() != Txt_Capcha.Text.Trim())
        {
            Lbl_Massege.Visible = true;
            Lbl_Massege.Text = "فیلد امنینتی به درستی وارد نشده است . . .";
            return;
        }
        if (Session["a19"] == null)
        {
            Lbl_Massege.Visible = true;
            Lbl_Massege.Text = "مجوز پرداخت وجود ندارد";
            return;
        }
        if (Session["a17"].ToString().Trim() == "0")
        {
            Lbl_Massege.Visible = true;
            Lbl_Massege.Text = "مبلغ قابل پرداخت وارد نشده است . . .";
            return;
        }
        if ((string)Session["MyRanNump"] == Txt_Capcha.Text.Trim())
        {
            // Response.RedirZect("ParDakhtPage.aspx");
            if (short.Parse(Session["a19"].ToString()) == 1)
            {
                UdfPayment();
                Lbl_Massege.Visible = true;
                Lbl_Massege.Text = "پرداخت انجام شد. کد پرداخت شما :" + DateTime.Now.Ticks.ToString();
            }
            else// بلیط هواپیما
            {
                UdfPayment2();
                Lbl_Massege.Visible = true;
                Lbl_Massege.Text = "پرداخت انجام شد. کد پرداخت شما :" + DateTime.Now.Ticks.ToString();
            }
        }
        else
        {
            Lbl_Massege.Visible = true;
            Lbl_Massege.Text = "فیلد امنیتی نادرست وارد شده است";
        }
    }

    private void UdfPayment()
    {
        String StrDescription = "سند پرداختی بابت ثبت ورود شماره " + UdfGetRegID().ToString() + " می باشد.";
        clsDbConnection db = new clsDbConnection();
        db.exeCommand(@"UPDATE tblEECus SET ExitDate = '" + Session["a11"].ToString() + "' , StayNights = '" + Session["a12"].ToString() + "' , PriceOfPerNight = CONVERT(money, '" + Session["a13"].ToString() + "') , ToTalPriceOfStay = CONVERT(money, '" + Session["a14"].ToString() + "') , PriceOfOtherServices = CONVERT(money, '" + Session["a15"].ToString() + "') , DiscountOfCustomer = CONVERT(money, '" + Session["a16"].ToString() + "') , TotalDebtPayment = CONVERT(money, '" + Session["a17"].ToString() + "') , TasviehBit = CONVERT(int, '1') WHERE RoomID='" + Session["a18"].ToString() + "' AND TasviehBit = 0");
        MainLscDataContext dbUp = new MainLscDataContext();
        tblRoom r = dbUp.tblRooms.Single(n => n.RoomID == int.Parse(Session["a18"].ToString()));
        r.RoomStatuse = 1;
        dbUp.SubmitChanges();
        //clsDbConnection db1 = new clsDbConnection();
        //db1.exeCommand("UPDATE tblRooms SET RoomStatuse = 1 WHERE RoomID = '" + Session["a18"] + "'");
        //ثبت تاریخچه پرداخت مشتری
        SavePaymentHistory(int.Parse(Session["a10"].ToString()), StrDescription);
    }

    private void UdfPayment2()
    {
        clsDbConnection db = new clsDbConnection();
        db.cmd.Parameters.Add("@RezerveDate", SqlDbType.NVarChar).Value = Session["RezerveDate"].ToString();
        db.cmd.Parameters.Add("@RezerverID", SqlDbType.Int).Value = int.Parse(Session["RezerverID"].ToString());
        db.cmd.Parameters.Add("@ServiceID", SqlDbType.Int).Value = int.Parse(Session["ServiceID"].ToString());
        db.cmd.Parameters.Add("@QuanTity", SqlDbType.Int).Value = int.Parse(Session["QuanTity"].ToString());
        db.cmd.Parameters.Add("@TotalPrice", SqlDbType.NVarChar).Value = Session["TotalPrice"].ToString();
        db.cmd.Parameters.Add("@Notes", SqlDbType.NVarChar).Value = Session["Notes"].ToString();
        db.cmd.Parameters.Add("@FishNumber", SqlDbType.NVarChar).Value = Session["FishNumber"].ToString();

        db.exeCommandSp("sp_RezerveTickets_Insert");

        SavePaymentHistory(int.Parse(Session["a10"].ToString()), "پرداخت بابت فروش بلیط هواپیما . . ." + "  کد رزرو  " + Session["RezerverID"].ToString());
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
        p.PayedPrice = Decimal.Parse(Session["a17"].ToString());
        p.PayForTypeID = short.Parse(Session["a19"].ToString());

        db1.tblCustomerPayments.InsertOnSubmit(p);
        db1.SubmitChanges();
        Session.Add("a17", "0");
        Session.Add("a18", "0");
        if (short.Parse(Session["a19"].ToString()) == 1)
        {
            Response.Redirect("~/AzadSazieOtagh.aspx?ID=" + DateTime.Now.Ticks.ToString());
        }
        else
        {
            Response.Redirect("~/ReserveTicket.aspx?MID=" + DateTime.Now.Ticks.ToString());
        }
    }

    private int UdfGetRegID()
    {
        MainLscDataContext db = new MainLscDataContext();
        tblEECus t = db.tblEECus.Single(n => n.RoomID == int.Parse(Session["a18"].ToString()) && n.TasviehBit != 1);
        return t.EnID;
    }
}
