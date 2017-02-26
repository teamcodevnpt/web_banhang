using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_ThongTinTaiKhoan : System.Web.UI.Page
{
    clsTaiKhoan myTaiKhoan = new clsTaiKhoan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["MaTaiKhoan"] != null)
            {
                int ma_taikhoan = int.Parse(Session["MaTaiKhoan"].ToString());
                DataTable dts = new DataTable();
                dts = myTaiKhoan.select_thongtintaikhoan(ma_taikhoan);
                if (dts.Rows.Count > 0)
                {
                    DataRow dr = dts.Rows[0];
                    txtHoTen.Text = dr["HOTEN"].ToString();
                    txtDiaChi.Text = dr["DIACHI"].ToString();
                    txtDienThoai.Text = dr["DIENTHOAI"].ToString();
                    txtEmail.Text = dr["EMAIL"].ToString();
                    txtAvatar.Text = "Chưa có";
                }
            }
            else
            {
                Response.Redirect("../QuanTri/DangNhap.aspx");
            }
        }
    }
}