using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_TimKiem : System.Web.UI.Page
{
    clsSanPham mySanPham = new clsSanPham();
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
            string keyword = RouteData.Values["TimKiem_ID"].ToString();
            DataTable dts = mySanPham.search_sanpham(keyword);
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
                    str += "<div class='col-md-3 col-xs-6' alt = '" + dts.Rows[i]["TEN_SANPHAM"] + "'>" +
                        "<div class='media'>" +
                            "<a href='" + ResolveUrl(dts.Rows[i]["URL"].ToString()) + "' class='thumbnail' style='text-decoration:none;'>" +
                            "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(dts.Rows[i]["AVATAR"].ToString()) + "' alt = '" + dts.Rows[i]["TEN_SANPHAM"] + "'/>" +
                            "<p style='color:orangered; font-size: medium; margin:0px; text-align:center'>" + tensanpham + "</p>" +
                            "<p style='text-align:center; font-size: large'>" + dts.Rows[i]["GIA"] + "</p></a></div></div>";
                }
            }
            else
            {
                str = "Không tìm thấy sản phẩm";
            }
            ltrDSSP.Text = str;
        //}catch
        //{
        //    Response.Redirect("~/Trang-chu");
        //}
    }
}