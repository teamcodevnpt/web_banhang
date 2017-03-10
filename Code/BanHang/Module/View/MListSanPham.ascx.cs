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
                loadsanpham(Convert.ToInt32(Session["ma_nhom_sp"].ToString()));
            else
                Response.Redirect("~/Trang-chu");
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
            para.Add(new SqlParameter("@MA_NHOM_SP", manhomsp));
            dsDSSP = myconn.Stored_ExecuteQuery_Dataset("get_DS_SP_THEO_NHOM", para);
            DataTable dt = new DataTable();
            dt = dsDSSP.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<div class='col-md-3 col-xs-6'>" +
                    "<div class='media'>" +
                        "<a href='" + ResolveUrl(dt.Rows[i]["URL"].ToString()) + "' class='thumbnail' style='text-decoration:none;'>" +
                        "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(dt.Rows[i]["AVATAR"].ToString()) + "'/>" +
                        "<h4 style='color:blue;margin:0px; text-align:center'>" + dt.Rows[i]["TEN_SANPHAM"] + "</h4>" +
                        "<h3 style='text-align:center; color:red;'>" + dt.Rows[i]["GIA"] + "</h3></a></div></div>";
            }
            ltrDSSP.Text = str;
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }

    }
}