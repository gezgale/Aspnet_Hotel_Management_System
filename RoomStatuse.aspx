<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RoomStatuse.aspx.cs" Inherits="RoomStatuse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div style="font-weight:bolder;font-size:large;">
                    <asp:Label ID="Label6"  runat="server" Text="وضعیت اتاق:"></asp:Label>
                </div>
            </td>
            <td>
                    <asp:DropDownList ID="DrpRoomState" runat="server" style="font-size: large;font-weight:bolder;">
                    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="نمایش" Width="96px" CssClass="btn-info focus" />
            </td>
        </tr>
    </table>


<center>
    <asp:DataList ID="DtLstRooms" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table width="150" border="2" dir="rtl" style="border-style: 1; border-color: #000000; border-width: 1px;">
                <tr>
                    <td>
                        
                            <div dir="rtl" style="text-align:center;font-weight:bolder;">
                                <asp:HyperLink ID="HyperLink1" runat="server" Enabled='<%# Eval("EnabState") %>' style="font-size: large" NavigateUrl='<%# Eval("RezervePageLink") %>'>رزور</asp:HyperLink>
                            </div>

                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="250">
                            <tr>
                                <td style="text-align: right; width: 128px;"><span style="font-size: 8pt; font-family: Tahoma"><strong>کد اتاق:</strong></span></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("RoomNumber") %>'></asp:Label>
                                </td>
                                <td rowspan="5" style="text-align: right">
                                    <asp:Image ID="Image2" runat="server" Height="50px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px;"><strong><span style="font-size: 8pt; font-family: Tahoma">نوع اتاق:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("RoomTypeDescription") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px;"><strong><span style="font-size: 8pt; font-family: Tahoma">تعداد تخت خواب:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("RoomBed") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px;"><strong><span style="font-size: 8pt; font-family: Tahoma">قیمت هر شب اقامت:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("PriceOfPerNight") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; width: 128px;"><strong><span style="font-size: 8pt; font-family: Tahoma">وضعیت اتاق:</span></strong></td>
                                <td style="text-align: right">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="8pt" Text='<%# Eval("RoomStatuseDesc") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</center>
<p>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/All_Rezerved.jpg" Style="margin: 10px 200px"
                    Visible="False" /></p>
</asp:Content>