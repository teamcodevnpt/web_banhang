<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="QuanTri_DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Đăng nhập hệ thống</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="css/DangNhap.css" rel="stylesheet" />
        <script src="../scripts/jquery-3.1.1.min.js"></script>
        <script src="../scripts/bootstrap.min.js"></script>
        <script src="js/DangNhap.js"></script>
</head>
<script>
    //alert("sầd")
</script>
<body style="background-image: url(../img/flowertrail.png); background-repeat:repeat">
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" runat="server">
                <div class="row">
                    <input type="text" id="inputTaiKhoan" runat="server" class="form-control" placeholder="Tài Khoản" />
                </div>
                <div class="row">
                    <input type="password" id="inputMatKhau" runat="server" class="form-control" placeholder="Mật Khẩu" />
                </div>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me" /> Ghi Nhớ Mật Khẩu
                    </label>
                </div>
                <%--<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>--%>
                <asp:Button ID="btnDangNhap" class="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Đăng Nhập" OnClick="btnDangNhap_Click"/>
            </form><!-- /form -->
            <a href="#" class="forgot-password">
                Quên Mật Khẩu
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>
