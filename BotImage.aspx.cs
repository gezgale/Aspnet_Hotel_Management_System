using System;
using System.Collections;
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
using System.Drawing;

public partial class BotImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap objBMP = new System.Drawing.Bitmap(90, 20);
        Graphics objGraphics = System.Drawing.Graphics.FromImage(objBMP);
        objGraphics.Clear(Color.Green);
        objGraphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;

        //تنظیم فونت نوشته روی عکس
        Font objFont = new Font("Arial", 11, FontStyle.Bold);

        //ساخت رشته تصادفی 5 رقمی 
        string randomStr = "";
        Random autoRand = new Random();
        randomStr = Convert.ToString(autoRand.Next(100, 999));

        //اضافه کردن متن در سسشن 
        Session.Add("MyRanNump", randomStr);

        //نوشتن متن
        objGraphics.DrawString(randomStr, objFont, Brushes.White, 6, 3);

        //تنظیم نوع عکس و برگرداندن آن به عنوان خروجی
        Response.ContentType = "image/GIF";
        try
        {
            for (int i = 0; i <= objBMP.Width - 1; i += 4)
            {
                for (int j = 0; j <= objBMP.Height - 1; j += 4)
                {
                    objBMP.SetPixel(i, j, Color.Black);
                    objBMP.SetPixel(i + 1, j, Color.Black);
                }
            }
        }
        catch
        { }

        objBMP.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);

        //آزاد کردن منابع
        objFont.Dispose();
        objGraphics.Dispose();
        objBMP.Dispose();
    }
}
