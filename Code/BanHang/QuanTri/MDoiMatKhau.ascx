<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MDoiMatKhau.ascx.cs" Inherits="QuanTri_MDoiMatKhau" %>
<div id="myDoiMatKhau" class="modal fade" role="dialog">
    <div class="modal-dialog">
    <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h2 class="modal-title">CẬP NHẬT THÔNG TIN</h2>
            </div>
            <div class="modal-body">
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
                    <label class="control-label col-sm-3">Xác Nhận:</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtPassNew1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btn_capnhat" runat="server" Text="Cập nhật" CssClass="btn btn-group" ValidationGroup="vung1" OnClick="btn_capnhat_Click"/>
                    <button type="button" class="btn btn-group" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</div>

