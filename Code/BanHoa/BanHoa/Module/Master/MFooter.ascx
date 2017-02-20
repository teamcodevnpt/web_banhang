<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MFooter.ascx.cs" Inherits="BanHoa.Module.Master.MFooter" %>
<%@ Register Src="~/Module/Master/MLienHe.ascx" TagPrefix="uc1" TagName="MLienHe" %>
<%@ Register Src="~/Module/Master/MMangXaHoi.ascx" TagPrefix="uc1" TagName="MMangXaHoi" %>
<%@ Register Src="~/Module/Master/MLuotTruyCap.ascx" TagPrefix="uc1" TagName="MLuotTruyCap" %>



<div class="row" style="margin:5px auto;font-size:15px; color:black">
    <uc1:MLienHe runat="server" ID="MLienHe" /> 
    <uc1:MMangXaHoi runat="server" ID="MMangXaHoi" />
    <uc1:MLuotTruyCap runat="server" ID="MLuotTruyCap" />  
</div>