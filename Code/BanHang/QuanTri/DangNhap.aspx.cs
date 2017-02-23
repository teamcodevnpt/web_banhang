using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class QuanTri_DangNhap : System.Web.UI.Page
{
    clsTaiKhoan myTaiKhoan = new clsTaiKhoan();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
    }
    protected void btnDangNhap_Click(object sender, EventArgs e)
    {
        if (inputTaiKhoan.Value == "" || inputMatKhau.Value == "")
        {
            Response.Write("<script>alert('Vui Lòng Nhập Đủ Thông Tin')</script>");
            inputTaiKhoan.Focus();
        }
        else
        {
            try
            {
                String taikhoan, matkhau;
                taikhoan = inputTaiKhoan.Value.Trim();
                matkhau = myTaiKhoan.MD5(inputMatKhau.Value.Trim());
                DataTable dts = myTaiKhoan.quantri_check_login(taikhoan, matkhau);
                if (dts.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng. Vui lòng nhập lại')</script>");
                    inputTaiKhoan.Focus();
                }
                else
                {
                    DataRow row = dts.Rows[0];
                    if (row["MA_TRANGTHAI"].ToString() == "2")
                    {
                        Response.Write("<script>alert('Tài khoản đã bị khóa, Vui Lòng liên hệ Quản Trị')</script>");
                    }
                    else
                    {
                        Session["tennguoidung"] = row["HOTEN"].ToString();
                        Response.Redirect("../QuanTri/Default.aspx");
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Lỗi đường truyền mạng. Vui lòng kiểm tra lại')</script>");
            }

        }
    }
}