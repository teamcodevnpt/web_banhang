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
        <script src="../scripts/jquery-3.1.1.min.js"></script>
        <script src="../scripts/bootstrap.min.js"></script>
</head>
<body>
    <div class="panel panel-primary" style="width:35%;margin:250px auto;">
        <div class="panel-heading"><b>Đăng nhập hệ thống</b></div>
            <div class="panel-body">
                <form class="form-horizontal">
          <fieldset>
            <div class="form-group">
              <div class="col-lg-12">
                <input type="text" class="form-control" id="inputEmail" placeholder="Tài khoản">
              </div>
            </div>
            <div class="form-group">
              <div class="col-lg-12">
                <input type="password" class="form-control" id="inputPassword" placeholder="Mật khẩu">
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> Ghi nhớ đăng nhập
                  </label>
                </div>
              </div>
            </div>
            
            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-0">
                <button type="reset" class="btn btn-default">Huỷ</button>
                <button type="submit" class="btn btn-primary">Đăng nhập</button>
              </div>
            </div>
          </fieldset>
        </form>
       </div>
    </div>
</body>
</html>
