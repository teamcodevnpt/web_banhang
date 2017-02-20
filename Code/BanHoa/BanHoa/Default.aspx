<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BanHoa.Default" %>

<%@ Register Src="~/Module/View/MListSanPham.ascx" TagPrefix="uc1" TagName="MListSanPham" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <uc1:MListSanPham runat="server" id="MListSanPham" /> 
</asp:Content>
