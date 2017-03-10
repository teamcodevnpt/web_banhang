using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Module_View_MSlideShowTrangChuChinhN : System.Web.UI.UserControl
{
    clsSanPham mySanPham = new clsSanPham();
    protected void Page_Load(object sender, EventArgs e)
    {
        load_slide();
    }
    void load_slide()
    {
        DataTable dts = mySanPham.select_slideshow_from_sanpham();
        if (dts.Rows.Count > 0)
        {
            for (int i = 0; i < dts.Rows.Count - 1; i++)
            {
                ltrSilder.Text += "<div class='item'>";
                ltrSilder.Text += "<a href='" + ResolveUrl(dts.Rows[i]["URL"].ToString()) + "'>";
                ltrSilder.Text += "<img style='height:350px; width=100%' class='img-responsive' src='" + ResolveUrl(dts.Rows[i]["AVATAR"].ToString()) + "' alt='" + dts.Rows[i]["TEN_SANPHAM"].ToString() + "'>";
                ltrSilder.Text += "</a></div>";
            }
        }
        //for (int i=1; i<6; i++)
        //{
        //    //< div class="item"><img src = "assets/fullimage1.jpg" alt="The Last of us"></div>
        //    ltrSilder.Text += "<div class='item'><a href='https://www.w3schools.com'><img style='height:400px; width=100%' class='img-responsive' src='" + ResolveUrl("~/img/" + i + ".jpg") + "' alt='The Last of us'></a></div>";
        //}
    }
}