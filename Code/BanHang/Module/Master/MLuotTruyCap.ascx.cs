using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Module_Master_MLuotTruyCap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ltrLuotTruyCap.Text += "<div class='row' style='margin:5px'>";
        ltrLuotTruyCap.Text += "Online: " + Application["online"].ToString() + " lượt<br/>";
        ltrLuotTruyCap.Text += "Hôm Qua: " + Application["homqua"].ToString() + " lượt<br/>";
        ltrLuotTruyCap.Text += "Hôm Nay: " + Application["homnay"].ToString() + " lượt<br/>";
        //ltrLuotTruyCap.Text += "Tháng Này: " + Application["thangnay"].ToString() + " lượt<br/>";
        ltrLuotTruyCap.Text += "Tất cả: " + Application["tatca"].ToString() + " lượt<br/>";
    }
}