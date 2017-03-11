<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChiTiet_SanPham.aspx.cs" MasterPageFile="~/QuanTri/QuanTri.master" Inherits="QuanTri_ChiTiet_SanPham" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="ContentTrangChu">
    <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>Thông tin sản phẩm</h2>
                        <ul class="actions">
                            <li>
                                <a href="#">
                                    <i class="zmdi zmdi-trending-up"></i>
                                </a>
                            </li>
                            <li>    
                                <a href="#">     
                                    <i class="zmdi zmdi-check-all"></i>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">
                                    <i class="zmdi zmdi-more-vert"></i>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a href="#">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="#">Manage Widgets</a>
                                    </li>
                                    <li>
                                        <a href="#">Widgets Settings</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="card">
                        <div class="card-header"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-9 col-xs-9">
                                        <div class="row">
                                            <div class="col-md-4 col-xs-12">
                                                <div class="form-group">
                                                    <label>Tên sản phẩm<span style="color:red">&nbsp*</span></label><asp:TextBox ID="txtTenSanPham" Width="100%" runat="server" Text=""/>
                                                </div>
                                             </div>
                                             <div class="col-md-4 col-xs-12">
                                                <div class="form-group">
                                                    <label>Thứ tự<span style="color:red">&nbsp*</span></label>
                                                    <asp:TextBox ID="txtThuTu" runat="server" Width="100%" Type="number"></asp:TextBox>
                                                </div>
                                             </div>
                                            <div class="col-md-4 col-xs-12">
                                                 <div class="form-group">   
                                                    <label>Ưu tiên hiển thị<span style="color:red">&nbsp*</span></label>
                                                    <asp:DropDownList ID="cmbUuTien" runat="server" Width="100%">
                                                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
                                                 </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                    <div class="col-md-4 col-xs-12">
                                        <label>Nhóm sản phẩm<span style="color:red">&nbsp*</span></label><br />
                                        <asp:DropDownList ID="cmbNhomSP" runat="server" Width="100%" DataSourceID="sourceNhomSP" DataTextField="TENNHOM_SANPHAM" DataValueField="MANHOM_SANPHAM"></asp:DropDownList>
                                     </div>
                                     <div class="col-md-4 col-xs-12">
                                        <div class="form-group">   
                                            <label>Hiển thị slide show<span style="color:red">&nbsp*</span></label>
                                            <asp:DropDownList ID="cmbSlideShow" runat="server" Width="100%">
                                                <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                                            </asp:DropDownList>
                                         </div> 
                                     </div>
                                    
                                    <div class="col-md-4 col-xs-12">
                                         <label>Trạng thái<span style="color:red">&nbsp*</span></label>
                                        <asp:DropDownList ID="cmbTrangThai" runat="server" Width="100%">
                                            <asp:ListItem Value="1" Text="Hoạt động"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="Không hoạt động"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                    <div class="row">
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">   
                                                <label>Giá sản phẩm<span style="color:red">&nbsp*</span></label>
                                                <asp:TextBox ID="txtGia" runat="server" Width="100%" Type="number" MaxLength="12"></asp:TextBox>
                                             </div>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">   
                                                <label>Giá khuyến mãi</label>
                                                <asp:TextBox ID="txtGiaKhuyenMai" runat="server" Width="100%" Type="number">
                                                </asp:TextBox>
                                             </div>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">   
                                                <label>Ảnh sản phẩm</label>
                                                <asp:FileUpload ID="FileAnhDD" runat="server" accept="image/*"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <div class="col-md-3 col-xs-3">
                                        <asp:Image ID="imgSanPham" runat="server" Width="100%" Height="180px" />
                                        <div class="form-group">
                                        
                                    </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-xs-12"></div>
                                    <div class="col-md-2 col-xs-12">
                                        <asp:Button ID="btnThemSP" runat="server" CssClass="btn btn-default bgm-lightgreen form-control" Text="Thêm sản phẩm" OnClick="btnThemSP_Click"/>
                                        <asp:Button ID="btnCapNhatSP" runat="server" CssClass="btn btn-default bgm-lightgreen form-control" Text="Cập nhật" OnClick="btnCapNhatSP_Click"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <label for="">Mô tả sản phẩm:</label>
                                        <%--<asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" Height="100px" Width="100%"/>--%>
                                        <CKEditor:CKEditorControl ID="ckMoTa" runat="server" Width="100%" Height="250px" FilebrowserImageBrowseUrl="../Images/SanPham/" EnableTheming="true"></CKEditor:CKEditorControl>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="form-group">
                                            <CKEditor:CKEditorControl ID="ckNoiDung" runat="server" Width="100%" Height="500px" FilebrowserImageBrowseUrl="../Images/SanPham/" EnableTheming="true"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
    </section>
        <asp:SqlDataSource ID="sourceNhomSP" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" ProviderName="System.Data.SqlClient"
         SelectCommand="SELECT MANHOM_SANPHAM,TENNHOM_SANPHAM FROM NHOM_SANPHAM ORDER BY TENNHOM_SANPHAM"></asp:SqlDataSource>
</asp:Content>
