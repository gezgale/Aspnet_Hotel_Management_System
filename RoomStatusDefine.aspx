<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RoomStatusDefine.aspx.cs" Inherits="RoomStatusDefine" Title="Untitled Page" %>

<%@ Register Src="MainAdminCheker.ascx" TagName="MainAdminCheker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" style="margin: 10px; width: 489px">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="16pt"
                    ForeColor="#990066" Style="margin-top: 20px" Text="صفحه ثبت وضعیت اتاقها"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="وضعیت اتاق:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    ValidationGroup="0"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="لطفا مقدار وضعیت اتاق را وارد نمائید" ValidationGroup="0">***</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="درج" ValidationGroup="0"
                    Width="89px" /></td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 315px; text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
                    BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="StatID" DataSourceID="SqlDataSource1"
                    Font-Names="Tahoma" Font-Size="8pt" GridLines="None" Width="100%">
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <Columns>
                        <asp:CommandField CancelText="لغو" DeleteText="حذف" EditText="ویرایش" HeaderText="ویرایش"
                            ShowEditButton="True" UpdateText="بروزرسانی" />
                        <asp:BoundField DataField="StatID" HeaderText="StatID" InsertVisible="False" ReadOnly="True"
                            SortExpression="StatID" Visible="False" />
                        <asp:BoundField DataField="RoomStatuseDesc" HeaderText="وضعیت اتاق" SortExpression="RoomStatuseDesc" />
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    DeleteCommand="DELETE FROM tblRoomState WHERE (StatID = @StatID)" SelectCommand="SELECT StatID, RoomStatuseDesc FROM tblRoomState ORDER BY StatID DESC"
                    UpdateCommand="UPDATE tblRoomState SET RoomStatuseDesc = @RoomStatuseDesc WHERE (StatID = @StatID)">
                    <DeleteParameters>
                        <asp:Parameter Name="StatID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RoomStatuseDesc" />
                        <asp:Parameter Name="StatID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/room_TT.jpg" /></td>
        </tr>
        <tr>
            <td style="text-align: center">
            </td>
            <td style="text-align: center">
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
            </td>
            <td style="text-align: center">
                <uc1:MainAdminCheker ID="MainAdminCheker1" runat="server" />
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

