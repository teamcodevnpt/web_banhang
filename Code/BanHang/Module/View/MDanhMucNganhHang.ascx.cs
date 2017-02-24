using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Module_View_MDanhMucNganhHang : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadDanhSach();
    }
    void loadDanhSach()
    {
        ConnectionDB myconn = new ConnectionDB();
        myconn.Open();
        String str = "";
        DataSet ds_danh_sach_nganh_hang = new DataSet();
        ds_danh_sach_nganh_hang= myconn.Stored_ExecuteQuery_Dataset_noPara("get_all_danh_muc_nganh_hang");
        DataTable dt_ds = ds_danh_sach_nganh_hang.Tables[0];
        for (int i=0; i<dt_ds.Rows.Count; i++)
        {
            str += "<div class='col-md-3 col-xs-6'>" +
                "<div class='media'>" +
                "<a href='../Pages/DanhSachSanPham.aspx' class='thumbnail'  style='text-decoration:none;'>" +
                "<img class='img-responsive' style='height:150px;' src ='" + ResolveUrl(dt_ds.Rows[i]["AVATAR"].ToString()) + "'/>" +
                "<p style='color: orangered; font-size: medium; margin: 0px; text-align: center'>" + dt_ds.Rows[i]["TENNHOM_SANPHAM"] + "</p>" +
                "</a></div></div>";
            ltrDanhSach.Text = str;

        }
    }
}