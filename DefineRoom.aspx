<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DefineRoom.aspx.cs" Inherits="DefineRoom" Title="Untitled Page" %>

<%@ Register Src="MainAdminCheker.ascx" TagName="MainAdminCheker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table align="center" style="margin: 10px;" width="95%">
        <tr>
            <td colspan="3" style="text-align: center">
                <span style="font-size: 16pt; font-family: Tahoma"><strong>تعریف اتاقهای هتل</strong></span></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="کد اتاق:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="55"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="کد اتاق وارد نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="در فیلد کد اتاق فقط عدد و حروف انگلیسی قابل وارد شدن هستند" ValidationExpression="^[a-zA-Z0-9]+$"
                    ValidationGroup="55">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نوع اتاق:"></asp:Label></td>
            <td>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="RoomTypeDescription" DataValueField="RoomTypeID" Font-Names="Tahoma" Font-Size="8pt" Width="146px" ValidationGroup="55">
    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
        SelectCommand="SELECT RoomTypeID, RoomTypeDescription FROM tblRoomTypes"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1"
                    ErrorMessage="نوع اتاق انتخاب نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="تعداد تخت خواب:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="55"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="تعداد تختهای اتاق وارد نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="در فیلد تعداد تخت خواب فقط  می توانید عدد وارد نمائید" ValidationExpression="^[0-9]+$"
                    ValidationGroup="55">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="مبلغ هر شب اقامت:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="55"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="قیمت اقامت هر شب در اتاق وارد نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="مبلغ یک مقدار عددی است که میتواند اعشاری نیز باشد" Font-Names="Tahoma"
                    Font-Size="7pt" ValidationExpression="^\d*\.?\d*$" ValidationGroup="55">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="وضعیت اتاق:"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="RoomStatuseDesc" DataValueField="StatID" Font-Names="Tahoma" Font-Size="8pt"
                    Width="146px" ValidationGroup="55">
                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    SelectCommand="SELECT StatID, RoomStatuseDesc FROM tblRoomState"></asp:SqlDataSource>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2"
                    ErrorMessage="کد اتاق وارد نشده است" ValidationGroup="55">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="درج" Width="78px" OnClick="Button1_Click" ValidationGroup="55" />&nbsp;
                <asp:Button ID="Button2" runat="server" Text="بازنشانی" Width="78px" CausesValidation="False" /></td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Tahoma" Font-Size="Smaller" ValidationGroup="55" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
                    BorderWidth="1px" CellPadding="3" DataKeyNames="RoomID" DataSourceID="SqlDataSource3"
                    Font-Names="Tahoma" Font-Size="7pt" GridLines="Vertical" Width="100%">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف" ShowDeleteButton="True" />
                        <asp:BoundField DataField="RoomID" HeaderText="RoomID" InsertVisible="False" ReadOnly="True"
                            SortExpression="RoomID" Visible="False" />
                        <asp:BoundField DataField="RoomNumber" HeaderText="کد اتاق" SortExpression="RoomNumber" />
                        <asp:TemplateField HeaderText="نوع اتاق">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource8"
                                    DataTextField="RoomTypeDescription" DataValueField="RoomTypeID" SelectedValue='<%# Bind("RoomType") %>'>
                                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                                    SelectCommand="SELECT RoomTypeID, RoomTypeDescription FROM tblRoomTypes ORDER BY RoomTypeID">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource7"
                                    DataTextField="RoomTypeDescription" DataValueField="RoomTypeID" Enabled="False"
                                    Font-Names="Tahoma" Font-Size="8pt" SelectedValue='<%# Bind("RoomType") %>'>
                                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                                    SelectCommand="SELECT RoomTypeID, RoomTypeDescription FROM tblRoomTypes ORDER BY RoomTypeID">
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RoomBed" HeaderText="تعداد تخت" SortExpression="RoomBed" />
                        <asp:BoundField ApplyFormatInEditMode="True" DataField="PriceOfPerNight" HeaderText="مبلغ هر شب"
                            SortExpression="PriceOfPerNight" />
                        <asp:TemplateField HeaderText="وضعیت" SortExpression="RoomStatuse">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="RoomStatuseDesc" DataValueField="StatID" SelectedValue='<%# Bind("RoomStatuse") %>'>
                                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                                    SelectCommand="SELECT StatID, RoomStatuseDesc FROM tblRoomState"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="RoomStatuseDesc" DataValueField="StatID" Enabled="False" Font-Names="Tahoma"
                                    Font-Size="8pt" SelectedValue='<%# Bind("RoomStatuse") %>'>
                                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                                    SelectCommand="SELECT StatID, RoomStatuseDesc FROM tblRoomState"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" HeaderText="ویرایش" ShowEditButton="True"
                            UpdateText="بروز" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    DeleteCommand="DELETE FROM tblRooms WHERE (RoomID = @RoomID)" SelectCommand="SELECT RoomID, RoomNumber, RoomType, RoomBed, PriceOfPerNight, RoomStatuse FROM tblRooms ORDER BY RoomID DESC"
                    UpdateCommand="UPDATE tblRooms SET RoomNumber = @RoomNumber, RoomType = @RoomType, RoomBed = @RoomBed, PriceOfPerNight = CONVERT(money, @PriceOfPerNight), RoomStatuse = @RoomStatuse WHERE (RoomID = @RoomID)">
                    <DeleteParameters>
                        <asp:Parameter Name="RoomID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RoomNumber" />
                        <asp:Parameter Name="RoomType" />
                        <asp:Parameter Name="RoomBed" />
                        <asp:Parameter Name="PriceOfPerNight" />
                        <asp:Parameter Name="RoomStatuse" />
                        <asp:Parameter Name="RoomID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="3">
                <uc1:MainAdminCheker ID="MainAdminCheker1" runat="server" />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/room_uu.jpg" /></td>
        </tr>
    </table>
</asp:Content>

