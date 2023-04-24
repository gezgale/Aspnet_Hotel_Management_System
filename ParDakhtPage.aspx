<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ParDakhtPage.aspx.cs" Inherits="ParDakhtPage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="نام"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="شماره کارت 12 رقمی یا 16 رقمی"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="11"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="ورود شماره کارت الزامی می باشد" 
                    ValidationGroup="11"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="کد CVV2:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" ValidationGroup="11"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="ورود کد CVV2 الزامی می باشد" 
                    ValidationGroup="11"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="رمز دوم کارت:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" ValidationGroup="11"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="ورود رمز دوم الزامی می باشد" 
                    ValidationGroup="11"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="مبلغ:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtPrice" runat="server" ValidationGroup="11" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TxtPrice" ErrorMessage="ورود مبلغ الزامی می باشد" 
                    ValidationGroup="11"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lbl_Capcha" runat="server" Text="فیلد امنیتی:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txt_Capcha" runat="server" ValidationGroup="11"></asp:TextBox>
            </td>
            <td>
                <asp:Image ID="Image2" runat="server" Height="20px" 
                    ImageUrl="~/BotImage.aspx" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Txt_Capcha" ErrorMessage="ورود فیلد امنیتی الزامی است" 
                    ValidationGroup="11"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Lbl_Massege" runat="server" Font-Bold="True" Font-Size="Large" 
                    ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Btn_Pardakht" runat="server" onclick="Btn_Pardakht_Click" 
                    Text="پرداخت" Width="93px" ValidationGroup="11" />
                <asp:Button ID="Btn_Cancel" runat="server" onclick="Btn_Cancel_Click" 
                    Text="لغو پرداخت" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

