<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MLuotTruyCap.ascx.cs" Inherits="Module_Master_MLuotTruyCap" %>
<style>
    .badge{
        font-size:10px;
        background-color:rgb(48, 52, 234);
    }
</style>
<div class="col-md-3 col-xs-12"style="padding:5px">
    <div class="panel panel-primary">
        <div class="panel-heading">Thống kê truy cập</div>
        <div class="panel-body" style="min-height:150px">
            <div class="row" style="margin:5px">
                <span class="badge">
                    <asp:Literal ID="ltr_online" Text="9" runat="server"></asp:Literal>
                </span>
                Đang truy cập <br/>
                <span class="badge">
                    <asp:Literal ID="ltr_homnay" Text="99" runat="server"></asp:Literal>
                </span>
                Hôm nay<br/>
                <span class="badge">
                    <asp:Literal ID="ltr_tatca" Text="999" runat="server"></asp:Literal>
                </span>
                Tất cả<br/>
            </div>
            </div>
    </div>
</div>