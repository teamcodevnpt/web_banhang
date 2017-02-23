<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="ThongTinChung.aspx.cs" Inherits="QuanTri_ThongTinChung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" Runat="Server">
     <section id="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading" style="min-height:50px">Thông tin WebSite</div>
                        <div class="panel-body form-horizontal">
                            <div class="col-xs-12">
                                <asp:Literal ID="ltr_thongbao" runat="server"></asp:Literal>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Tên công ty:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtTenCongTy" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Số Điện Thoại:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Email:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Địa Chỉ:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Link Facebook:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLinkFace" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Link Skype:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLinkSkype" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Link Twitter:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLinkTwitter" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Link Google +:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtLinkGoogle" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-sm-3">Ghi Chú:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtGhiChu" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-5 col-xs-offset-5">
                                <asp:Button ID="btn_capnhat" runat="server" Text="Cập nhật" CssClass="btn btn-group" ValidationGroup="vung1" OnClick="btn_capnhat_Click" />
                            </div>
                            <div class="col-xs-12" style="padding-top:20px;">
                                <div class="alert alert-danger">
                                    <h3><b><u>Lưu ý:</u></b></h3>
                                    <ul style="list-style:square;">
                                        <li>Các keyword cách nhau bởi dấu phẩy</li>
                                        <li>Số điện thoại và Email sẽ được hiển thị ở trang LIÊN HỆ</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </div>  
    </section>
</asp:Content>

