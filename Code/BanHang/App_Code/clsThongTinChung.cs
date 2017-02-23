using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class clsThongTinChung
{
	public clsThongTinChung()
	{

	}
    ConnectionDB myConn = new ConnectionDB();
    public DataTable select_ThongTinChung()
    {
        DataTable dts = new DataTable();
        dts = myConn.Stored_ExecuteQuery_Datatable_noPara("select_thongtinchung");
        return dts;
    }
    public int update_ThongTinChung(String tencongty, String dienthoai, String email, String diachi,
                                    String link_face, String link_skype, String link_twitter,
                                    String link_google, String ghichu)
    {
        int rowsAffected;
        List<SqlParameter> parameters = new List<SqlParameter>();
        parameters.Add(new SqlParameter("@tencongty", tencongty));
        parameters.Add(new SqlParameter("@dienthoai", dienthoai));
        parameters.Add(new SqlParameter("@email", email));
        parameters.Add(new SqlParameter("@diachi", diachi));
        parameters.Add(new SqlParameter("@link_face", link_face));
        parameters.Add(new SqlParameter("@link_skype", link_skype));
        parameters.Add(new SqlParameter("@link_twitter", link_twitter));
        parameters.Add(new SqlParameter("@link_google", link_google));
        parameters.Add(new SqlParameter("@ghichu", ghichu));
        rowsAffected = myConn.Stored_ExecuteNonQuery("update_thongtinchung", parameters);
        return rowsAffected;
    }
}