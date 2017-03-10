<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MFooter.ascx.cs" Inherits="Module_Master_MFooter" %>
<%@ Register Src="~/Module/Master/MLienHe.ascx" TagPrefix="uc1" TagName="MLienHe" %>
<%@ Register Src="~/Module/Master/MMangXaHoi.ascx" TagPrefix="uc1" TagName="MMangXaHoi" %>
<%@ Register Src="~/Module/Master/MLuotTruyCap.ascx" TagPrefix="uc1" TagName="MLuotTruyCap" %>

<div class="row" style="margin:2px auto;font-size:15px; color:black; padding:2px;">
    <uc1:MLienHe runat="server" ID="MLienHe" />
    <uc1:MMangXaHoi runat="server" ID="MMangXaHoi" />
    <uc1:MLuotTruyCap runat="server" ID="MLuotTruyCap" /> 
</div>