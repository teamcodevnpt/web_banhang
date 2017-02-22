<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MBanner.ascx.cs" Inherits="Module_Master_MBanner" %>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                      
            <ul class="nav navbar-nav">
            <li><a href="#">Xin chào bạn có thể đăng nhập hoặc tạo tài khoản</a></li>
            </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tài khoản <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Thông tin tài khoản</a></li>
                <li><a href="#">Tuỳ chọn</a></li>
                <li><a href="#">Danh sách đơn hàng</a></li>
                <li class="divider"></li>
                <li><a href="#">Đăng xuất</a></li>
            </ul>
            </li>
            <li><a href="#">Giỏ hàng</a></li>
            <li><a href="#">Yêu thích (1)</a></li>
            <li>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                    <input type="text" class="form-control" placeholder="Tìm kiếm">
                    </div>
                <span id="btnsearch" class="glyphicon glyphicon-search"></span>
            </form>
            </li>
        </ul>
        </div>
    </div>
    </nav>
