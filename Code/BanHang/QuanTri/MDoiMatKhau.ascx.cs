using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_MDoiMatKhau : System.Web.UI.UserControl
{
    clsTaiKhoan myTaiKhoan = new clsTaiKhoan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MaTaiKhoan"] != null)
            {
                int ma_taikhoan = int.Parse(Session["MaTaiKhoan"].ToString());
                DataTable dts = new DataTable();
                dts = myTaiKhoan.select_thongtintaikhoan(ma_taikhoan);
                if (dts.Rows.Count > 0)
                {
                    DataRow dr = dts.Rows[0];
                    txtTaiKhoan.Text = dr["TAIKHOAN"].ToString();
                    txtPass.Text = dr["MATKHAU"].ToString();
                }
            }
            else
            {
                Response.Redirect("../QuanTri/DangNhap.aspx");
            }
        }
    }
    protected void btn_capnhat_Click(object sender, EventArgs e)
    {
        if (txtPassNew.Text == "" || txtPassNew1.Text == "")
        {
            Response.Write("<script>alert('Vui Lòng Nhật Mật Khẩu Mới')</script>");
            txtPassNew.Focus();
        }
        else if (txtPassNew.Text != txtPassNew1.Text)
        {
            Response.Write("<script>alert('Mật khẩu mới và xác nhận mật khẩu không giống nhau')</script>");
            txtPassNew1.Focus();
        }
        else if (myTaiKhoan.MD5(txtPassNew.Text) == myTaiKhoan.MD5(txtPassOld.Text))
        {
            Response.Write("<script>alert('Mật khẩu mới không được giống mật khẩu cũ')</script>");
            txtPassOld.Focus();
        }
        else if (myTaiKhoan.MD5(txtPassOld.Text) != txtPass.Text)
        {
            Response.Write("<script>alert('Mật khẩu cũ không đúng')</script>");
            txtPassOld.Focus();
        }
        else
        {
            String passmoi = myTaiKhoan.MD5(txtPassNew.Text);
            int count = myTaiKhoan.update_matkhau(txtTaiKhoan.Text, passmoi);
            if (count == 1)
            {
                Response.Write("<script>alert('Đổi Mật Khẩu Thành Công')</script>");
            }
            else
            {
                Response.Write("<script>alert('Lỗi đường truyền mạng. Vui lòng kiểm tra lại!!!')</script>");
            }
        }
    }
}