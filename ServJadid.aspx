<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ServJadid.aspx.cs" Inherits="ServJadid" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" dir="rtl" width="100%">
        <tr>
            <td colspan="2" dir="rtl" style="font-size: 13pt; height: 53px">
                <table style="font-size: 9pt; width: 515px">
                    <tr>
                        <td style="height: 20px; text-align: right">
                            مبدا:</td>
                        <td style="height: 20px; text-align: right">
                            <asp:DropDownList ID="DrpFromCity" runat="server" DataSourceID="LinqDataSource1" DataTextField="Name" DataValueField="CountryCityID">
                            </asp:DropDownList>
                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" TableName="tblCountryCities">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; text-align: right">
                            مقصد:</td>
                        <td style="height: 20px; text-align: right">
                            <asp:DropDownList ID="DrpToCity" runat="server" DataSourceID="LinqDataSource2" DataTextField="Name" DataValueField="CountryCityID">
                            </asp:DropDownList>
                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" TableName="tblCountryCities">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px; text-align: right">
                            شرح سرویس:</td>
                        <td style="height: 20px; text-align: right">
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="500" Width="180px" 
                                ValidationGroup="22"></asp:TextBox>
                <span style="font-size: 19pt">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="شرح سوریس وارد نشده" Font-Size="8pt" 
                                ValidationGroup="22"></asp:RequiredFieldValidator>
                </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            تاریخ سرویس:</td>
                        <td style="text-align: right">
                <span style="font-size: 10pt">
                            <asp:DropDownList ID="Day1" runat="server" Width="49px">
                                </asp:DropDownList><asp:DropDownList ID="Month1" runat="server" Width="73px">
                                </asp:DropDownList><asp:DropDownList ID="Year1" runat="server" Width="56px">
                                </asp:DropDownList>
                </span>
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" Width="22px" 
                                Visible="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            ظرفیت مسافر:</td>
                        <td style="text-align: right">
                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="3" Width="180px" 
                                ValidationGroup="22"></asp:TextBox>
                <span style="font-size: 19pt" >
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="لطفا فقط مقدار عددی وارد نمایید" 
                                    MaximumValue="9999999999999999" MinimumValue="0" Type="Double" 
                                    style="font-size: 8pt" ValidationGroup="22"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox3"
                                    ErrorMessage="ظرفیت وارد نشده" Font-Size="8pt" ValidationGroup="22"></asp:RequiredFieldValidator>
                </span>
                                                                            </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            قیمت هر بلیط:</td>
                        <td style="text-align: right">
                            <asp:TextBox ID="TxtTicketPrice" runat="server" MaxLength="10" Width="180px" 
                                ValidationGroup="22"></asp:TextBox>
                <span style="font-size: 19pt" >
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtTicketPrice"
                                    ErrorMessage="مبلغ وارد نشده است" Font-Size="8pt" ValidationGroup="22"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                    ControlToValidate="TxtTicketPrice" ErrorMessage="لطفا فقط مقدار عددی وارد نمایید" 
                                    MaximumValue="9999999999999999" MinimumValue="0" Type="Double" 
                                    style="font-size: 8pt" ValidationGroup="22"></asp:RangeValidator>
                </span>
                                                                            </td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                        </td>
                        <td style="height: 26px; text-align: right">
                            <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt"
                                Height="27px" OnClick="Button1_Click" Text="درج سرویس" 
                                ValidationGroup="22" CssClass="btn-danger" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: 13pt;font-weight:bold;">
                <center>
                    <asp:Label ID="LblMessage" Visible="false" runat="server" CssClass="alert-danger" Text="Label"></asp:Label>
                </center>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: 13pt">
                <span style="font-size: 19pt">لیست پروازهای ایجاد شده<br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="0" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#333333"
                        GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="600px" DataKeyNames="ServiceID">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:CommandField CancelText="لغو" EditText="ویرایش" ShowEditButton="True" UpdateText="بروز رسانی" />
                            <asp:BoundField DataField="ServiceID" HeaderText="کد سرویس" ReadOnly="True" />
                            <asp:BoundField DataField="ServiceDescript" HeaderText="شرح سرویس" />
                            <asp:BoundField DataField="ServiceDate" HeaderText="تاریخ سرویس" />
                            <asp:BoundField DataField="Quantity" HeaderText="ظرفیت مسافر" />
                            <asp:TemplateField HeaderText="مبدا">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource101" DataTextField="Name" DataValueField="CountryCityID" SelectedValue='<%# Eval("FromCityID") %>' Enabled="false">
                                    </asp:DropDownList>
                                    <asp:LinqDataSource ID="LinqDataSource101" runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" TableName="tblCountryCities">
                                    </asp:LinqDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="مقصد">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource122" DataTextField="Name" DataValueField="CountryCityID" SelectedValue='<%# Eval("ToCityID") %>' Enabled="false">
                                    </asp:DropDownList>
                                    <asp:LinqDataSource ID="LinqDataSource122" runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" TableName="tblCountryCities">
                                    </asp:LinqDataSource>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="ExpireBit" HeaderText="منقضی" />
                            <asp:CommandField DeleteText="حذف" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    &nbsp;<br />
                    &nbsp;</span><br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>




</asp:Content> 
