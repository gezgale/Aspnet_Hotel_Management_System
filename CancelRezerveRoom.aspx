<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CancelRezerveRoom.aspx.cs" Inherits="CancelRezerveRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td colspan="2" style="font-family:Tahoma; font-size:x-large; color:brown;align-content:center;font-weight:bolder;text-align:center;">آیا نسبت به عمل لغو رزرو اطمینان دارید؟</td>
        </tr>
        <tr>
            <td colspan="2" style="font-family:Tahoma; text-align:center;">
                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="text-info font-weight-bold" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><center><asp:Button ID="Button1" runat="server" Text="بازگشت به صفحه رزروهای انجام شده" class="btn btn-success" OnClick="Button1_Click" /></center></td>
            <td><center><asp:Button ID="BtnCancel" runat="server" Text="تائید لغو رزرو و آزاد سازی اتاق" class="btn btn-danger" OnClick="BtnCancel_Click" /></center></td>
        </tr>
    </table>

</asp:Content>

