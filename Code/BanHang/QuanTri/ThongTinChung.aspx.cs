using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_ThongTinChung : System.Web.UI.Page
{
    clsThongTinChung myThongTinChung = new clsThongTinChung();
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
           DataTable dts = myThongTinChung.select_ThongTinChung();
           if (dts.Rows.Count > 0)
           {
               DataRow row = dts.Rows[0];
               txtTenCongTy.Text = row["TENCONGTY"].ToString();
               txtDienThoai.Text = row["DIENTHOAI"].ToString();
               txtEmail.Text = row["EMAIL"].ToString();
               txtDiaChi.Text = row["DIACHI"].ToString();
               txtLinkFace.Text = row["LINK_FACE"].ToString();
               txtLinkSkype.Text = row["LINK_SKYPE"].ToString();
               txtLinkTwitter.Text = row["LINK_TWITTER"].ToString();
               txtLinkGoogle.Text = row["LINK_GOOGLE"].ToString();
               txtGhiChu.Text = row["GHICHU"].ToString();
           }
       }
    }
    protected void btn_capnhat_Click(object sender, EventArgs e)
    {
        int rowsAffected = myThongTinChung.update_ThongTinChung(txtTenCongTy.Text, txtDienThoai.Text, txtEmail.Text,
                                                                txtDiaChi.Text, txtLinkFace.Text, txtLinkSkype.Text,
                                                                 txtLinkTwitter.Text, txtLinkGoogle.Text, txtGhiChu.Text);
        if(rowsAffected == 1)
        {
            Response.Write("<script>alert('Cập Nhật Thành Công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Cập Nhật Không Thành Công')</script>");
        }
    }
}