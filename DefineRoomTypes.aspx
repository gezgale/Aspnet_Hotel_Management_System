<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DefineRoomTypes.aspx.cs" Inherits="DefineRoomTypes" Title="Untitled Page" %>

<%@ Register Src="MainAdminCheker.ascx" TagName="MainAdminCheker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" style="margin: 10px; width: 489px">
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="16pt"
                    ForeColor="#990066" Style="margin-top: 20px" Text="ثبت نوع اتاقها"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                    Text="نوع اتاق:"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" ValidationGroup="0"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="لطفا مقدار نوع اتاق را وارد نمائید" ValidationGroup="0">***</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="درج" Width="89px" ValidationGroup="0" /></td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomTypeID"
                    DataSourceID="SqlDataSource1" Width="391px" AllowPaging="True" AllowSorting="True" CellPadding="4" Font-Names="Tahoma" Font-Size="8pt" ForeColor="#333333" GridLines="None" PageSize="25">
                    <Columns>
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" HeaderText="ویرایش رکورد" ShowEditButton="True"
                            UpdateText="بروز رسانی" />
                        <asp:BoundField DataField="RoomTypeID" HeaderText="RoomTypeID" InsertVisible="False"
                            ReadOnly="True" SortExpression="RoomTypeID" Visible="False" />
                        <asp:BoundField DataField="RoomTypeDescription" HeaderText="نوع اتاق" SortExpression="RoomTypeDescription" />
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف رکورد" ShowDeleteButton="True" />
                    </Columns>
                    <RowStyle BackColor="#EFF3FB" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView></center>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    DeleteCommand="DELETE FROM tblRoomTypes WHERE (RoomTypeID = @RoomTypeID)" SelectCommand="SELECT RoomTypeID, RoomTypeDescription FROM tblRoomTypes"
                    UpdateCommand="UPDATE tblRoomTypes SET RoomTypeDescription = @RoomTypeDescription WHERE (RoomTypeID = @RoomTypeID)">
                    <DeleteParameters>
                        <asp:Parameter Name="RoomTypeID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RoomTypeDescription" />
                        <asp:Parameter Name="RoomTypeID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="text-align: center">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/room_Fang.jpg" /></td>
            <td>
            </td>
        </tr>
    </table>
    <uc1:MainAdminCheker ID="MainAdminCheker1" runat="server" />
</asp:Content>

