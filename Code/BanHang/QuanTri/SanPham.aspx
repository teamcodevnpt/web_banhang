<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/QuanTri/QuanTri.master" CodeFile="SanPham.aspx.cs" Inherits="QuanTri_SanPham" %>

<asp:Content ID="Content" runat="server" ContentPlaceHolderID="ContentTrangChu">
    <script>
            $(document).ready(function () {
                $('#ContentTrangChu_gridSanPham').DataTable();
            });
        </script>
    <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>Danh sách sản phẩm</h2>
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
        <div class="card-body">
            <div class="col-md-3">
                <br />
            <a href="ChiTiet_SanPham.aspx"><input class="btn btn-default bgm-green form-control" type="button" value="Thêm sản phẩm" /></a>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <div class="fg-line">
                <br />
                <asp:DropDownList ID="cmbNhomSP" AutoPostBack="true" runat="server" CssClass="form-control" DataSourceID="sourceNhomSP" DataTextField="TENNHOM_SANPHAM" DataValueField="MANHOM_SANPHAM"></asp:DropDownList>
            </div></div></div>
            <asp:GridView ID="gridSanPham" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CssClass="table table-bordered" Width="100%" DataSourceID="sourceSanPham" DataKeyNames="MA_SANPHAM" AllowPaging="True" AllowSorting="True">
                <PagerSettings Mode="NumericFirstLast" Visible="true" />
                <Columns>
                    <asp:BoundField  DataField="THUTU" HeaderText="Thứ tự"/>
                    <asp:BoundField  DataField="TEN_SANPHAM" HeaderText="Tên sản phẩm"/>
                    <asp:BoundField  DataField="TENNHOM_SANPHAM" HeaderText="Nhóm SP" />
                    <asp:BoundField  DataField="TRANGTHAI" HeaderText="Trạng thái"/>
                    <asp:BoundField  DataField="GIA" HeaderText="Giá bán" ItemStyle-HorizontalAlign="Right"/>
                    <asp:BoundField  DataField="GIA_KHUYENMAI" HeaderText="Giá khuyến mãi"/>            
                    <asp:BoundField  DataField="NGAY_DANG" HeaderText="Ngày đăng"/>
                    <asp:TemplateField HeaderText="Thao tác">
                        <ItemTemplate>
                            <a style="margin-top:-5px" target="_blank" href='ChiTiet_SanPham.aspx?id=<%# Eval("MA_SANPHAM") %>'><img src="img/icons/detail.png"/></a>
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
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbNhomSP" Name="MANHOM_SANPHAM" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sourceNhomSP" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" ProviderName="System.Data.SqlClient"
         SelectCommand="SELECT 0 AS MANHOM_SANPHAM,N'Tất cả' AS TENNHOM_SANPHAM UNION SELECT MANHOM_SANPHAM,TENNHOM_SANPHAM FROM NHOM_SANPHAM"></asp:SqlDataSource>
    
</asp:Content>
