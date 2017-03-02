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
        String FileName="";
        String Patch = Server.MapPath("~/Images/NhomSP/");
        clsDanhMuc DM = new clsDanhMuc();
        if (FileAnhDD.HasFile)
        {
            FileName = DateTime.Now.Ticks + FileAnhDD.FileName.Substring(FileAnhDD.FileName.LastIndexOf("."));
            FileAnhDD.SaveAs(Patch + FileName);
        }
        DM.insert_NhomSP(txtTenNhom_SP.Text, txtSTT.Text, cmbNhomSPCha.SelectedValue, cmbSlideShow.SelectedValue, "../Images/NhomSP/" +FileName);
        gridNhomSP.DataBind();
        Response.Redirect("DanhMuc.aspx");
    }


    protected void gridNhomSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String FileName = "";
        
        String Patch = Server.MapPath("~/Images/NhomSP/");
        clsDanhMuc DM = new clsDanhMuc();
         //ThuTu=(gridNhomSP.Rows[e.RowIndex].FindControl("STT") as TextBox).Text;
         //manhom_sanpham = (gridNhomSP.Rows[e.RowIndex].FindControl("MANHOM_SANPHAM") as TextBox).Text;
         //tennhom_sanpham = (gridNhomSP.Rows[e.RowIndex].FindControl("TENNHOM_SANPHAM") as TextBox).Text;
         nhom_sanpham_cha =(gridNhomSP.Rows[e.RowIndex].FindControl("cmbNhomSPCha_N") as DropDownList).SelectedValue.ToString();
         slide_show=(gridNhomSP.Rows[e.RowIndex].FindControl("cmbSlideShow_N") as DropDownList).SelectedValue.ToString();
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
        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "s", "alert('" + tennhom_sanpham + "');",true);
        //DM.update_NhomSP(tennhom_sanpham, ThuTu, nhom_sanpham_cha, slide_show, avatar,ma_trangthai,gridNhomSP.DataKeys[e.RowIndex]["MANHOM_SANPHAM"].ToString());
            }

    protected void sourceNhomSP_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        //e.Command.Parameters["@MA_TRANGTHAI"].Value = ma_trangthai;
        //e.Command.Parameters["@TENNHOM_SANPHAM"].Value = tennhom_sanpham;
        //e.Command.Parameters["@THUTU"].Value = ThuTu;
        e.Command.Parameters["@MANHOM_CHA"].Value = nhom_sanpham_cha;
        e.Command.Parameters["@SLIDE_SHOW"].Value = slide_show ;
        e.Command.Parameters["@AVATAR"].Value = avatar;
        e.Command.Parameters["@MA_TRANGTHAI"].Value = ma_trangthai;
        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "s", "alert('" + e.Command.Parameters["@MANHOM_SANPHAM"].Value + "');", true);
    }

    protected void sourceNhomSP_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        clsDanhMuc DM = new clsDanhMuc();
        if (DM.select_nhomsp_from_sanpham(e.Command.Parameters[0].Value.ToString()).Rows.Count > 0)
        {

        }
        ScriptManager.RegisterClientScriptBlock(this, GetType(), "DeleteAlert", "alert('Nhóm sản phẩm đã được sử dụng. Không thể xoá!')", true);
        e.Cancel = true;
    }

    protected void gridNhomSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //clsDanhMuc DM = new clsDanhMuc();
        //if (DM.select_nhomsp_from_sanpham(e.Command.Parameters[0].Value.ToString()).Rows.Count > 0)
        //{

        //}
        //ScriptManager.RegisterClientScriptBlock(this, GetType(), "DeleteAlert", "alert('Nhóm sản phẩm đã được sử dụng/n Không thể xoá')", true);
        //e.Cancel = true;
    }
    protected void gridNhomSP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && gridNhomSP.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlCountries = (e.Row.FindControl("cmbNhomSPCha_N") as DropDownList);
            if (ddlCountries.Items.Count >0)
            {
                string NhomSPCha = (e.Row.FindControl("lblNhomSPCha_N") as Label).Text;
                //
                //    ddlCountries.Items.FindByValue(NhomSPCha).Selected = true;
                //}
                if (NhomSPCha.ToString ().Trim() != "") 
                {
                ddlCountries.SelectedItem.Text = NhomSPCha;
                }
                
            }
            
        }

    }
}