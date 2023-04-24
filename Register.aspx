<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" height="100%" style="background-color: buttonface" width="100%">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="16pt"
                    ForeColor="Navy" Style="margin-top: 20px" Text="صفحه ثبت مشخصات مشتری"></asp:Label></td>
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
                <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
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
                    TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="کلمه عبور وارد نشده است">***</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                    ControlToValidate="TextBox3" ErrorMessage="مقدار کلمه عبور و تکرار آن با هم مطابقت ندارند">**</asp:CompareValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تکرار کلمه عبور:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="تکرار کلمه عبور وارد نشده است">***</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="آدرس ایمیل:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox>
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                    ErrorMessage="آدرس ایمیل وارد نشده است">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4"
                        ErrorMessage="آدرس ایمیل معتبر نمی باشد" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">***</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="وب سایت:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5"
                    ErrorMessage="آدرس وب سایت معتبر نمی باشد" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">***</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نام:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نام خانوادگی:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تلفن:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تلفن همراه:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" Font-Bold="True" Font-Names="Tahoma"
                    Font-Size="8pt" Text="ورود بعد از ثبت نام" /></td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 26px">
            </td>
            <td style="height: 26px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ثبت نام" Width="67px" />
                <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click"
                    Text="بازنشانی" Width="62px" /></td>
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

