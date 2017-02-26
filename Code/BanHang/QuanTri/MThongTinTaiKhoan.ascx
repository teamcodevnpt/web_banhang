<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MThongTinTaiKhoan.ascx.cs" Inherits="QuanTri_MThongTinTaiKhoan" %>
<div id="myThongTin" class="modal fade" role="dialog">
    <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title">CẬP NHẬT THÔNG TIN</h2>
        </div>
        <div class="modal-body">
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
        </div>
        <div class="modal-footer">
            <asp:Button ID="btn_capnhat" runat="server" Text="Cập nhật" CssClass="btn btn-group" ValidationGroup="vung1" OnClick="btn_capnhat_Click" />
            <button type="button" class="btn btn-group" data-dismiss="modal">Đóng</button>
        </div>
    </div>

    </div>
</div>