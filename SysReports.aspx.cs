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

public partial class SysReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = "گزارش وضعیت کلی موجود";
        clsDbConnection db = new clsDbConnection();
        DataTable dt = new DataTable();

        dt = db.dbSelect(@"SELECT  isnull( (select COUNT(UserID) as D FROM    dbo.tblUsers ) , 0) as TedadeKarbaran
                                ,  isnull( (select COUNT(RoomID) AS TT2 FROM         tblRooms) , 0)  as TedadeOtaghHa
                                ,  isnull( ( SELECT  COUNT(RoomID) AS TT3  FROM tblRooms  GROUP BY RoomStatuse  HAVING  (RoomStatuse = 2)) , 0) as  OtaghhaieRezerveShode
                                ,  isnull( (SELECT   COUNT(RoomID) AS TT4  FROM tblRooms  GROUP BY RoomStatuse  HAVING  (RoomStatuse = 3)) , 0) as  OtaghhaieTahvilShodeh
                                ,  isnull( (SELECT   COUNT(RoomID) AS TT5  FROM tblRooms  GROUP BY RoomStatuse  HAVING  (RoomStatuse = 1)) , 0) as  OtaghhaieAzad
                                ,  isnull( (SELECT   SUM(TotalDebtPayment) AS TT6  FROM         tblEECus) , 0) as DariaftieKol
                                ,  isnull( (SELECT   CntCount AS TT7 FROM  tblCounter GROUP BY CntCount)  , 0) as BazDidha");

        Label8.Text = dt.Rows[0][0].ToString();
        Label9.Text = dt.Rows[0][1].ToString();
        Label10.Text = dt.Rows[0][2].ToString();
        Label11.Text = dt.Rows[0][3].ToString();
        Label12.Text = dt.Rows[0][4].ToString();
        Label14.Text = Decimal.Parse(dt.Rows[0][5].ToString()).ToString("N0");
        Label15.Text = Decimal.Parse(dt.Rows[0][6].ToString()).ToString("N0");
    }
}
