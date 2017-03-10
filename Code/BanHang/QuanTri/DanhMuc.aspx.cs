using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class QuanTri_DanhMuc : System.Web.UI.Page
{
    private static string ThuTu;
    private static string tennhom_sanpham;
    private static string nhom_sanpham_cha;
    private static string slide_show;
    private static string ma_trangthai;
    private static string avatar;
    private static string manhom_sanpham;
    clsDanhMuc myDanhMuc = new clsDanhMuc();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtSTT.Attributes.Add("placeholder", "STT");
            txtTenNhom_SP.Attributes.Add("placeholder", "Tên nhóm sản phẩm");
            cmbNhomSPCha.Attributes.Add("placeholder", "Nhóm sản phẩm cha");
        }
    }
    protected void btnThemNhomSP_Click1(object sender, EventArgs e)
    {
        String FileName = "";
        String Patch = Server.MapPath("~/Images/NhomSP/");
        if (FileAnhDD.HasFile 
            && FileAnhDD.FileName.Substring(FileAnhDD.FileName.LastIndexOf(".")) != ".jpg" 
            && FileAnhDD.FileName.Substring(FileAnhDD.FileName.LastIndexOf(".")) != ".png")
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "SaiAnh", "alert('Vui lòng chọn định dạng ảnh là .jpg hoặc .png')",true);
        }
        else
        {
            if (FileAnhDD.HasFile)
            {
                FileName = DateTime.Now.Ticks + FileAnhDD.FileName.Substring(FileAnhDD.FileName.LastIndexOf("."));
                FileAnhDD.SaveAs(Patch + FileName);
            }
            myDanhMuc.insert_NhomSP(txtTenNhom_SP.Text, txtSTT.Text, cmbNhomSPCha.SelectedValue, cmbSlideShow.SelectedValue, "~/Images/NhomSP/" + FileName);
            gridNhomSP.DataBind();
            Response.Redirect("DanhMuc.aspx");
        }
    }
    protected void gridNhomSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String FileName = "";
        
        String Patch = Server.MapPath("~/Images/NhomSP/");
        nhom_sanpham_cha = (gridNhomSP.Rows[e.RowIndex].FindControl("cmbNhomSPCha_N") as DropDownList).SelectedValue.ToString();
        slide_show =(gridNhomSP.Rows[e.RowIndex].FindControl("cmbSlideShow_N") as DropDownList).SelectedValue.ToString();
        ma_trangthai = (gridNhomSP.Rows[e.RowIndex].FindControl("cmbTrangThai_N") as DropDownList).SelectedValue.ToString();
        if ((gridNhomSP.Rows[e.RowIndex].FindControl("lblAvatar") as Literal).Text != "")
        {
            String P = Server.MapPath("~/Images/NhomSP/");
            String F = (gridNhomSP.Rows[e.RowIndex].FindControl("lblAvatar") as Literal).Text;
            P += F.Substring(F.LastIndexOf("/"));
            if (File.Exists(P))
            {
                File.Delete(P);
            }
        }
        avatar ="";
        FileUpload Anh = gridNhomSP.Rows[e.RowIndex].FindControl("FileAnhDD_N") as FileUpload;
        if (Anh.HasFile)
        {
            FileName = DateTime.Now.Ticks + Anh.FileName.Substring(Anh.FileName.LastIndexOf("."));
            Anh.SaveAs(Patch + FileName);
            avatar = "~/Images/NhomSP/" + FileName;
        }
    }
    protected void sourceNhomSP_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@MANHOM_CHA"].Value = nhom_sanpham_cha;
        e.Command.Parameters["@SLIDE_SHOW"].Value = slide_show ;
        e.Command.Parameters["@AVATAR"].Value = avatar;
        e.Command.Parameters["@MA_TRANGTHAI"].Value = ma_trangthai;
    }
    protected void sourceNhomSP_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (myDanhMuc.select_nhomsp_from_sanpham(e.Command.Parameters[0].Value.ToString()).Rows.Count > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "DeleteAlert", "alert('Nhóm sản phẩm đã được sử dụng. Không thể xoá!')", true);
        e.Cancel = true;
        }
    }

    protected void gridNhomSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }
    protected void gridNhomSP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && gridNhomSP.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlNhomSP = (e.Row.FindControl("cmbNhomSPCha_N") as DropDownList);
            if (ddlNhomSP.Items.Count > 0)
            {
                string NhomSPCha = (e.Row.FindControl("lblNhomSPCha_N") as Label).Text;
                ddlNhomSP.Items.FindByValue(NhomSPCha).Selected = true;
            }
        }

    }


    protected void gridNhomSP_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        cmbNhomSPCha.DataBind();
    }
}