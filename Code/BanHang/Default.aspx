<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/TrangChu.master" %>

<%--<%@ Register Src="~/Module/View/MListSanPham.ascx" TagPrefix="uc1" TagName="MListSanPham" %>--%>
<%@ Register Src="~/Module/View/MDanhMucNganhHang.ascx" TagPrefix="uc1" TagName="MDanhMucNganhHang" %>
<%@ Register Src="~/Module/Master/MBanner.ascx" TagPrefix="uc1" TagName="MBanner" %>
<%@ Register Src="~/Module/Master/MMenuPhai.ascx" TagPrefix="uc1" TagName="MMenuPhai" %>
<%@ Register Src="~/Module/Master/MFooter.ascx" TagPrefix="uc1" TagName="MFooter" %>
<%@ Register Src="~/Module/View/MListSanPham.ascx" TagPrefix="uc1" TagName="MListSanPham" %>
<%@ Register Src="~/Module/View/SlideShowTrangChuChinh.ascx" TagPrefix="uc1" TagName="SlideShowTrangChuChinh" %>
<%@ Register Src="~/Module/Master/MMenuNgang.ascx" TagPrefix="uc1" TagName="MMenuNgang" %>
<%@ Register Src="~/Module/View/MSlideShowTrangChuChinhN.ascx" TagPrefix="uc1" TagName="MSlideShowTrangChuChinhN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row" style="padding-top:5px;">
        <div class="col-md-9 col-xs-12" style="margin:0px;padding:2px;">
            <uc1:MSlideShowTrangChuChinhN runat="server" ID="MSlideShowTrangChuChinhN" />
        </div>
        <div class="col-md-3 col-xs-12" style="padding:2px;">
            <asp:Image ID="imgLienHe" runat="server" ImageUrl="~/img/support.jpeg" CssClass="img-responsive" Height="400px" Width="100%" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-9 col-sm-12" style="padding:2px;">
            <uc1:MDanhMucNganhHang runat="server" ID="MDanhMucNganhHang" />
        </div>
        <div class="col-md-3 col-xs-12" style="padding:2px;">
            <uc1:MMenuPhai runat="server" ID="MMenuPhai" />
        </div>
    </div>

</asp:Content>
