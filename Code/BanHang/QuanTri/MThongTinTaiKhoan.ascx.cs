using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_MThongTinTaiKhoan : System.Web.UI.UserControl
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
                    txtHoTen.Text = dr["HOTEN"].ToString();
                    txtDiaChi.Text = dr["DIACHI"].ToString();
                    txtDienThoai.Text = dr["DIENTHOAI"].ToString();
                    txtEmail.Text = dr["EMAIL"].ToString();
                    //txtAvatar.Text = "Chưa có";
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
        String FileName = "";
        String Patch = Server.MapPath("~/QuanTri/Avatar/");
        if (fileAvatar.HasFile)
        {
            FileName = Session["MaTaiKhoan"].ToString() + "_" + Session["TaiKhoan"].ToString() + fileAvatar.FileName.Substring(fileAvatar.FileName.LastIndexOf("."));
            File.Delete(Patch + FileName);
            fileAvatar.SaveAs(Patch + FileName);
        }
        int ma_taikhoan = int.Parse(Session["MaTaiKhoan"].ToString());
        int count = myTaiKhoan.update_thongtin(ma_taikhoan, txtHoTen.Text, txtDiaChi.Text, txtDienThoai.Text, txtEmail.Text, "../QuanTri/Avatar/" + FileName);
        if (count == 1)
        {
            Session["Avatar"] = "../QuanTri/Avatar/" + FileName;
            Response.Redirect("../QuanTri/Default.aspx");
        }
        else
        {
            Response.Write("<script>alert('Cập Nhật Không Thành Công')</script>");
        }
    }
}