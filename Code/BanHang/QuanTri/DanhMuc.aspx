<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DanhMuc.aspx.cs" Inherits="QuanTri_DanhMuc" MasterPageFile="~/QuanTri/QuanTri.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" runat="server">
    <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>Quản trị danh mục</h2>
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
                        <div class="col-md-12 col-xs-12">
                        <div class="card">
                        <div class="card-header">Nhóm sản phẩm</div>
                        <div class="card-body danhmuc-body">
                            <div class="row">
                                <div class="col-md-1 col-xs-1">
                                    <label>Số thứ tự</label>
                                    <asp:TextBox ID="txtSTT" runat="server" Width="100%"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="txtSTT_N" runat="server" ControlToValidate="txtSTT" ErrorMessage="Chỉ được nhập số" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-3 col-xs-3">
                                    <label>Tên nhóm sản phẩm</label>
                                    <asp:TextBox ID="txtTenNhom_SP" runat="server" Width="100%"></asp:TextBox>
                                </div>
                                <div class="col-md-2 col-xs-2">
                                    <label>Nhóm sản phẩm cha</label>
                                    <asp:DropDownList ID="cmbNhomSPCha" runat="server" Width="100%" DataSourceID="sourceNhomSPCha" DataTextField="TENNHOM_SANPHAM" DataValueField="MANHOM_SANPHAM">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2 col-xs-2">
                                    <label>Hiển thị slide show</label>
                                <asp:DropDownList ID="cmbSlideShow" runat="server" Width="100%" >
                                    <asp:ListItem Value="1" Text="Hiển thị Slide Show"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="Không hiển thị Slide Show"></asp:ListItem>
                                </asp:DropDownList>
                                </div>
                                <div class="col-md-2 col-xs-2">
                                    <label>Ảnh đại diện</label>
                                    <asp:FileUpload ID="FileAnhDD" runat="server" />
                                </div>
                                <div class="col-md-2 col-xs-2">
                                    <asp:Button ID="btnThemNhomSP" runat="server" CssClass="btn btn-default bgm-lightgreen form-control" Text="Thêm" OnClick="btnThemNhomSP_Click1"/>
                                </div>
                            </div>
                            <div class="row">
                                <asp:GridView id="gridNhomSP" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" CssClass="table table-bordered" DataSourceID="sourceNhomSP" DataKeyNames="MANHOM_SANPHAM" OnRowUpdating="gridNhomSP_RowUpdating" OnRowDeleting="gridNhomSP_RowDeleting" OnRowDataBound="gridNhomSP_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="STT" DataField="THUTU" ControlStyle-CssClass="form-control" />
                                        <asp:BoundField HeaderText="Tên nhóm sản phẩm" DataField="TENNHOM_SANPHAM" ControlStyle-CssClass="form-control"/>
                                        <asp:TemplateField HeaderText="Nhóm sản phẩm cha">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTenNhomSP" runat="server" Text='<%# Bind("TENNHOM_SANPHAM_CHA") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label id="lblNhomSPCha_N" runat="server" Text='<%# Bind("MANHOM_CHA") %>' Visible="false"></asp:Label>
                                                <asp:DropDownList ID="cmbNhomSPCha_N" runat="server" CssClass="form-control" DataSourceID="sourceNhomSPCha" DataTextField="TENNHOM_SANPHAM" DataValueField="MANHOM_SANPHAM">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hiển thị Slide Show">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTenNhomSP_N" runat="server" Text='<%# Bind("SLIDE_SHOW") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="cmbSlideShow_N" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="1" Text="Hiển thị Slide Show"></asp:ListItem>
                                                    <asp:ListItem Value="0" Text="Không hiển thị Slide Show"></asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trạng thái">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTRANGTHAI" runat="server" Text='<%# Bind("TRANGTHAI") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="cmbTrangThai_N" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="1" Text="Hoạt động"></asp:ListItem>
                                                    <asp:ListItem Value="0" Text="Không hoạt động"></asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ảnh đại diện">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>                                                
                                                <a href='<%# Eval("AVATAR") %>' target="_blank"><i class="zmdi zmdi-image"></i></a>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Literal ID="lblAvatar" runat="server" Text='<%# Eval("AVATAR") %>' Visible="false"></asp:Literal>
                                               <asp:FileUpload ID="FileAnhDD_N" runat="server" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Thao tác">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/QuanTri/img/icons/Save.png" Text="Update" 
                                                ValidationGroup="vung2"/>
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/QuanTri/img/icons/Cancel.png" Text="Cancel" 
                                                ValidationGroup="vung2"/>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/QuanTri/img/icons/Edit.png" Text="Edit" />
                                            &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/QuanTri/img/icons/Delete.png" OnClientClick="return confirm('Bạn có muốn xoá nhóm sản phẩm này?');" 
                                                Text="Delete" ValidationGroup="vung2"/>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        </div>  
                    </div>
    </div>    
</section>
    <asp:SqlDataSource ID="sourceNhomSPCha" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" ProviderName="System.Data.SqlClient"
         SelectCommand="SELECT NULL AS MANHOM_SANPHAM,NULL AS TENNHOM_SANPHAM UNION SELECT MANHOM_SANPHAM,TENNHOM_SANPHAM FROM NHOM_SANPHAM"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sourceNhomSP" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" ProviderName="System.Data.SqlClient"
        SelectCommand="SELECT_NHOM_SANPHAM" SelectCommandType="StoredProcedure"
        DeleteCommand="DELETE FROM NHOM_SANPHAM WHERE MANHOM_SANPHAM=@MANHOM_SANPHAM" DeleteCommandType="Text"
         UpdateCommand="UPDATE_NHOM_SANPHAM" UpdateCommandType="StoredProcedure" OnUpdating="sourceNhomSP_Updating" OnDeleting="sourceNhomSP_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="MANHOM_SANPHAM" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MA_TRANGTHAI" Type="String"/>
            <asp:Parameter Name="TENNHOM_SANPHAM" Type="String"/>
            <asp:Parameter Name="THUTU" Type="String"/>
            <asp:Parameter Name="MANHOM_CHA" Type="String"/>
            <asp:Parameter Name="SLIDE_SHOW" Type="String"/>
            <asp:Parameter Name="AVATAR" Type="String"/>
            <asp:Parameter Name="MANHOM_SANPHAM" Type="String"/>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
