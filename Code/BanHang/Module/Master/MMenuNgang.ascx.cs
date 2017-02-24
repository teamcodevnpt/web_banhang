using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Module_Master_MMenuNgang : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        loadMenu();
    }
    void loadMenu()
    {
        ConnectionDB myconn = new ConnectionDB();
        string str = "";
        myconn.Open();
        DataSet ds_menu = new DataSet();
        ds_menu = myconn.Stored_ExecuteQuery_Dataset_noPara("get_menu_ngang");
        DataTable dt_menu = new DataTable();
        dt_menu = ds_menu.Tables[0];
        for (int i=0; i<dt_menu.Rows.Count; i++)
        {
            str += "<li><a href='" + ResolveUrl(dt_menu.Rows[i]["URL"].ToString ()) +"'>" + dt_menu.Rows[i]["TEN_SANPHAM"] +"</a></li>";
        }
        ltrMenu.Text = str;

    }
}