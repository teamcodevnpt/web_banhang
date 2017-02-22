using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Module_View_SlideShowTrangChuChinh : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        load_noidung();
    }
    void load_noidung()
    {
        {
            for (int i = 1; i < 6; i++)
            {
                ltr_noidung.Text += "<li>" +
                    "<img  style='height:400px; width=100%' class='img-responsive'  src='" + ResolveUrl("~/img/" + i + ".jpg") + "'/>" +
                    " <p class='caption'>BAN HOA</p></li>";
            }

        }
    }
}