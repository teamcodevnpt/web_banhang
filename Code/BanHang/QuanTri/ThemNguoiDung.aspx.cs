using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_ThemNguoiDung : System.Web.UI.Page
{
    private static string TrangThai_ID;
    private static string Role_ID;
    clsTaiKhoan myTaiKhoan = new clsTaiKhoan();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnThemNguoiDung_Click(object sender, EventArgs e)
    {
        int hoatdong = 0;
        if (chkHoatDong.Checked) hoatdong = 1;
        if (txtTenNguoiDung.Text == "")
        {
            Response.Write("<script>alert('Tên người dùng không được rỗng')</script>");
        }
        else
        {
            if (txtTaiKhoan.Text == "")
            {
                Response.Write("<script>alert('Tài khoản không được rỗng')</script>");
            }
            else
            {
                int nhomquyen = Convert.ToInt32(drpNhomQuyen.SelectedValue);
                String tennguoidung = txtTenNguoiDung.Text.Trim();
                String tentaikhoan = txtTaiKhoan.Text.Trim();
                String matkhau = myTaiKhoan.MD5("123");
                int sluong = myTaiKhoan.insert_taikhoan(nhomquyen, hoatdong, tennguoidung,
                                                        tentaikhoan, matkhau, txtDiaChi.Text,
                                                        txtSoDT.Text, txtEmail.Text);
                if (sluong > 0)
                {
                    Response.Write("<script>alert('Người dùng đã tồn tại')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Thêm mới người dùng thành công') </script>");
                }
            }
        }           
    }
    protected void dts_Grid_NguoiDung_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@MA_TRANGTHAI"].Value = TrangThai_ID;
        e.Command.Parameters["@MA_ROLE"].Value = Role_ID;
    }
    protected void grid_NguoiDung_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && grid_NguoiDung.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddltrangthai = (e.Row.FindControl("drp_trangthai") as DropDownList);
            ddltrangthai.Items.FindByValue((e.Row.FindControl("lbl_trangthai") as Label).Text).Selected = true;
            //--------------------------------------------
            DropDownList ddnhomquyen = (e.Row.FindControl("drp_nhomquyen") as DropDownList);
            ddnhomquyen.Items.FindByValue((e.Row.FindControl("lbl_nhomquyen") as Label).Text).Selected = true;
        }
    }
    protected void grid_NguoiDung_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TrangThai_ID = (grid_NguoiDung.Rows[e.RowIndex].FindControl("drp_trangthai") as DropDownList).SelectedValue;
        Role_ID = (grid_NguoiDung.Rows[e.RowIndex].FindControl("drp_nhomquyen") as DropDownList).SelectedValue;
    }
}