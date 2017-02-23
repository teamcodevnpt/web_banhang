using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Module_Master_MMangXaHoi : System.Web.UI.UserControl
{
    clsThongTinChung myThongTinChung = new clsThongTinChung();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dts = myThongTinChung.select_ThongTinChung();
        if (dts.Rows.Count > 0)
        {
            DataRow row = dts.Rows[0];
            ltrMangXaHoi.Text += "<div class='row' style='margin:5px'>";
            ltrMangXaHoi.Text += "<a href='" + row["LINK_FACE"].ToString() + "'style='color :darkblue'><i class='fa fa-facebook-official fa-2x' aria-hidden='true' ></i>&nbsp Facebook<br/></a>";
            ltrMangXaHoi.Text += "<a href='" + row["LINK_GOOGLE"].ToString() + "'style='color :darkblue'><i class='fa fa-google-plus-official fa-2x' aria-hidden='true'></i>&nbsp Google+<br /></a>";
            ltrMangXaHoi.Text += "<a href='" + row["LINK_SKYPE"].ToString() + "'style='color :darkblue' ><i class='fa fa-skype fa-2x' aria-hidden='true'></i>&nbsp Skype</a>";
            ltrMangXaHoi.Text += "</div>";
        }
    }
}