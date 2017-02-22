<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/TrangChu.master" %>

<%@ Register Src="~/Module/View/MListSanPham.ascx" TagPrefix="uc1" TagName="MListSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<uc1:MListSanPham runat="server" id="MListSanPham" />
</asp:Content>
