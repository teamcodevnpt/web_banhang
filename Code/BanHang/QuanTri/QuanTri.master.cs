using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_QuanTri : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["HoTen"] == null || Session["HoTen"].ToString() == "")
        {
            Response.Redirect("../QuanTri/DangNhap.aspx");
        }
        else
        {
            lblTenNguoiDung.Text = Session["HoTen"].ToString();
        }
    }

}
