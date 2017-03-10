using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Module_Master_MLienHe : System.Web.UI.UserControl
{
    clsThongTinChung myThongTinChung = new clsThongTinChung();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dts = myThongTinChung.select_ThongTinChung();
        if (dts.Rows.Count > 0)
        {
            DataRow row = dts.Rows[0];
            ltrLienHe.Text += "<div class='row' style='margin:5px'>";
            ltrLienHe.Text += "<span class='glyphicon glyphicon-home'></span>&nbsp&nbsp" + row["TENCONGTY"].ToString() + "<br/>";
            ltrLienHe.Text += "<span class='glyphicon glyphicon-home'></span>&nbsp&nbsp" + row["DIACHI"].ToString() + "<br/>";
            ltrLienHe.Text += "<span class='glyphicon glyphicon-phone-alt'></span>&nbsp " + row["DIENTHOAI"].ToString() + "<br/>";
            ltrLienHe.Text += "<span class='glyphicon glyphicon-envelope'></span>&nbsp&nbsp<a href='mailto:" + row["EMAIL"].ToString() + "?subject=Comments'>" + row["EMAIL"].ToString() + "</a>";
            ltrLienHe.Text += "</div>";
        }
    }
}