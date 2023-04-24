<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReserveRoom.aspx.cs" Inherits="ReserveRoom" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" style="margin-top: 10px; margin-bottom: 10px; width: 570px">
        <tr>
            <td style="height: 21px">
            </td>
            <td style="height: 21px; text-align: center">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="16pt"
                    ForeColor="#400000" Style="margin-top: 20px" Text="صفحه رزرو اتاقها"></asp:Label></td>
            <td style="height: 21px">
            </td>
        </tr>
        <tr>
            <td style="height: 21px">
            </td>
            <td style="height: 21px; text-align: center;">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="Label"
                    Visible="False"></asp:Label></td>
            <td style="height: 21px">
            </td>
        </tr>
        <tr>
            <td style="height: 21px">
                &nbsp;</td>
            <td style="height: 21px; text-align: center;">
                <em><strong>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-size: medium; font-style: italic; font-weight: bold" Text="ثبت رزرو" />
                </strong></em></td>
            <td style="height: 21px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px">
                &nbsp;</td>
            <td style="height: 21px; text-align: center;">
                &nbsp;</td>
            <td style="height: 21px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 21px">
                &nbsp;</td>
            <td style="height: 21px; text-align: center;" align="center">
<center>
    <asp:DataList ID="DtLstRooms" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" style="font-size: medium">
        <ItemTemplate>
            <table width="150" border="2" dir="rtl" style="border-style: 1; border-color: #000000; border-width: 1px;">
                <tr>
                    <td>
                        <table width="250">
                            <tr>
                                <td style="text-align: right; width: 128px; font-size: small;"><span style="font-size: small; font-family: Tahoma"><strong>کد اتاق:</strong></span></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("RoomNumber") %>' style="font-size: small"></asp:Label>
                                </td>
                                <td rowspan="5" style="text-align: right">
                                    <asp:Image ID="Image2" runat="server" Height="50px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px; font-size: small;"><strong><span style="font-size: small; font-family: Tahoma">نوع اتاق:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("RoomTypeDescription") %>' style="font-size: small"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px; font-size: small;"><strong><span style="font-size: small; font-family: Tahoma">تعداد تخت خواب:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("RoomBed") %>' style="font-size: small"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px; font-size: small;"><strong><span style="font-size: small; font-family: Tahoma">قیمت هر شب اقامت:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("PriceOfPerNight") %>' style="font-size: small"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px; font-size: small;"><strong><span style="font-size: small; font-family: Tahoma">وضعیت اتاق:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("RoomStatuseDesc") %>' style="font-size: small"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</center>
            </td>
            <td style="height: 21px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="3">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/All_Rezerved.jpg" Style="margin: 10px 200px"
                    Visible="False" /></td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="text-align: center">
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

