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
            DB db = new DB();
            DataTable dt = new DataTable();
            SqlParameter [] pars = new SqlParameter[2];
            pars[0] = new SqlParameter("taikhoan",DbType.String);
            pars[0].Value = inputTaiKhoan.Value.Trim();
            pars[1] = new SqlParameter("matkhau",DbType.String);
            pars[1].Value = inputMatKhau.Value.Trim();
            dt = db.getDataTableFromStored("select_NguoiDung",pars);
            if (dt.Rows.Count == 0)
            {
                Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng. Vui lòng nhập lại')</script>");
                inputTaiKhoan.Focus();
            }
            else
            {
                Session["tennguoidung"] = "Võ Nhựt Minh";
                Response.Redirect("../QuanTri/Default.aspx");
            }

        }
    }
}