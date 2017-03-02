using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_ChiTiet_SanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["id"] != "") {
                clsSanPham SP = new clsSanPham();
                DataTable DT=new DataTable();
                try
                {
                    DT = SP.select_sanpham_from_masp(Request.QueryString["id"]);
                }
                catch(Exception ex)
                {

                }  
                if (DT.Rows.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "NotExistSP", "alert('Sản phẩm không tồn tại!'); window.location.href='sanpham.aspx';", true);
                }
                else
                {
                    btnThemSP.Visible = false;
                    btnCapNhatSP.Visible = true;
                    //Móc thông tin sản phẩm
                    DataRow DR = DT.Rows[0];
                    txtTenSanPham.Text = DR["TEN_SANPHAM"].ToString();
                    txtThuTu.Text = DR["THUTU"].ToString();
                    txtMoTa.Text = DR["MOTA"].ToString();
                    txtGia.Text = DR["GIA"].ToString();
                    txtGiaKhuyenMai.Text = DR["GIA_KHUYENMAI"].ToString();
                    ckNoiDung.Text = DR["NOIDUNG"].ToString();
                    cmbNhomSP.SelectedValue = DR["MANHOM_SANPHAM"].ToString();
                    cmbSlideShow.SelectedValue = DR["SLIDE_SHOW"].ToString();
                    cmbTrangThai.SelectedValue = DR["MA_TRANGTHAI"].ToString();
                    cmbUuTien.SelectedValue = DR["UU_TIEN"].ToString();
                    imgSanPham.ImageUrl = DR["AVATAR"].ToString();
                }
            }
            else
            {
                btnThemSP.Visible = true;
                btnCapNhatSP.Visible = false;
            }
        }

    }


    protected void btnThemSP_Click(object sender, EventArgs e)
    {
        clsSanPham SP = new clsSanPham();
        String FileName = "";
        String Patch = Server.MapPath("~/Images/SanPham/");
        //try
        //{
            if (FileAnhDD.HasFile)
            {
                FileName = DateTime.Now.Ticks + FileAnhDD.FileName.Substring(FileAnhDD.FileName.LastIndexOf("."));
                FileAnhDD.SaveAs(Patch + FileName);
            }
            if (SP.insert_sanpham(Convert.ToInt32(cmbNhomSP.SelectedValue.ToString()), Convert.ToInt32( cmbTrangThai.SelectedValue.ToString()), txtTenSanPham.Text, txtMoTa.Text,Convert.ToInt32(txtThuTu.Text), ckNoiDung.Text,Convert.ToInt32( cmbSlideShow.SelectedValue.ToString()),Convert.ToDecimal( txtGia.Text.ToString()), "~/Images/SanPham/" + FileName, 
               Convert.ToInt32( cmbUuTien.SelectedValue.ToString()),Convert.ToDecimal( txtGiaKhuyenMai.Text)) > 0)
            {
                Response.Redirect("ChiTiet_SanPham.aspx");
            }
        //}
        //catch(Exception)
        //{

        //}
    }

    protected void btnCapNhatSP_Click(object sender, EventArgs e)
    {
       
        
    }

    protected void btnCapNhatSP_Click1(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertFail", "alert('" + Request.QueryString["id"].ToString() + "')", true);
        clsSanPham SP = new clsSanPham();
        String FileName = "";
        String Patch = Server.MapPath("~/Images/SanPham/");
        if (imgSanPham.ImageUrl != null && imgSanPham.ImageUrl != "")
        {
            String P = Server.MapPath("~/Images/SanPham/");
            String F = imgSanPham.ImageUrl;
            P += F.Substring(F.LastIndexOf("/"));
            if (File.Exists(P))
            {
                File.Delete(P);
            }
            if (FileAnhDD.HasFile)
            {
                FileName = DateTime.Now.Ticks + FileAnhDD.FileName.Substring(FileAnhDD.FileName.LastIndexOf("."));
                FileAnhDD.SaveAs(Patch + FileName);
            }
        }
        if (SP.update_sanpham(cmbNhomSP.SelectedValue, cmbTrangThai.SelectedValue, txtTenSanPham.Text, txtMoTa.Text, txtThuTu.Text, ckNoiDung.Text, cmbSlideShow.SelectedValue, txtGia.Text, "../Images/SanPham/" + FileName, cmbUuTien.SelectedValue, txtGiaKhuyenMai.Text, Request.QueryString["id"].ToString()) > 0)
        {
            Response.Redirect(Request.RawUrl);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "AlertFail", "alert('Cập nhật sản phẩm thất bại!')", true);
        }
    }
}