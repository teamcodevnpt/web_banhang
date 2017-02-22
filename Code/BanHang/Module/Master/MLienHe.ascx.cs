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
            lblDiaChi.Text = row["DIACHI"].ToString();
            lblDienThoai.Text = row["DIENTHOAI"].ToString();
            lblEmail.Text = row["EMAIL"].ToString();
        }
    }
}