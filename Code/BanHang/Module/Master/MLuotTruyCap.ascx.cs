using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Module_Master_MLuotTruyCap : System.Web.UI.UserControl
{
    clsLuotTruyCap myLuotTruyCap = new clsLuotTruyCap();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dts = myLuotTruyCap.select_luottruycap();
        if (dts.Rows.Count > 0)
        {
            DataRow row = dts.Rows[0];
            ltrLuotTruyCap.Text += "<div class='row' style='margin:5px'>";
            ltrLuotTruyCap.Text += "Hôm Qua: " + row["HomQua"].ToString() + " lượt<br/>";
            ltrLuotTruyCap.Text += "Hôm Nay: " + row["HomNay"].ToString() + " lượt<br/>";
            ltrLuotTruyCap.Text += "Tháng Này: " + row["ThangNay"].ToString() + " lượt<br/>";
            ltrLuotTruyCap.Text += "Tất cả: " + row["TatCa"].ToString() + " lượt<br/>";
        }
    }
}