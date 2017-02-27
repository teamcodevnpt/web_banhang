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
            DataSet dsCT = new DataSet();
            List<SqlParameter> para = new List<SqlParameter>();
            para.Add(new SqlParameter("@MA_SAN_PHAM", masanpham));
            dsCT = myconn.Stored_ExecuteQuery_Dataset("get_SAN_PHAM",para);
            DataTable dt = new DataTable();
            dt = dsCT.Tables[0];
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["TEN_SANPHAM"] != null)
                {
                    ltrTenSP.Text = "<h4>" + dt.Rows[0]["TEN_SANPHAM"].ToString() + "</h4>";
                }
                else
                {
                    ltrTenSP.Text = "";
                }
                if (dt.Rows[0]["NOIDUNG"] != null)
                {
                    ltrNoidung.Text = dt.Rows[0]["NOIDUNG"].ToString();
                }
                else
                {
                    ltrNoidung.Text = "";
                }
                if (dt.Rows[0]["AVATAR"] != null)
                {
                    ltrHinhAnh.Text = "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(dt.Rows[0]["AVATAR"].ToString()) + "'/>";
                }
                else
                {
                    ltrHinhAnh.Text = "";
                }
                if (dt.Rows[0]["GIA"] != null)
                {
                    ltrGia.Text = dt.Rows[0]["GIA"].ToString();
                }
                else
                {
                    ltrGia.Text = "Vui lòng liên hệ";
                }
                if (dt.Rows[0]["MOTA"] != null)
                {
                    ltrMota.Text = dt.Rows[0]["MOTA"].ToString();
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
