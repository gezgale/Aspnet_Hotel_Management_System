using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Globalization;

public class clsDbConnection
{
    SqlConnection con;
    public SqlCommand cmd;
    DataTable dt;
    SqlDataAdapter da;

	public clsDbConnection()
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["HotelConString"].ConnectionString);
        cmd = new SqlCommand();
        dt = new DataTable();
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
	}

    public DataTable dbSelect(string sql)
    {
        cmd.CommandText = sql;
        con.Open();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public void exeCommand(string strName)
    {
        try
        {
            cmd.CommandText = strName;
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch { }
        finally
        {
            con.Close();
        }
    }

    public void exeCommandSp(string strName)
    {
        try
        {
            cmd.CommandText = strName;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch { }
        finally
        {
            con.Close();
        }
    }

    public DataTable SP_dbOut(string SP_Name)
    {
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = SP_Name;
        con.Open();
        da.Fill(dt);
        con.Close();
        return dt;
    }


    public string dtShamsi()
    {
        string strMydate;
        PersianCalendar calFar1 = new PersianCalendar();
        strMydate = calFar1.GetYear(DateTime.Now).ToString() + "/" + calFar1.GetMonth(DateTime.Now).ToString("00") + "/" + calFar1.GetDayOfMonth(DateTime.Now).ToString("00");
        return strMydate;
    }
}
