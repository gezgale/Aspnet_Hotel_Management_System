<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrintTicket.aspx.cs" Inherits="PrintTicket" %>
<%@ Register assembly="Stimulsoft.Report.Web, Version=2009.2.500.0, Culture=neutral, PublicKeyToken=ebe6666cba19647a" namespace="Stimulsoft.Report.Web" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center> 
      <div style="direction:rtl;" >
    <cc1:StiWebViewer ID="StiWebViewer1" runat="server" Width="827px" 
        RenderMode="AjaxWithCache" ViewMode="WholeReport" />
    </div> 
</center>
</asp:Content>