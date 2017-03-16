<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MBanner.ascx.cs" Inherits="Module_Master_MBanner" %>

<base href="http://127.0.0.1" />

<nav class="navbar navbar-inverse" style="margin-bottom:2px;">
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
            <li><a href="Trang-Chu">Xin chào bạn có thể đăng nhập hoặc tạo tài khoản</a></li>
            </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
            <a href="../DangXayDung.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tài khoản <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="Trang-Chu">Thông tin tài khoản</a></li>
                <li><a href="Trang-Chu">Tuỳ chọn</a></li>
                <li><a href="Trang-Chu">Danh sách đơn hàng</a></li>
                <li class="divider"></li>
                <li><a href="Trang-Chu">Đăng xuất</a></li>
            </ul>
            </li>
            <li><a href="Trang-Chu">Giỏ hàng</a></li>
            <li><a href="Trang-Chu">Yêu thích</a></li>
            <li>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                    <input type="text" id="txtTimKiem" class="form-control" placeholder="Tìm kiếm" onkeydown="EnterTimKiem(event)">
                    </div>
                <a href="#" style="color:black;" onclick="btnTimKiem()"><span id="btnsearch" class="glyphicon glyphicon-search"></span></a>
                <%--<asp:Button ID="btnTimKiem" runat="server" Text="Tìm Kiếm" OnClick="btnTimKiem_Click" />--%>
            </form>
            </li>
        </ul>
        </div>
    </div>
    </nav>
<script>
    function EnterTimKiem(e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            if (document.getElementById("txtTimKiem").value != "") {
                var url = "../Tim-Kiem/" + document.getElementById("txtTimKiem").value + "/Page/1";
                window.location.href = url
            }
        }
    }
    function btnTimKiem()
    {
        if (document.getElementById("txtTimKiem").value != "")
        {
            var url = "../Tim-Kiem/" + document.getElementById("txtTimKiem").value + "/Page/1";
            window.location.href = url
        }    
       // alert(url);
    }
</script>
