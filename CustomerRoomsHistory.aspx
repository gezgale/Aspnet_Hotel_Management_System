<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerRoomsHistory.aspx.cs" Inherits="CustomerRoomsHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p id="TitleP" runat="server" style="font-size:x-large;" visible="false"></p>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="EnID" GridLines="Vertical" PageSize="5" AutoGenerateColumns="False" ForeColor="Black" OnPageIndexChanging="GridView2_PageIndexChanging" Width="100%">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="وضعیت">
                <ItemTemplate>
                    شماره اتاق:
                    <asp:Label ID="RoomNumberLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("RoomNumber") %>' />
                    نوع اتاق:
                    <asp:Label ID="RoomTypeDescriptionLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("RoomTypeDescription") %>' />
                    تعداد تخت:
                    <asp:Label ID="RoomBedLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("RoomBed") %>' />
                    <br />
                    مبلغ هر شب:
                    <asp:Label ID="PriceOfPerNightLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("PriceOfPerNight") %>' />
                    <br />
                    طبقه:
                    <asp:Label ID="RoomFloorTitleLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("RoomFloorTitle") %>' />
                    بیعانه پرداختی:
                    <asp:Label ID="FirstPaymentLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("FirstPayment") %>' />
                    مدت اقامت:
                    <asp:Label ID="StayNightsLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("StayNights") %>' />
                    <br />
                    مبلغ کل:
                    <asp:Label ID="ToTalPriceOfStayLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("ToTalPriceOfStay") %>' />
                    مبلغ سایر خدمات:
                    <asp:Label ID="PriceOfOtherServicesLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("PriceOfOtherServices") %>' />
                    تخفیف:
                    <asp:Label ID="DiscountOfCustomerLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("DiscountOfCustomer") %>' />
                    <br />
                    مبلغ کل قابل پرداخت:
                    <asp:Label ID="TotalDebtPaymentLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("TotalDebtPayment") %>' />
                    <br />
                    وضعیت:
                    <asp:Label ID="StateOfMainRoomLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("StateOfMainRoom") %>' />
                    ورود:
                    <asp:Label ID="EntDateLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("EntDate") %>' />
                    خروج:
                    <asp:Label ID="ExtDateLabel" runat="server" CssClass="text-success font-weight-bold" Text='<%# Eval("ExtDate") %>' />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    
    </asp:Content>