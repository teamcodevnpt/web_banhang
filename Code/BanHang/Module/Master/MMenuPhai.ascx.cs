using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Module_Master_MMenuPhai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadMenuPhai();
    }
    void loadMenuPhai()
    {
        ConnectionDB myconn = new ConnectionDB();
        myconn.Open();
        DataTable dt = new DataTable();
        String str = "<aside id='sidebar' class='sidebar c-overflow'> "+
                     "<div class='s-profile'><ul class='main-menu'>";
        dt = myconn.Stored_ExecuteQuery_Datatable_noPara("get_all_danh_muc_nganh_hang");
        for (int i=0; i<dt.Rows.Count; i++)
        {
            str += "<li><a href='" + ResolveUrl(dt.Rows[i]["URL"].ToString()) + "' class='list-group-item'>" + dt.Rows[i]["TENNHOM_SANPHAM"] +"</a></li>";
        }
        str += "</ul></div></aside>";
        ltrDanhMuc.Text = str;
    }
}