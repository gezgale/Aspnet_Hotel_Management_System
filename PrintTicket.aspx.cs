using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintTicket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                PrintTickets();
            }
            catch
            {
                Response.Redirect("~/ReserveTicket.aspx?ID=" + DateTime.Now.Ticks.ToString());
            }

        }
    }

    private void PrintTickets()
    {
        String Str_Report = "ReportStiPage/stiReport1.mrt";
        Stimulsoft.Report.StiReport rpt = new Stimulsoft.Report.StiReport();
        rpt.Load(Server.MapPath(Str_Report));
        System.Data.DataTable dt = new System.Data.DataTable();
        clsDbConnection db = new clsDbConnection();
        dt = db.dbSelect(@"SELECT     RezerveTickets.RezerveDate , ServicesDef.ServiceDate, ServicesDef.ServiceDescript , 
                      RezerveTickets.QuanTity AS ReserverCnt, (CASE WHEN ExpireBit > 0 THEN 'منقضی شده' ELSE 'قابل استفاده' END) AS StateOfMil, tblCountryCities_1.Name AS Mabda, 
                      tblCountryCities.Name AS Magsad, RezerveTickets.RezerveID
                        FROM         tblServicesDef AS ServicesDef INNER JOIN
                      tblRezerveTickets AS RezerveTickets ON ServicesDef.ServiceID = RezerveTickets.ServiceID INNER JOIN
                      tblCountryCities ON ServicesDef.ToCityID = tblCountryCities.CountryCityID INNER JOIN
                      tblCountryCities AS tblCountryCities_1 ON ServicesDef.FromCityID = tblCountryCities_1.CountryCityID
                       where RezerveTickets.RezerveID =  " + Request.QueryString[0].ToString());
        rpt.Compile();
        rpt.RegData(dt);
        StiWebViewer1.Report = rpt;
    }
}