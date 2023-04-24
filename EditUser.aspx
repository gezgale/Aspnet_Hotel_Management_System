<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="EditUser" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" height="100%" style="background-color: buttonface" width="100%">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="16pt"
                    ForeColor="#404000" Style="margin-top: 20px" Text="ویرایش مشخصات کاربری"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نام کاربری:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtUserName" runat="server" Enabled="False" Font-Bold="True" Font-Names="Tahoma"
                    Font-Size="8pt"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUserName"
                    ErrorMessage="نام کاربری وارد نشده است">***</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="کلمه عبور:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtPassword" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtPassword"
                    ErrorMessage="کلمه عبور وارد نشده است">***</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtPassword"
                    ControlToValidate="TxtPasswordRepeat" ErrorMessage="مقدار کلمه عبور و تکرار آن با هم مطابقت ندارند">**</asp:CompareValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تکرار کلمه عبور:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtPasswordRepeat" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPasswordRepeat"
                    ErrorMessage="تکرار کلمه عبور وارد نشده است">***</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="آدرس ایمیل:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtEmail" runat="server" Enabled="False" Font-Bold="True" Font-Names="Tahoma"
                    Font-Size="8pt"></asp:TextBox>
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtEmail"
                    ErrorMessage="آدرس ایمیل وارد نشده است">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail"
                        ErrorMessage="آدرس ایمیل معتبر نمی باشد" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">***</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="وب سایت:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtWebsite" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نام:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtName" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نام خانوادگی:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtSName" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تلفن:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtPhoneNumber" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تلفن همراه:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtMobile" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
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
            <td style="height: 26px">
            </td>
            <td style="height: 26px">
                <asp:Button ID="BtnSave" runat="server" OnClick="Button1_Click" Text="ثبت تغییرات"
                    Width="132px" Font-Bold="True" Font-Names="Tahoma" />
            </td>
            <td style="height: 26px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Tahoma"
                    Font-Size="8pt" ShowMessageBox="True" />
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
    </table>
</asp:Content>

