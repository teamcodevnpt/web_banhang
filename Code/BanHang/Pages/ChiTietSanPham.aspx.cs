using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ChiTietSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (RouteData.Values["ID_SAN_PHAM"] != null)
            {
                Session["ma_sp"] = Convert.ToInt32(RouteData.Values["ID_SAN_PHAM"].ToString()); ;
            }
            else
            {
                Response.Redirect("~/Trang-chu");
            }
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
    }
}