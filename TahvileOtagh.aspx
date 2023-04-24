<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TahvileOtagh.aspx.cs" Inherits="TahvileOtagh" Title="Untitled Page" %>

<%@ Register Src="MainAdminCheker.ascx" TagName="MainAdminCheker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        &nbsp;</center>
    <center>
        <asp:Panel ID="Panel1" runat="server" Style="margin-top: 10px; margin-bottom: 10px" Width="581px">
            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="20pt"
                ForeColor="#FF0066" Style="margin-top: 20px" Text="صفحه ثبت تحویل اتاق به مشتری"></asp:Label><br />
        <table align="center" style="margin-top: 20px; width: 409px; background-color: white">
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                        ForeColor="#FF0066" Text="آیا مشتری قبلا اتاق رزرو نموده است؟"></asp:Label>
                </td>
                <td colspan="2" style="text-align: center; width: 166px;">
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                        Height="25px" OnClick="Button1_Click" Text="بله" Width="60px" />
                    <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                        Height="25px" OnClick="Button2_Click" Text="خیر" Width="60px" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="2" style="width: 166px">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/yesno.jpg" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="2" style="width: 166px">
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Style="margin-top: 10px; margin-bottom: 10px"
        Visible="False">
    <table align="center" style="margin-top: 10px; margin-bottom: 10px;" width="500">
        <tr>
            <td style="text-align: center" colspan="3">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نام کاربری مشتری:"></asp:Label>
            </td>
            <td style="text-align: right">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="UserName" DataValueField="UserID" Font-Names="Tahoma" Font-Size="8pt"
                    ValidationGroup="11" Width="130px">
                </asp:DropDownList>&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    SelectCommand="SELECT UserID, UserName FROM tblUsers WHERE (UserName <> N'admin')">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                    ErrorMessage="نام کاربری مشتری وارد نشده است" ValidationGroup="11">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="کد اتاق:"></asp:Label></td>
            <td style="text-align: right">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="RoomNumber" DataValueField="RoomID" Font-Names="Tahoma" Font-Size="8pt"
                    ValidationGroup="11" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="130px" AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="#FF0033" Text="اطلاعات اتاقها"></asp:Label><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    SelectCommand="SELECT RoomID, RoomNumber FROM tblRooms WHERE (RoomStatuse = 1)">
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2"
                    ErrorMessage="کد اتاق وارد نشده است" ValidationGroup="11">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تاریخ ورود:"></asp:Label></td>
            <td dir="ltr" style="text-align: right">
                <asp:TextBox ID="TextBox1" runat="server" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="11"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="تاریخ ورود ثبت نشده است" ValidationGroup="11">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="قالبت تاریخ صحیح وارد نشده است. مثال: 1389/09/03" ValidationExpression="^\d{4}\/\d{2}\/\d{2}$"
                    ValidationGroup="11">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="بیعانه پرداختی:"></asp:Label></td>
            <td style="text-align: right">
                <asp:TextBox ID="TextBox2" runat="server" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="11"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="بیعانه وارد نشده است" ValidationGroup="11">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="text-align: right">
                <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Height="25px" Text="ثبت ورود مشتری" ValidationGroup="11" Width="119px" OnClick="Button3_Click" /></td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Image ID="Image2" runat="server" Height="160px" ImageUrl="~/images/rotatoil.png"
                    Width="169px" /></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center" dir="ltr">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Tahoma"
                    Font-Size="8pt" ValidationGroup="11" />
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
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Style="margin-top: 10px; margin-bottom: 10px"
        Visible="False">
        <table style="margin-top: 10px; margin-bottom: 10px; width: 501px">
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                        Visible="False"></asp:Label></td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="کد رزروی مشتری:"></asp:Label></td>
                <td style="text-align: right">
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
                        DataTextField="NameSname" DataValueField="RezrveID" Font-Names="Tahoma" Font-Size="8pt" Width="130px" ValidationGroup="55">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                        SelectCommand="SELECT RezrveID, NameSname  FROM XtblReserverForCombo ORDER BY RezrveID DESC"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList3"
                        ErrorMessage="کد رزروی مشتری انتخاب نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="تاریخ ورود:"></asp:Label></td>
                <td style="text-align: right" dir="ltr">
                    <asp:TextBox ID="TextBox4" runat="server" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="55"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4"
                        ErrorMessage="تاریخ ورود ثبت نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4"
                            ErrorMessage="قالبت تاریخ صحیح وارد نشده است. مثال: 1389/09/03" ValidationExpression="^\d{4}\/\d{2}\/\d{2}$"
                            ValidationGroup="55">*</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Text="بیعانه پرداختی:"></asp:Label></td>
                <td style="text-align: right">
                    <asp:TextBox ID="TextBox3" runat="server" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="55"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox3"
                        ErrorMessage="بیعانه وارد نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="text-align: right">
                </td>
                <td style="text-align: right">
                    <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                        Height="25px" Text="ثبت ورود مشتری" Width="119px" OnClick="Button4_Click" ValidationGroup="55" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Image ID="Image3" runat="server" Height="160px" ImageUrl="~/images/1194984804920155521biohazard_symbol_01.svg.med.png"
                        Width="169px" /></td>
            </tr>
            <tr>
                <td style="text-align: right">
                </td>
                <td dir="ltr" style="text-align: right">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" Font-Names="Tahoma"
                        Font-Size="8pt" ValidationGroup="55" />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </asp:Panel>
        <uc1:MainAdminCheker ID="MainAdminCheker1" runat="server" />
    </center>
</asp:Content>

