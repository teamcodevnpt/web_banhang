using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Module_View_MListSanPham : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["ma_nhom_sp"] != null)
            { 
                loadsanpham(Convert.ToInt32(Session["ma_nhom_sp"].ToString()));
                loadspphantrang(Convert.ToInt32(Session["ma_nhom_sp"].ToString()));
            }
            else
            {
                Response.Redirect("~/Trang-chu");
            }
                
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
    }
    void loadsanpham(int manhomsp)
    {
        try
        {
            ConnectionDB myconn = new ConnectionDB();
            myconn.Open();
            String str = "";
            DataSet dsDSSP = new DataSet();
            List<SqlParameter> para = new List<SqlParameter>();
            if (Session["page"] == null)
            {
                para.Add(new SqlParameter("@PageNum", 1));
            }
            else
            {
                para.Add(new SqlParameter("@PageNum", Session["page"]));
            }

            para.Add(new SqlParameter("@MA_NHOM_SP", manhomsp));
            dsDSSP = myconn.Stored_ExecuteQuery_Dataset("GET_DS_SP_THEO_MA_SP", para);
            DataTable dt = new DataTable();
            dt = dsDSSP.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                String tensanpham = dt.Rows[i]["TEN_SANPHAM"].ToString();
                if (tensanpham.Length > 15)
                {
                    tensanpham = tensanpham.Substring(0, 15) + "...";
                }
                String gia = dt.Rows[i]["GIA"].ToString();
                if (gia == "0")
                {
                    gia = "Liên hệ";
                }
                else
                {
                    gia = String.Format("{0:0,0}", Convert.ToInt32(gia)) + "đ";
                }
                str += "<div class='col-md-3 col-xs-6'>" +
                    "<div class='media'>" +
                        "<a href='" + ResolveUrl(dt.Rows[i]["URL"].ToString()) + "' class='thumbnail' style='text-decoration:none;'>" +
                        "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(dt.Rows[i]["AVATAR"].ToString()) + "'/>" +
                        "<p style='color:blue; font-size: medium; margin:0px; text-align:center'>" + tensanpham + "</p>" +
                        "<p style='text-align:center;font-size: large;color:red'>" + gia + "</p></a></div></div>";
            }
            ltrDSSP.Text = str;
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }

    }
    void loadspphantrang(int manhomsp)
    {
        ConnectionDB myconn = new ConnectionDB();
        myconn.Open();
        List<SqlParameter> para = new List<SqlParameter>();
        para.Add(new SqlParameter("@MA_SAN_PHAM", manhomsp));
        int tongsp = Convert.ToInt32(myconn.Stored_ExcuteScalar("DEM_SP_THEO_MA_SP", para));
        string url = Request.Url.ToString();
        string[] strsplit = url.Split('/');
        String str;
        str = "<ul class='pagination'>";
        int i = 1;
        while (tongsp > 20)
        {
            if (Session["page"].ToString() == i.ToString())
            {
                str += "<li class = 'active'>";
            }
            else
            { 
                str += "<li>";
            }
            str +=  "<a href = '" + ResolveUrl("~/Danh-sach-san-pham/" + strsplit[4] + "/" + strsplit[5]  + "/Page/" + i) + "'>" + i + "</a></li>";
            tongsp = tongsp - 20;
            i++;
        }
        str += "</ul>";
        ltrPhanTrang.Text = str;
//        str = "<ul class='pagination pagination-sm'>" +
//   "<li class='disabled'><a href = '#'> &laquo;</a></li>" +
//  "<li class='active'><a href = '#'>1</a></li>" +
//  "<li><a href='#'>2</a></li>" +
//  "<li><a href = '#'>3</a></li>" +
//  "<li><a href='#'>&raquo;</a></li>"+
//"</ul>";
    }
}