<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="QuanTri_Default" MasterPageFile="~/QuanTri/QuanTri.master" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" runat="server">
    <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>Thông tin chung</h2>

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
                        <div class="col-md-6 col-xs-12">
                        <div class="card">
                                            <div class="card-header">
                                            </div>
                                            <div class="card-body" style="height:1000px">
                                            </div>
                                        </div>  
                            </div>
                             <div class="col-md-6 col-xs-12">
                        <div class="card">
                                            <div class="card-header">
                                            </div>
                                            <div class="card-body" style="height:1000px">
                                            </div>
                                        </div>  
                            </div>
                        </div>    
                </div>
            </section>
    
</asp:Content>
