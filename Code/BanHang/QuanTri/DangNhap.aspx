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
    <style>
        @import "bourbon";
        .form-signin {
            max-width: 380px;
            padding: 15px 35px 45px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid rgba(0,0,0,0.1);
        }
        .form-signin-heading,
	    .checkbox {
	        margin-bottom: 30px;
	    }

	    .checkbox {
	      font-weight: normal;
	    }

	    .form-control {
	      position: relative;
	      font-size: 16px;
	      height: auto;
	      padding: 10px;
	    }

	    input[type="text"] {
	      margin-bottom: -1px;
	      border-bottom-left-radius: 0;
	      border-bottom-right-radius: 0;
	    }

	    input[type="password"] {
	      margin-bottom: 20px;
	      border-top-left-radius: 0;
	      border-top-right-radius: 0;
	    }
}
    </style>
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
                    <input type="text" class="form-control" id="inputTaiKhoan" runat="server"  placeholder="Tài khoản" required="" autofocus="" />
                </div>
                <div class="row">
                    <input type="password" class="form-control" id="inputMatKhau" runat="server" placeholder="Mật Khẩu" required=""/>
                </div>
                 <asp:TextBox ID="txtSolanSai" runat="server" Text="0" CssClass="form-control" Visible="false"></asp:TextBox>
                <div id="remember">
                    <label class="checkbox">
                        <input type="checkbox" value="remember-me" /> Ghi Nhớ Mật Khẩu
                    </label>
                </div>
                <div class="row" id="divCaptcha" runat="server">
                    <div class ="col-md-6 col-xs-12">
                        <input type="text" id="txtCaptcha" runat="server" class="form-control" placeholder="Captcha"/>
                    </div>
                    <div class ="col-md-6 col-xs-12">
                         <img id="imgCaptcha" src="Captcha.aspx" alt="Captcha image" runat="server" style="width:100%"/>
                    </div>
                </div>
                <asp:Button ID="btnDangNhap" class="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Đăng Nhập" OnClick="btnDangNhap_Click"/>        
            </form><!-- /form -->
            <a href="#" class="forgot-password">
                Quên Mật Khẩu
            </a>
        </div><!-- /card-container -->
       <%-- <div class="wrapper">
        <form class="form-signin">       
          <h2 class="form-signin-heading">Đăng Nhập</h2>
          <input type="text" class="form-control" id="inputTaiKhoan" runat="server" placeholder="Tài khoản" required="" autofocus="" />
          <input type="password" class="form-control" id="inputMatKhau" runat="server" placeholder="Mật Khẩu" required=""/>      
          <label class="checkbox">
            <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"/> Remember me
          </label>
        <div class="row">
            <div class ="col-md-6 col-xs-12">
                <input type="text" id="txtCaptcha" runat="server" class="form-control"/>
            </div>
            <div class ="col-md-6 col-xs-12">
                    <img id="imgCaptcha" src="Captcha.aspx" alt="Captcha image" runat="server" />
            </div>
        </div>
          <asp:Button ID="btnDangNhap" class="btn btn-lg btn-primary btn-block btn-signin" runat="server" Text="Đăng Nhập" OnClick="btnDangNhap_Click"/>  
        </form>
      </div>--%>
    </div><!-- /container -->
</body>
</html>
