using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Pages_Lienhe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ConnectionDB myconn = new ConnectionDB();
            myconn.Open();
            DataTable dt = new DataTable();
            dt = myconn.Stored_ExecuteQuery_Datatable_noPara("select_thongtinchung");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["DIENTHOAI"].ToString() != "")
                {
                    ltrSDT.Text = dt.Rows[0]["DIENTHOAI"].ToString();
                }
                else
                {
                    ltrSDT.Text = "Đang cập nhật";
                }
                if (dt.Rows[0]["EMAIL"].ToString() != "")
                {
                    ltrEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                }
                else
                {
                    ltrEmail.Text = "Đang cập nhật";
                }
                if (dt.Rows[0]["DIACHI"].ToString() != "")
                {
                    ltrDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                }
                else
                {
                    ltrDiaChi.Text = "Đang cập nhật";
                }
            }
        }
        catch
        {
            Response.Redirect("~/Trang-chu");
        }
    }
}