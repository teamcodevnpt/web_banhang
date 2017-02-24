using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Module_View_MSlideShowTrangChuChinhN : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        load_slide();
    }
    void load_slide()
    {
        for (int i=1; i<6; i++)
        {
            //< div class="item"><img src = "assets/fullimage1.jpg" alt="The Last of us"></div>
            ltrSilder.Text += "<div class='item'><img style='height:400px; width=100%' class='img-responsive' src='" + ResolveUrl("~/img/" + i + ".jpg") + "' alt='The Last of us'></div>";
        }
    }
}