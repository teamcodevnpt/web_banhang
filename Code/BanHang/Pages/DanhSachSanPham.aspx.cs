using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_DanhSachSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (RouteData.Values["ID_NHOM_SAN_PHAM"] != null)
            {
                Session["ma_nhom_sp"] = Convert.ToInt32(RouteData.Values["ID_NHOM_SAN_PHAM"].ToString());
            }
            else
            {
                Response.Redirect("~/Trang-chu");
            }
            if (RouteData .Values["Page_Num"] != null)
            {
                Session["page"] = Convert.ToInt32(RouteData.Values["Page_Num"]);
            }
            else
            {
                Session["page"] = 1;
            }
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
        
        
    }
}