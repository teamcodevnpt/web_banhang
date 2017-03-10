<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CT_SanPham.ascx.cs" Inherits="Module_View_CT_SanPham" %>
<div class="row">
    <div class="col-md-4 col-xs-12" style="padding:2px">
        <div class="panel panel-default">
            <div class="panel-body">
                <asp:Literal ID="ltrTenSP" runat="server"></asp:Literal>
                <asp:Literal ID="ltrHinhAnh" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
     <div class="col-md-8 col-xs-12" style="padding:2px;">   
         <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Thông tin sản phẩm</h3>
            </div>
              <div class="panel-body">
                <p>
                    <asp:Literal ID="ltrMota" runat="server"></asp:Literal>
                </p>
              </div>
            </div>
         <h4>Giá: <font color="red"><asp:Literal ID="ltrGia" runat="server"></asp:Literal></font></h4>
    </div>

</div>
<div class="row">
    <div class="col-md-12 col-xs-12" style="padding:2px;">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#mota" data-toggle="tab" aria-expanded="true">Mô tả</a></li>
            <li class=""><a href="#danhgia" data-toggle="tab" aria-expanded="false">Đánh giá</a></li>
        </ul>
        <div style="border-left: 1px solid #DDDDDD;
	            border-right: 1px solid #DDDDDD;
	            border-bottom: 1px solid #DDDDDD;
                border-top: 1px solid #DDDDDD">
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="mota">
                    <p style="margin-right:10px;margin-left:5px">
                        <asp:Literal ID="ltrNoidung" runat="server"></asp:Literal>
                    </p>
                </div>
                <div class="tab-pane fade" id="danhgia">
                    <p style="margin-right:10px;margin-left:5px">
                      Chưa có đánh giá cho sản phẩm này
                    </p>
                </div>
            </div>
        </div>          
    </div>
</div>