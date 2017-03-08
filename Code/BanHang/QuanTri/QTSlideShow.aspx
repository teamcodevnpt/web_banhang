<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="QTSlideShow.aspx.cs" Inherits="QuanTri_QTSlideShow" %>

<asp:Content ID="Content" runat="server" ContentPlaceHolderID="ContentTrangChu">
    <section id="content">
        <div class="container">
            <div class="block-header">
                <h2>Quản trị SlideShow</h2>
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

            <div class="row">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>


                        <div class="col-xs-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="text-align: center">
                                    <h4><b>Danh sách sản phẩm</b></h4>
                                </div>
                                <div class="panel-body" style="max-height:750px;overflow-y:scroll;">
                                    <div class="row">
                                        <div class="col-xs-10">
                                            <label>Nhóm sản phẩm</label>
                                            <asp:DropDownList ID="cmbNhomSP" runat="server" Width="100%" DataSourceID="SqlDataSourceDanhSachNhomSP"
                                                DataTextField="TENNHOM_SANPHAM" DataValueField="MANHOM_SANPHAM" AutoPostBack="true" OnSelectedIndexChanged="cmbNhomSP_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <hr style="color: blue" />
                                        </div>
                                        <div class="col-xs-12">
                                            <asp:GridView ID="gridSanPham" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                                CssClass="table table-bordered table-striped table-hover"
                                                DataSourceID="SqlDataSourceDanhSachSP" DataKeyNames="MA_SANPHAM" BorderColor="Blue" ForeColor="Black" OnRowUpdated="gridSanPham_RowUpdated">
                                                <Columns>
                                                    <asp:BoundField DataField="MA_SANPHAM" HeaderText="Mã sản phẩm" InsertVisible="False" ReadOnly="True" SortExpression="MA_SANPHAM" />
                                                    <asp:BoundField DataField="TEN_SANPHAM" HeaderText="Tên sản phẩm" SortExpression="TEN_SANPHAM" />
                                                    <asp:BoundField DataField="MOTA" HeaderText="MOTA" SortExpression="MOTA" Visible="false" />
                                                    <asp:BoundField DataField="THUTU" HeaderText="THUTU" SortExpression="THUTU" Visible="false" />
                                                    <asp:BoundField DataField="NOIDUNG" HeaderText="NOIDUNG" SortExpression="NOIDUNG" Visible="false" />
                                                    <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" Visible="false" />
                                                    <asp:BoundField DataField="GIA" HeaderText="GIA" SortExpression="GIA" Visible="false" />
                                                    <asp:BoundField DataField="AVATAR" HeaderText="AVATAR" SortExpression="AVATAR" Visible="false" />
                                                    <asp:BoundField DataField="NGAY_DANG" HeaderText="NGAY_DANG" SortExpression="NGAY_DANG" Visible="false" />
                                                    <asp:CheckBoxField DataField="UU_TIEN" HeaderText="UU_TIEN" SortExpression="UU_TIEN" Visible="false" />
                                                    <asp:BoundField DataField="GIA_KHUYENMAI" HeaderText="GIA_KHUYENMAI" SortExpression="GIA_KHUYENMAI" Visible="false" />
                                                    <asp:BoundField DataField="MA_NHOM_SAN_PHAM" HeaderText="MA_NHOM_SAN_PHAM" SortExpression="MA_NHOM_SAN_PHAM" Visible="false" />
                                                    <asp:CheckBoxField HeaderText="Slideshow" DataField="SLIDE_SHOW"/>
                                                    <asp:TemplateField HeaderText="Chọn" ShowHeader="false">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_chon" runat="server" Text=">>" CssClass="btn btn-info" CommandName="Update" CausesValidation="False" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="text-align: center">
                                    <h4><b>Sản phẩm slideshow</b></h4>
                                </div>
                                <div class="panel-body" style="max-height:750px;overflow-y:scroll;">
                                    <asp:GridView ID="gridSPSlideShow" runat="server" AutoGenerateColumns="False"
                                        CssClass="table table-bordered table-striped table-hover"
                                        DataKeyNames="MA_SANPHAM" DataSourceID="SqlDataSourceSlideShow" OnRowUpdated="gridSPSlideShow_RowUpdated">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Thao tác" ShowHeader="false" ItemStyle-VerticalAlign="Middle">
                                                <ItemTemplate>
                                                    <asp:Button ID="btn_bochon" runat="server" Text="<<" CssClass="btn btn-info" CommandName="Update" CausesValidation="False" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MA_SANPHAM" HeaderText="Mã Sản phẩm" InsertVisible="False" ReadOnly="True" SortExpression="MA_SANPHAM" />
                                            <asp:BoundField DataField="TEN_SANPHAM" HeaderText="Tên sản phẩm" SortExpression="TEN_SANPHAM" />
                                            <asp:BoundField DataField="THUTU" HeaderText="THUTU" SortExpression="THUTU" Visible="false" />
                                            <asp:BoundField DataField="NGAY_DANG" HeaderText="NGAY_DANG" SortExpression="NGAY_DANG" Visible="false" />
                                            <asp:BoundField DataField="GIA" HeaderText="GIA" SortExpression="GIA" Visible="false" />
                                            <asp:BoundField DataField="GIA_KHUYENMAI" HeaderText="GIA_KHUYENMAI" SortExpression="GIA_KHUYENMAI" Visible="false" />
                                            <asp:CheckBoxField DataField="SLIDE_SHOW" HeaderText="SLIDE_SHOW" SortExpression="SLIDE_SHOW" Visible="false" />
                                            <asp:BoundField DataField="MA_NHOM_SAN_PHAM" HeaderText="MA_NHOM_SAN_PHAM" SortExpression="MA_NHOM_SAN_PHAM" Visible="false" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <%--Hết row--%>
        </div>
    </section>
    <asp:SqlDataSource ID="SqlDataSourceDanhSachNhomSP" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnection %>"
        SelectCommand="get_all_danh_muc_nganh_hang" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDanhSachSP" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnection %>" SelectCommand="get_DS_SP_THEO_NHOM"
        SelectCommandType="StoredProcedure" UpdateCommand="THEM_SAN_PHAM_SLIDESHOW" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbNhomSP" Name="MA_NHOM_SP" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MA_SANPHAM" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSlideShow" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnection %>"
        SelectCommand="GET_SAN_PHAM_SLIDESHOW" SelectCommandType="StoredProcedure" UpdateCommand="LOAI_BO_SAN_PHAM_SLIDESHOW" UpdateCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:Parameter Name="MA_SANPHAM" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

