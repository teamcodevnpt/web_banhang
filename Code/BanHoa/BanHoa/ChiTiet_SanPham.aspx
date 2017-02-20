<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/TrangChu.Master" CodeFile="ChiTiet_SanPham.aspx.cs" Inherits="ChiTiet_SanPham" %>

<%@ Register Src="~/Module/View/CT_SanPham.ascx" TagPrefix="uc1" TagName="CT_SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <uc1:CT_SanPham runat="server" ID="CT_SanPham" />
</asp:Content>

