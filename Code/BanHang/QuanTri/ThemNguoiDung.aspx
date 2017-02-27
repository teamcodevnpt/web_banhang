<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="ThemNguoiDung.aspx.cs" Inherits="QuanTri_ThemNguoiDung" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" Runat="Server">
    <section id="content">
        <div class="container">
                <div class="col-md-12 col-xs-12">
                    <div class="card">
                        <div class="card-header" style="text-align:center">
                            <h3>Quản Trị Tài Khoản</h3>
                        </div>
                        <div class="card-body" style="min-height :370px">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label">Họ tên</label>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <asp:TextBox ID="txtTenNguoiDung" placeholder="Họ tên" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label">Tài khoản</label>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <asp:TextBox ID="txtTaiKhoan" runat="server" placeholder="Tài khoản" CssClass="form-control"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revMatKhau" runat="server" ErrorMessage="(*)Tài khoản có kí tự đặc biệt" ControlToValidate="txtTaiKhoan" ValidationExpression="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$"  CssClass="validator"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                     <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label">Quyền</label>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <asp:DropDownList ID="drpNhomQuyen" runat="server" DataTextField="TEN_ROLE" DataSourceID="dts_NhomQquyen" DataValueField="MA_ROLE"></asp:DropDownList>
                                            <asp:SqlDataSource ID="dts_NhomQquyen" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" SelectCommandType="Text" SelectCommand="select * from ROLE"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label">Địa chỉ</label>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <asp:TextBox ID="txtDiaChi" runat="server" placeholder="Địa chỉ" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label col-sm-3">Điện thoại</label>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <asp:TextBox ID="txtSoDT" runat="server" placeholder="Điện thoại" CssClass="form-control"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revSoDT" runat="server" ErrorMessage="(*)Số điện thoại không đúng" CssClass="validator" ControlToValidate="txtSoDT" ValidationExpression="\d{10,11}"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-12">
                                            <label class="control-label col-sm-3">Email</label>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                      <asp:RegularExpressionValidator runat="server" ID="revKT_email"  ErrorMessage="(*)Mail không đúng" ControlToValidate="txtEmail" ValidationExpression="[a-zA-Z0-9_\.]+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)*" CssClass="validator"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                   <div class="col-md-4 col-xs-12"></div>
                                   <div class="col-md-8 col-xs-12">
                                   <input id="chkHoatDong" type="checkbox" runat="server" Checked="checked" />Hoạt động
                                </div>
                         
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4 col-xs-12"></div>
                                    <div class="col-md-8 col-xs-12">
                                            <asp:Button id="btnThemNguoiDung" CssClass="btn btn-primary" OnClick="btnThemNguoiDung_Click" Text="Thêm Người Dùng" runat="server"/>
                                            <button type="reset" class="btn btn-default">Hủy</button>                                           
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <p style="text-align:center; color:blue; font-size:large; font-weight:bold">DANH SÁCH NGƯỜI DÙNG</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-xs-12">            
                                   <div class="table-responsive">            
                                    <asp:GridView ID="grid_NguoiDung" runat="server" AutoGenerateColumns="False" DataKeyNames="MA_TAIKHOAN" DataSourceID="dts_Grid_NguoiDung" OnRowDataBound="grid_NguoiDung_RowDataBound" OnRowUpdating="grid_NguoiDung_RowUpdating" Width="80%" ShowHeaderWhenEmpty="True" HorizontalAlign="Center"  CssClass="table table-bordered table-hover">
                                        <Columns>
                                            <asp:BoundField DataField="MA_TAIKHOAN" HeaderText="MA_TAIKHOAN" InsertVisible="False" ReadOnly="True" SortExpression="MA_TAIKHOAN" Visible="false"/>
                                            <asp:BoundField DataField="HOTEN" HeaderText="Họ Tên" SortExpression="HOTEN" HeaderStyle-Width="12%" ItemStyle-Width="12%">               
                                            <HeaderStyle Width="12%"></HeaderStyle>
                                            <ItemStyle Width="12%"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TAIKHOAN" HeaderText="Tài Khoản" SortExpression="TAIKHOAN" HeaderStyle-Width="12%" ItemStyle-Width="12%" >
                                            <HeaderStyle Width="12%"></HeaderStyle>

                                            <ItemStyle Width="12%"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DIACHI" HeaderText="Địa Chỉ" SortExpression="DIACHI" HeaderStyle-Width="12%" ItemStyle-Width="12%">
                                            <HeaderStyle Width="12%"></HeaderStyle>

                                            <ItemStyle Width="12%"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" HeaderStyle-Width="12%" ItemStyle-Width="12%">
                                            <HeaderStyle Width="12%"></HeaderStyle>

                                            <ItemStyle Width="12%"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DIENTHOAI" HeaderText="Điện Thoại" SortExpression="DIENTHOAI" HeaderStyle-Width="12%" ItemStyle-Width="12%">
                                            <HeaderStyle Width="12%"></HeaderStyle>

                                            <ItemStyle Width="12%"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Nhóm quyền" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_nhomquyen" runat="server" Text='<%#Bind("TEN_ROLE") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate >
                                                    <asp:Label ID="lbl_nhomquyen" runat="server" Text='<%#Bind("MA_ROLE") %>' Visible="false">
                                                    </asp:Label>
                                                    <asp:DropDownList ID="drp_nhomquyen" DataSourceID="dts_drp_nhomquyen" runat="server" DataTextField="TEN_ROLE" DataValueField="MA_ROLE">
                                                     </asp:DropDownList>
                                                    <asp:SqlDataSource ID="dts_drp_nhomquyen" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" SelectCommand="SELECT * FROM ROLE" >
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>

                                            <HeaderStyle Width="10%"></HeaderStyle>

                                            <ItemStyle Width="10%"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-Width="10%" ItemStyle-Width="10">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_trangthai" runat="server" Text='<%#Bind("TEN_TRANGTHAI") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate >
                                                    <asp:Label ID="lbl_trangthai" runat="server" Text='<%#Bind("MA_TRANGTHAI") %>' Visible="false">
                                                    </asp:Label>
                                                    <asp:DropDownList ID="drp_trangthai" DataSourceID="dts_drp_trangthai" runat="server" DataTextField="TEN_TRANGTHAI" DataValueField="MA_TRANGTHAI">
                                                     </asp:DropDownList>
                                                    <asp:SqlDataSource ID="dts_drp_trangthai" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" SelectCommand="SELECT * FROM TRANGTHAI" >
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>

                                            <HeaderStyle Width="10%"></HeaderStyle>

                                            <ItemStyle Width="10px"></ItemStyle>
                                            </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Thao tác" HeaderStyle-Width="14%" ItemStyle-Width="20%">
                                                  <HeaderStyle HorizontalAlign="Center" />
                                                  <EditItemTemplate>
                                                  <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/QuanTri/img/icons/Save.png" Text="Update" 
                                                                        ValidationGroup="vung2"/>
                                                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/QuanTri/img/icons/Cancel.png" Text="Cancel" 
                                                                        ValidationGroup="vung2"/>
                                                  </EditItemTemplate>
                                                   <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/QuanTri/img/icons/Edit.png" Text="Edit" />
                                                                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/QuanTri/img/icons/Delete.png" OnClientClick="return confirm('Bạn có muốn xoá  người dùng này?');" 
                                                                        Text="Delete" ValidationGroup="vung2"/>
                                                   </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                           </asp:TemplateField>
                    
                    
                                        </Columns>
                                    </asp:GridView>
                                    </div>
                                    <asp:SqlDataSource ID="dts_Grid_NguoiDung" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnections %>" SelectCommand="grid_NguoiDung"
                                         DeleteCommand="DELETE QUANTRI_TAIKHOAN WHERE MA_TAIKHOAN=@MA_TAIKHOAN" SelectCommandType="StoredProcedure" UpdateCommand="update_taikhoan" UpdateCommandType="StoredProcedure" OnUpdating="dts_Grid_NguoiDung_Updating">
                                        <DeleteParameters>
                                            <asp:Parameter Name="MA_TAIKHOAN" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="MA_TAIKHOAN" Type="Int32" />
                                            <asp:Parameter Name="MA_ROLE"  Type="Int32"/>
                                            <asp:Parameter Name="MA_TRANGTHAI" Type="Int32"/>
                                            <asp:Parameter Name="HOTEN" Type="String" />
                                            <asp:Parameter Name="TAIKHOAN" Type="String" />
                                            <asp:Parameter Name="DIACHI" Type="String"/>
                                            <asp:Parameter Name="DIENTHOAI" Type="String"/>
                                            <asp:Parameter Name="EMAIL" Type="String"/>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
    </section>
<%-- script --%>
    <style>
        #btnsearch:hover {
            cursor: pointer;
        }
        .validator {     
            color: red !important; 
        } 
        .auto-style1 {
            font-size: large;
        }
        .vien_grid {
           border: 1px solid blue;
        } 
    </style>
<%-- end script --%>
</asp:Content>

