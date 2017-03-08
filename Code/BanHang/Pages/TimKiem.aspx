<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="TimKiem.aspx.cs" Inherits="Pages_TimKiem" %>

<%@ Register Src="~/Module/Master/MMenuPhai.ascx" TagPrefix="uc1" TagName="MMenuPhai" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div class="row">
        <div class="col-md-9 col-xs-12" style="padding:2px;min-height:300px">
            <div class="panel panel-primary" style="padding:0px; margin:0px;">
            <div class="panel-heading">Danh sách tìm kiếm</div>
            <div class="panel-body" style="padding-top:2px; padding-left:0px;padding-right:0px; padding-bottom:0px;">
                <asp:Literal ID="ltrDSSP" runat="server"></asp:Literal>
            </div>
        </div>
        </div>
        <div class="col-md-3 col-xs-12" style="padding:2px;">
            <uc1:MMenuPhai runat="server" ID="MMenuPhai" />
        </div>
    </div>
</asp:Content>

