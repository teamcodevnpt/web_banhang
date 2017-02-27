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
        String str = "";
        dt = myconn.Stored_ExecuteQuery_Datatable_noPara("get_all_danh_muc_nganh_hang");
        for (int i=0; i<dt.Rows.Count; i++)
        {
            str += "<a href='" + ResolveUrl(dt.Rows[i]["URL"].ToString()) + "' class='list-group-item'>" + dt.Rows[i]["TENNHOM_SANPHAM"] +"</a>";
        }
        ltrDanhMuc.Text = str;
    }
}