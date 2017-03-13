using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TrangChu : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        load_anh_BAnner();
    }
    void load_anh_BAnner()
    {
        ltrLogo.Text = "<img class='img-responsive' src='" + ResolveUrl("~/Images/AnhChung/logo.jpg") + "' alt='Bán Hàng Tận Nơi' style='height:200px; width:100%'>";
        ltr_AnhBanner.Text = "<img class='img-responsive' src='" + ResolveUrl("~/Images/AnhChung/giaohang.jpg") + "' style='height:200px;width:100%'>";
        ltr_Hotline.Text = "<img class='img-responsive' src='" + ResolveUrl("~/Images/AnhChung/hotline.jpg") + "' alt='HotLine' style='height:200px;width:100%'>";
    }
}
