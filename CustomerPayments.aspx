<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerPayments.aspx.cs" Inherits="CustomerPayments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p id="TitleP" runat="server" style="font-size:x-large;" visible="false"></p>
    <asp:GridView ID="GrdPayments" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table-info" DataSourceID="LinqDataSource1" ForeColor="Black" GridLines="Vertical" PageSize="5" Width="100%" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="PaymentRowID" HeaderText="PaymentRowID" InsertVisible="False" SortExpression="PaymentRowID" Visible="False" />
            <asp:BoundField DataField="PayedPrice" HeaderText="مبلغ" SortExpression="PayedPrice" />
            <asp:BoundField DataField="PayedDate" HeaderText="PayedDate" SortExpression="PayedDate" Visible="False" />
            <asp:BoundField DataField="PayedDateShamsi" HeaderText="تاریخ پرداخت" SortExpression="PayedDateShamsi" />
            <asp:BoundField DataField="PayedDescription" HeaderText="شرح سند" SortExpression="PayedDescription" />
            <asp:BoundField DataField="CustomerUserID" HeaderText="CustomerUserID" SortExpression="CustomerUserID" Visible="False" />
            <asp:BoundField DataField="PayForTypeID" HeaderText="PayForTypeID" SortExpression="PayForTypeID" Visible="False" />
            <asp:BoundField DataField="PayState" HeaderText="بابت" SortExpression="PayState" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MainLscDataContext" EntityTypeName="" TableName="XtblCustomerPayments" Where="CustomerUserID == @CustomerUserID">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="CustomerUserID" SessionField="UserID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>

