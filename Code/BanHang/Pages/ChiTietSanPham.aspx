<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="ChiTietSanPham.aspx.cs" Inherits="Pages_ChiTietSanPham" %>
<%@ Register Src="~/Module/View/CT_SanPham.ascx" TagPrefix="uc1" TagName="CT_SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <uc1:CT_SanPham runat="server" ID="CT_SanPham" />
</asp:Content>

