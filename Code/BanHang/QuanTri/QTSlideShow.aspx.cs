using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTri_QTSlideShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cmbNhomSP_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridSanPham.DataBind();
    }

    protected void gridSanPham_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        gridSPSlideShow.DataBind();
    }

    protected void gridSPSlideShow_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        gridSanPham.DataBind();
    }
}