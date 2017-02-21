using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       try
       {
           if (Session["tennguoidung"].ToString() == "" || Session["tennguoidung"].ToString() == null)
           {
               Response.Redirect("../QuanTri/DangNhap.aspx");
           }
       }
       catch
       {
           Response.Redirect("../QuanTri/DangNhap.aspx");
       }
    }
}