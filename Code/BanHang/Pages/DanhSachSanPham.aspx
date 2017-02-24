<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="DanhSachSanPham.aspx.cs" Inherits="Pages_DanhSachSanPham" %>

<%@ Register Src="~/Module/View/MListSanPham.ascx" TagPrefix="uc1" TagName="MListSanPham" %>
<%@ Register Src="~/Module/Master/MMenuPhai.ascx" TagPrefix="uc1" TagName="MMenuPhai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="Server">
    <div class="row">
        <div class="col-md-9 col-xs-12" style="padding:2px;">
            <uc1:MListSanPham runat="server" ID="MListSanPham" />
        </div>
        <div class="col-md-3 col-xs-12" style="padding:2px;">
            <uc1:MMenuPhai runat="server" ID="MMenuPhai" />
        </div>
    </div>
</asp:Content>

