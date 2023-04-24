<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUsers.aspx.cs" Inherits="EditUsers" Title="Untitled Page" %>

<%@ Register Src="MainAdminCheker.ascx" TagName="MainAdminCheker" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" height="100%" style="margin: 10px; width: 502px">
        <tr>
            <td colspan="3" rowspan="1" style="vertical-align: top; text-align: center">
                <span style="font-size: 16pt; font-family: Tahoma"><strong>ویرایش مشخصات کاربران عضو
                    در سیستم</strong></span></td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; text-align: center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="UserID" DataSourceID="SqlDataSource1" Font-Names="Tahoma" Font-Size="7pt"
                    ForeColor="#333333" GridLines="None" Width="529px">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" HeaderText="ویرایش" ShowEditButton="True"
                            UpdateText="بروزرسانی" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True"
                            SortExpression="UserID" Visible="False" />
                        <asp:TemplateField HeaderText="نام کاربری" SortExpression="UserName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UsePassChar" HeaderText="کلمه عبور" SortExpression="UsePassChar" />
                        <asp:BoundField DataField="NameCS" HeaderText="نام" SortExpression="NameCS" />
                        <asp:BoundField DataField="SnameCS" HeaderText="فامیل" SortExpression="SnameCS" />
                        <asp:BoundField DataField="Phone" HeaderText="تلفن" SortExpression="Phone" />
                        <asp:BoundField DataField="Mobile" HeaderText="موبایل" SortExpression="Mobile" />
                        <asp:TemplateField HeaderText="نوع کاربر" SortExpression="UserTypeID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1Ut2" DataTextField="UserTypeDescription" DataValueField="UsertypeID" SelectedValue='<%# Bind("UserTypeID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="LinqDataSource1Ut2" runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" OrderBy="UsertypeID" TableName="tblUserTypes">
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DrpUserTypes" runat="server" DataSourceID="LinqDataSource1UT" DataTextField="UserTypeDescription" DataValueField="UsertypeID" Enabled="False" SelectedValue='<%# Bind("UserTypeID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="LinqDataSource1UT"  runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" OrderBy="UsertypeID" TableName="tblUserTypes">
                                </asp:LinqDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ایمیل" SortExpression="UserMail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtEmailOfUsersss" runat="server" Enabled="False" Text='<%# Bind("UserMail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserMail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserWebSite" HeaderText="وب سایت" SortExpression="UserWebSite" />
                        <asp:CommandField DeleteText="حذف" HeaderText="حذف" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelConString %>"
                    DeleteCommand="DELETE FROM tblUsers WHERE (UserID = @UserID)" SelectCommand="SELECT UserID, UserName, UsePassChar, NameCS, SnameCS, Phone, Mobile, UserTypeID, UserMail, UserWebSite FROM tblUsers WHERE (UserName <> N'admin') ORDER BY UserID DESC"
                    UpdateCommand="UPDATE tblUsers SET  UsePassChar = @UsePassChar, NameCS = @NameCS, SnameCS = @SnameCS, Phone = @Phone, Mobile = @Mobile, UserTypeID = @UserTypeID, UserMail = @UserMail, UserWebSite = @UserWebSite WHERE (UserID = @UserID)">
                    <DeleteParameters>
                        <asp:Parameter Name="UserID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UsePassChar" />
                        <asp:Parameter Name="NameCS" />
                        <asp:Parameter Name="SnameCS" />
                        <asp:Parameter Name="Phone" />
                        <asp:Parameter Name="Mobile" />
                        <asp:Parameter Name="UserTypeID" />
                        <asp:Parameter Name="UserMail" />
                        <asp:Parameter Name="UserWebSite" />
                        <asp:Parameter Name="UserID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="vertical-align: top; text-align: center">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/people.png" Style="margin: 10px" />
                <uc1:MainAdminCheker ID="MainAdminCheker1" runat="server" /></td>
        </tr>
    </table>
</asp:Content>

