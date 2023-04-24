<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReserveTicket.aspx.cs" Inherits="ReserveTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" dir="rtl" width="100%">
        <tr>
            <td colspan="2" dir="rtl" style="font-size: 13pt">
                <span style="font-size: 19pt"><span style="font-size: 8pt">
                    <br />
                    <br />
                    <br />
                </span>
                    <table style="width: 487px; font-size: xx-small;">
                        <tr>
                            <td style="text-align: right">
                                <strong><span style="font-size: 8pt">تاریخ رزرو بلیط:</span></strong></td>
                            <td dir="ltr" style="text-align: right">
                <span style="font-size: 10pt">
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" MaxLength="150" 
                                    Width="40px" Visible="False"></asp:TextBox><asp:DropDownList ID="Day1" runat="server" Width="49px">
                                </asp:DropDownList><asp:DropDownList ID="Month1" runat="server" Width="73px">
                                </asp:DropDownList><asp:DropDownList ID="Year1" runat="server" Width="56px">
                                </asp:DropDownList>
                </span>
                                                                            </td>
                            <td style="text-align: right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <strong><span style="font-size: 8pt">رزرو کننده:</span></strong></td>
                            <td style="text-align: right">
                                <asp:TextBox ID="TextBox2" runat="server" Enabled="False" MaxLength="150" Width="173px"></asp:TextBox><asp:TextBox
                                    ID="TextBox3" runat="server" MaxLength="150" Visible="False" Width="1px"></asp:TextBox></td>
                            <td style="text-align: right">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="نام رزرو کننده وارد نشده" Font-Size="8pt"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <span style="font-size: 8pt"><strong>سرویس:</strong></span></td>
                            <td style="text-align: right">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Width="173px" OnTextChanged="DropDownList1_TextChanged" Height="20px">
                                </asp:DropDownList></td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Size="8pt" Width="100%" Font-Names="Tahoma"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <strong><span style="font-size: 8pt">تعداد صندلی:</span></strong></td>
                            <td dir="ltr" style="text-align: right">
                                <asp:TextBox
                                    ID="TextBox4" runat="server" MaxLength="150" Width="173px"></asp:TextBox>
                            </td>
                            <td style="text-align: right">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4"
                                    ErrorMessage="تعداد صندلی وارد نشده" Font-Size="8pt"></asp:RequiredFieldValidator>
                <span style="font-size: 19pt">
                                <asp:RangeValidator ID="RangeValidator3" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="لطفا فقط مقدار عددی وارد نمایید" 
                                    MaximumValue="9999999999999999" MinimumValue="0" Type="Currency" 
                                    style="font-size: 8pt"></asp:RangeValidator>
                </span>
                                                                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <strong><span style="font-size: 8pt">مبلغ بلیط:</span></strong></td>
                            <td dir="ltr" style="text-align: right">
                                <span style="font-size: 8pt">
                                <asp:Button ID="BtnCalc" runat="server" OnClick="BtnCalc_Click" Text="محاسبه" style="font-size: 10pt" ValidationGroup="Calc" />
                                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="150" Width="173px" Enabled="False"></asp:TextBox></span></td>
                            <td>
                <span style="font-size: 19pt" >
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="لطفا فقط مقدار عددی وارد نمایید" 
                                    MaximumValue="9999999999999999" MinimumValue="0" Type="Currency" 
                                    style="font-size: 8pt"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5"
                                    ErrorMessage="مبلغ وارد نشده" Font-Size="8pt"></asp:RequiredFieldValidator>
                </span>
                            </td>
                        </tr>
                </span>
                        <tr>
                            <td style="text-align: right">
                                <span style="font-family: Tahoma; font-size: 8pt; font-weight: bold">شماره فيش</span><span style="font-size: 19pt"><strong><span style="font-size: 8pt">:</span></strong></td>
                            <td dir="ltr" style="text-align: right; font-size: xx-small; font-weight: 700;">
                <span style="font-size: 19pt">
                                <span style="font-size: 8pt">
                                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="150" Width="173px"></asp:TextBox></span>
                </span>
                            </td>
                            <td style="font-size: xx-small; font-weight: 700; text-align: right">
                <span >
                                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                    ControlToValidate="TextBox7" ErrorMessage="لطفا فقط مقدار عددی وارد نمایید" 
                                    MaximumValue="9999999999999999" MinimumValue="0" Type="Currency" 
                                    style="font-size: 8pt"></asp:RangeValidator>
                </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <strong><span style="font-size: 8pt">ملاحظات:</span></strong></td>
                            <td style="text-align: right">
                                <asp:TextBox ID="TextBox6" runat="server" Height="57px" MaxLength="150" TextMode="MultiLine"
                                    Width="253px"></asp:TextBox></td>
                            <td style="font-size: xx-small">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px; text-align: right" colspan="2">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="خرید (نقدی)" style="font-size: 10pt" />
                                <asp:Button ID="BtnOnlinePay" runat="server" OnClick="BtnOnlinePay_Click" Text="پرداخت آنلاین" style="font-size: 10pt" />
                            </td>
                            <td style="height: 20px">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="#CC0033"
                                    Text="Label" Visible="False" Width="134px"></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE"
                        BorderStyle="None" BorderWidth="1px" CellPadding="0" Font-Size="8pt" ForeColor="Black"
                        GridLines="Vertical" Width="98%">
                        <Columns>
                            <asp:BoundField DataField="RIDSD" HeaderText="کد رزرو" />
                            <asp:TemplateField HeaderText="چاپ بلیط">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/PrintTicket.aspx?ID=" +  Eval("RIDSD") %>' Text='<%# "چاپ بلیط جاری" %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                </span>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">
            </td>
            <td style="height: 20px">
            </td>
        </tr>
    </table>
</asp:Content>