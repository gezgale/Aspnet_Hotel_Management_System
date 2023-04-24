<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="height: 243px" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="3" rowspan="3" style="background-position: center center; background-image: url(images/green_banner.jpg);
                background-repeat: no-repeat; height: 395px; background-color: white;">
                <table align="center" style="margin-top: 200px; width: 281px; margin-right: 120px">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                Text="نام کاربری:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                Width="100px"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="نام کاربری وارد نشده است">***</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                Text="کلمه عبور:"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                TextMode="Password" Width="100px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="کلمه عبور وارد نشده است">***</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                                OnClick="Button1_Click" Text="ورود" Width="76px" /></td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="Smaller"
                                ShowMessageBox="True" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </table>
</asp:Content>
