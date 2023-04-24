using System;
using System.Globalization;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class clsShamsi
{
    private String dtShamsi;
    private DateTime dtMiladi;

    public clsShamsi(int _Year, int _Month, int _Day)
    {
        PersianCalendar Per = new PersianCalendar();
        dtMiladi = Per.ToDateTime(_Year, _Month, _Day, 0, 0, 0, 0);
    }

	public clsShamsi(DateTime MiladiDate)
	{
        PersianCalendar calFar1 = new PersianCalendar();
        dtShamsi = calFar1.GetYear(MiladiDate).ToString() + "/" + calFar1.GetMonth(MiladiDate).ToString("00") + "/" + calFar1.GetDayOfMonth(MiladiDate).ToString("00");
	}

    public static String UDFMiladiToShmasi(DateTime MiladiDate)
    {
        PersianCalendar calFar1 = new PersianCalendar();
        String Str_DtShamsi = calFar1.GetYear(MiladiDate).ToString() + "/" + calFar1.GetMonth(MiladiDate).ToString("00") + "/" + calFar1.GetDayOfMonth(MiladiDate).ToString("00");
        return Str_DtShamsi.Trim();
    }

    public static DateTime UDFShamsiToMiladi(String ShamsiDate)
    {
        DateTime MyMilDate;
        String p1, p2, p3;
        p1 = ShamsiDate.Substring(0, 4);
        p2 = ShamsiDate.Substring(5, 2);
        p3 = ShamsiDate.Substring(8, 2);
        PersianCalendar pers = new PersianCalendar();
        MyMilDate = pers.ToDateTime(int.Parse(p1), int.Parse(p2), int.Parse(p3), 0, 0, 0, 0);
        return MyMilDate;
    }

    public String ShamsiDate
    {
        get
        {
            return dtShamsi;
        }
        set
        {
            dtShamsi = value;
        }
    }

    public DateTime MiladiDate
    {
        get
        {
            return dtMiladi;
        }
        set
        {
            dtMiladi = value;
        }
    }
}
