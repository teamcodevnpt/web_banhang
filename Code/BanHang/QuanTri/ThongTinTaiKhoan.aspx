<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="ThongTinTaiKhoan.aspx.cs" Inherits="QuanTri_ThongTinTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" Runat="Server">
    <section id="content">
        <div class="container">
             <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="card">
                        <div class="card-header" style="text-align:center">
                            <h3>THÔNG TIN TÀI KHOẢN</h3>
                        </div>
                        <div class="card-body" style="min-height :300px">
                            <div class="form-group">
                                <label class="control-label col-sm-3">Họ Tên:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Địa Chỉ:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Điện Thoại:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDienThoai" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Email:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Ảnh đại diện:</label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="fileAvatar" runat="server"  accept="image/*"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-5 col-xs-offset-5">
                                    <asp:Button ID="btn_capnhat" runat="server" Text="Cập nhật" CssClass="btn btn-group" ValidationGroup="vung1" OnClick="btn_capnhat_Click"  />
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>            
            </div>
        </div>
    </section>
</asp:Content>

