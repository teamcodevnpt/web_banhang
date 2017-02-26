<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="DoiMatKhau.aspx.cs" Inherits="QuanTri_DoiMatKhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" Runat="Server">
        <section id ="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-xs-12">
                        <div class="card">
                            <div class="card-header" style="text-align:center">
                            <h3>ĐỔI MẬT KHẨU</h3>
                        </div>
                            <div class="card-body" style="min-height :300px">
                                <div class="form-group">
                                    <label class="control-label col-sm-3">Tài Khoản:</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtTaiKhoan" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group" style="display:none">
                                    <label class="control-label col-sm-3">Pass:</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3">Mật Khẩu Cũ:</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPassOld" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3">Mật Khẩu Mới:</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPassNew" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3">Xác Nhận Mật Khẩu Mới:</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtPassNew1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-5 col-xs-offset-5">
                                    <asp:Button ID="btn_capnhat" runat="server" Text="Cập nhật" CssClass="btn btn-group" ValidationGroup="vung1" OnClick="btn_capnhat_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>

