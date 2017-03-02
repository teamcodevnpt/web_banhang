using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Module_View_CT_SanPham : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ma_sp"] != null)
        {
            loadChiTiet(Convert.ToInt32(Session["ma_sp"].ToString()));
        }
        else
        {
            Response.Redirect("~/Trang-chu");
        }
    }
    void loadChiTiet(int masanpham)
    {
        try
        {
            ConnectionDB myconn = new ConnectionDB();
            myconn.Open();
            DataTable dts = new DataTable();
            List<SqlParameter> para = new List<SqlParameter>();
            para.Add(new SqlParameter("@MA_SAN_PHAM", masanpham));
            dts = myconn.Stored_ExecuteQuery_Datatable("get_SAN_PHAM", para);
            if (dts.Rows.Count> 0)
            {
                DataRow row = dts.Rows[0];
                if (row["TEN_SANPHAM"] != null)
                {
                    ltrTenSP.Text = "<h4>" + row["TEN_SANPHAM"].ToString() + "</h4>";
                }
                else
                {
                    ltrTenSP.Text = "";
                }
                if (row["NOIDUNG"] != null)
                {
                    ltrNoidung.Text = row["NOIDUNG"].ToString();
                }
                else
                {
                    ltrNoidung.Text = "";
                }
                if (row["AVATAR"] != null)
                {
                    ltrHinhAnh.Text = "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(row["AVATAR"].ToString()) + "'/>";
                }
                else
                {
                    ltrHinhAnh.Text = "";
                }
                if (row["GIA"] != null)
                {
                    ltrGia.Text = row["GIA"].ToString();
                }
                else
                {
                    ltrGia.Text = "Vui lòng liên hệ";
                }
                if (row["MOTA"] != null)
                {
                    ltrMota.Text = row["MOTA"].ToString();
                }
                else
                {
                    ltrMota.Text = "Chưa có mô tả cho sản phẩm này";
                }

            }
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
    }
}
