<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="ThongTinChung.aspx.cs" Inherits="QuanTri_ThongTinChung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" Runat="Server">
     <section id="content">
        <div class="container">
            <div class ="row">
                <div class="col-md-12 col-xs-12">
                    <div class="card">
                        <div class="card-header">
                            <h2>Quản Trị Thông Tin Chung</h2>
                        </div>
                        <div class="card-body" style="min-height:300px">
                            <asp:GridView ID="gridThongTinChung" runat="server"></asp:GridView>
                        </div>
                    </div>  
                </div>
            </div>
         </div>  
    </section>
</asp:Content>

