using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_TimKiem : System.Web.UI.Page
{
    clsSanPham mySanPham = new clsSanPham();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try
            {
                string keyword = RouteData.Values["TimKiem_ID"].ToString();
                int page = 1;
                try
                {
                    page = Convert.ToInt32(RouteData.Values["TimKiemPage_Num"].ToString());
                }
                catch
                {
                    page = 1;
                }
                loadSanPham(keyword, page);
                PhanTrang(keyword, page);
            }
            catch
            {
                Response.Redirect("~/Trang-chu");
            }
        }
    }
    void loadSanPham(String keyword, int page)
    {
        DataTable dts = mySanPham.search_sanpham(keyword, page);
        string str = "";
        if (dts.Rows.Count > 0)
        {
            for (int i = 0; i < dts.Rows.Count; i++)
            {
                String tensanpham = dts.Rows[i]["TEN_SANPHAM"].ToString();
                if (tensanpham.Length > 15)
                {
                    tensanpham = tensanpham.Substring(0, 15) + "...";
                }
                String gia = dts.Rows[i]["GIA"].ToString();
                if (gia == "0")
                {
                    gia = "Liên hệ";
                }
                else
                {
                    gia = String.Format("{0:0,0}", Convert.ToInt32(gia)) + "đ";
                }
                str += "<div class='col-md-3 col-xs-6' alt = '" + dts.Rows[i]["TEN_SANPHAM"] + "'>" +
                        "<div class='media'>" +
                        "<a href='" + ResolveUrl(dts.Rows[i]["URL"].ToString()) + "' class='thumbnail' style='text-decoration:none;'>" +
                        "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(dts.Rows[i]["AVATAR"].ToString()) + "' alt = '" + dts.Rows[i]["TEN_SANPHAM"] + "'/>" +
                        "<p style='color:blue; font-size: medium; margin:0px; text-align:center'>" + tensanpham + "</p>" +
                        "<p style='text-align:center; font-size: large;color:red'>" + gia + "</p></a></div></div>";
            }
        }
        else
        {
            str = "Không tìm thấy sản phẩm";
        }
        ltrDSSP.Text = str;
    }
    void PhanTrang(String keyword, int page)
    {
        ConnectionDB myconn = new ConnectionDB();
        myconn.Open();
        List<SqlParameter> para = new List<SqlParameter>();
        para.Add(new SqlParameter("@keyword", keyword));
        int tongsp = Convert.ToInt32(myconn.Stored_ExcuteScalar("DEM_SP_THEO_KEYWORD", para));
        string url = Request.Url.ToString();
        string[] strsplit = url.Split('/');
        String str;
        str = "<ul class='pagination'>";
        int i = 1;
        while (tongsp > 20)
        {
            if (page == i)
            {
                str += "<li class = 'active'>";
            }
            else
            {
                str += "<li>";
            }
            str +=  "<a href = '" + ResolveUrl("~/Tim-Kiem/" + keyword + "/Page/" + i) + "'>" + i + "</a></li>";
            tongsp = tongsp - 20;
            i++;
            if (tongsp <= 20)
            {
                if (page == i)
                {
                    str += "<li class = 'active'>";
                }
                else
                {
                    str += "<li>";
                }
                str += "<a href = '" + ResolveUrl("~/Tim-Kiem/" + keyword + "/Page/" + i) + "'>" + i + "</a></li>";
            }
        }
        str += "</ul>";
        ltrPhanTrang.Text = str;
    }
}