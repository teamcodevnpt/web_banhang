using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_ThongTinChung : System.Web.UI.Page
{
    clsThongTinChung myThongTinChung = new clsThongTinChung();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dts = myThongTinChung.select_ThongTinChung();
        gridThongTinChung.DataSource = dts;
    }
}