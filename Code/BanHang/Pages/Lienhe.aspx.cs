using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Pages_Lienhe : System.Web.UI.Page
{
    clsThongTinChung myThongTinChung = new clsThongTinChung();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DataTable dts = myThongTinChung.select_ThongTinChung();
            if (dts.Rows.Count > 0)
            {
                DataRow row = dts.Rows[0];
                ltrLienHe.Text += "<div class='row' style='margin:5px'>";
                ltrLienHe.Text += "<span class='glyphicon glyphicon-home'></span>&nbsp&nbsp Địa chỉ:" + row["DIACHI"].ToString() + "<br/>";
                ltrLienHe.Text += "<span class='glyphicon glyphicon-phone-alt'></span>&nbsp Điện thoại: " + row["DIENTHOAI"].ToString() + "<br/>";
                ltrLienHe.Text += "<span class='glyphicon glyphicon-envelope'></span>&nbsp&nbsp Email: <a href='mailto:" + row["EMAIL"].ToString() + "?subject=Comments'>" + row["EMAIL"].ToString() + "</a>";
                ltrLienHe.Text += "</div>";
            }
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
    }
}