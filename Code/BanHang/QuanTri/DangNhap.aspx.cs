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
    int gioiHanSoLanSai = 5;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(txtSolanSai.Text.ToString()) < gioiHanSoLanSai)
        {
            divCaptcha.Attributes.Add("style", "display:none");
        }
        else
        {
            divCaptcha.Attributes.Add("style", "display:''");
        }
    }
    protected void btnDangNhap_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(txtSolanSai.Text.ToString()) < gioiHanSoLanSai)
        {
            if (inputTaiKhoan.Value == "" || inputMatKhau.Value == "")
            {
                Response.Write("<script>alert('Vui Lòng Nhập Đủ Thông Tin')</script>");
                inputTaiKhoan.Focus();
                int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                txtSolanSai.Text = (soLanSai + 1).ToString();
            }
            else
            {
                try
                {
                    String taikhoan, matkhau;
                    taikhoan = inputTaiKhoan.Value.Trim();
                    matkhau = myTaiKhoan.MD5(inputMatKhau.Value.Trim()); // MD5 PASS
                    DataTable dts = myTaiKhoan.quantri_check_login(taikhoan, matkhau);
                    if (dts.Rows.Count == 0)
                    {
                        Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng. Vui lòng nhập lại')</script>");
                        inputTaiKhoan.Focus();
                        int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                        txtSolanSai.Text = (soLanSai + 1).ToString();
                    }
                    else
                    {
                        DataRow row = dts.Rows[0];
                        if (row["MA_TRANGTHAI"].ToString() == "0")
                        {
                            Response.Write("<script>alert('Tài khoản đã bị khóa, Vui Lòng liên hệ Quản Trị')</script>");
                            int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                            txtSolanSai.Text = (soLanSai + 1).ToString();
                        }
                        else
                        {
                            Session["MaTaiKhoan"] = row["MA_TAIKHOAN"].ToString();
                            Session["TaiKhoan"] = row["TAIKHOAN"].ToString();
                            Session["HoTen"] = row["HOTEN"].ToString();
                            Session["Avatar"] = row["AVATAR"].ToString();
                            Response.Redirect("../QuanTri/Default.aspx");
                        }
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Lỗi đường truyền mạng. Vui lòng kiểm tra lại')</script>");
                }
                if (Convert.ToInt32(txtSolanSai.Text.ToString()) == gioiHanSoLanSai)
                {
                    divCaptcha.Attributes.Add("style", "display:''");
                }
            }
        }
        else
        {
            if (inputTaiKhoan.Value == "" || inputMatKhau.Value == "")
            {
                Response.Write("<script>alert('Vui Lòng Nhập Đủ Thông Tin')</script>");
                inputTaiKhoan.Focus();
                int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                txtSolanSai.Text = (soLanSai + 1).ToString();
            }
            else
            {
                if (txtCaptcha.Value == "")
                {
                    Response.Write("<script>alert('Vui Lòng Nhập Mã Captcha')</script>");
                    int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                    txtSolanSai.Text = (soLanSai + 1).ToString();
                }
                else if (txtCaptcha.Value != Session["Captcha"].ToString())
                {
                    Response.Write("<script>alert('Mã Captcha không đúng')</script>");
                    int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                    txtSolanSai.Text = (soLanSai + 1).ToString();
                }
                else
                {
                    try
                    {
                        String taikhoan, matkhau;
                        taikhoan = inputTaiKhoan.Value.Trim();
                        matkhau = myTaiKhoan.MD5(inputMatKhau.Value.Trim()); // MD5 PASS
                        DataTable dts = myTaiKhoan.quantri_check_login(taikhoan, matkhau);
                        if (dts.Rows.Count == 0)
                        {
                            Response.Write("<script>alert('Tài khoản hoặc mật khẩu không đúng. Vui lòng nhập lại')</script>");
                            inputTaiKhoan.Focus();
                            int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                            txtSolanSai.Text = (soLanSai + 1).ToString();
                        }
                        else
                        {
                            DataRow row = dts.Rows[0];
                            if (row["MA_TRANGTHAI"].ToString() == "0")
                            {
                                Response.Write("<script>alert('Tài khoản đã bị khóa, Vui Lòng liên hệ Quản Trị')</script>");
                                int soLanSai = Convert.ToInt32(txtSolanSai.Text.ToString());
                                txtSolanSai.Text = (soLanSai + 1).ToString();
                            }
                            else
                            {
                                Session["MaTaiKhoan"] = row["MA_TAIKHOAN"].ToString();
                                Session["TaiKhoan"] = row["TAIKHOAN"].ToString();
                                Session["HoTen"] = row["HOTEN"].ToString();
                                Session["Avatar"] = row["AVATAR"].ToString();
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
    }
}