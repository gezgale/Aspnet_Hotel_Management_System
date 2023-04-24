<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SysReports.aspx.cs" Inherits="SysReports" Title="Untitled Page" %>

<%@ Register Src="MainAdminCheker.ascx" TagName="MainAdminCheker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="margin-top: 30px; margin-bottom: 30px; background-color: #ffffff;" width="100%" cellpadding="5" cellspacing="5">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="16pt"
                    ForeColor="Navy" Style="margin-top: 20px" Text="صفحه مشاهده اطلاعات سیستمی"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تعداد کاربران:"></asp:Label></td>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تعداد اتاقها:"></asp:Label></td>
            <td>
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تعداد اتاقهای رزرو شده:"></asp:Label></td>
            <td>
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="اتاقهای در دست مشتری:"></asp:Label></td>
            <td>
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تعداد اتاقها آزاد:"></asp:Label></td>
            <td>
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="کل مبالغ دریافتی:"></asp:Label></td>
            <td>
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="کل بازدیدها:"></asp:Label></td>
            <td>
                <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#CC0066"></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Image ID="Image1" runat="server" Height="309px" ImageUrl="~/images/business-debt116.jpg"
                    Width="234px" /></td>
        </tr>
    </table>
    <uc1:MainAdminCheker ID="MainAdminCheker1" runat="server" />
</asp:Content>

