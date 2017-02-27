<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/QuanTri/QuanTri.master" CodeFile="SanPham.aspx.cs" Inherits="QuanTri_SanPham" %>
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="ContentTrangChu">
    <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>Danh sách sản phẩm</h2>
                        <ul class="actions">
                            <li>
                                <a href="">
                                    <i class="zmdi zmdi-trending-up"></i>
                                </a>
                            </li>
                            <li>    
                                <a href="">     
                                    <i class="zmdi zmdi-check-all"></i>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="" data-toggle="dropdown">
                                    <i class="zmdi zmdi-more-vert"></i>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a href="">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="">Manage Widgets</a>
                                    </li>
                                    <li>
                                        <a href="">Widgets Settings</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
        <div class="card">
        <div class="card-body">
            <div class="col-md-3">
                <br />
            <a href="ChiTiet_SanPham.aspx"><input class="btn btn-default bgm-green form-control" type="button" value="Thêm sản phẩm" /></a>
            </div>
            <asp:GridView ID="gridSanPham" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" CssClass="table table-bordered" Width="100%" DataSourceID="sourceSanPham" DataKeyNames="MA_SANPHAM">
                <Columns>
                    <asp:BoundField  DataField="THUTU" HeaderText="Thứ tự"/>
                    <asp:BoundField  DataField="TEN_SANPHAM" HeaderText="Tên sản phẩm"/>
                    <asp:BoundField  DataField="TRANGTHAI" HeaderText="Trạng thái"/>
                    <asp:BoundField  DataField="SLIDE_SHOW" HeaderText="Slide show"/>
                    <asp:BoundField  DataField="UU_TIEN" HeaderText="Ưu tiên"/>
                    <asp:BoundField  DataField="GIA" HeaderText="Giá bán"/>
                    <asp:BoundField  DataField="GIA_KHUYENMAI" HeaderText="Giá khuyến mãi"/>            
                    <asp:BoundField  DataField="NGAY_DANG" HeaderText="Ngày đăng"/>
                    <asp:TemplateField HeaderText="Thao tác">
                        <ItemTemplate>
                            <a target="_blank" href='ChiTiet_SanPham.aspx?id=<%# Eval("MA_SANPHAM") %>'><img src="img/icons/detail.png"/></a>
                            &nbsp<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/QuanTri/img/icons/Delete.png" OnClientClick="return confirm('Bạn có muốn xoá sản phẩm này?');" 
                                  Text="Delete" ValidationGroup="vung2"/>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
                </div></section>
    <asp:SqlDataSource ID="sourceSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" ProviderName="System.Data.SqlClient"
         SelectCommand="SELECT_LIST_SANPHAM" SelectCommandType="StoredProcedure"
        DeleteCommand="DELETE_SANPHAM" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="MA_SANPHAM" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
