﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Module_View_MListSanPham : System.Web.UI.UserControl
{
    int rownum;
    protected void Page_Load(object sender, EventArgs e)
    {
        rownum = 0;
        try
        {
            if (Session["ma_nhom_sp"] != null)
                loadsanpham(Convert.ToInt32(Session["ma_nhom_sp"].ToString()), 0);
            else
                Response.Redirect("~/Trang-chu");
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
    }
    void loadsanpham(int manhomsp, int rownum)
    {
        ConnectionDB myconn = new ConnectionDB();
        myconn.Open();
        String str = "";
        DataSet dsDSSP = new DataSet();
        List<SqlParameter> para = new List<SqlParameter>();
        para.Add(new SqlParameter("@MA_NHOM_SP", manhomsp));
        para.Add(new SqlParameter("@ROW_NUM", rownum));
        dsDSSP = myconn.Stored_ExecuteQuery_Dataset("get_DS_SP_THEO_NHOM", para);
        DataTable dt = new DataTable();
        dt = dsDSSP.Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            String tensanpham  = dt.Rows[i]["TEN_SANPHAM"].ToString();
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
                    "<img class='img-responsive' style='height:150px;' src = '" + ResolveUrl(dt.Rows[i]["AVATAR"].ToString()) + "' alt = '" + dt.Rows[i]["TEN_SANPHAM"] + "'/>" +
                    "<p style='color:blue;margin:0px;font-size:medium; text-align:center'>" + tensanpham + "</p>" +
                    "<p style='text-align:center;font-size:large; color:red;'>" + gia + "</p></a></div></div>";
        }
        ltrDSSP.Text = str;
        // phân trang
        String strPhanTrang = "<div class='row'>" +
                               " <ul class='pager'>" +
                                    "<li><a href='#'>Previous</a></li>"+
                                    "<li><a href='#'>Next</a></li>" +
                               " </ul></div>" ;
        ltrPhanTrang.Text = strPhanTrang;

    }
}