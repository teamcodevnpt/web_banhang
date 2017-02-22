using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for clsTaiKhoan
/// </summary>
public class clsTaiKhoan
{
    public clsTaiKhoan()
    {

    }
    ConnectionDB myConn = new ConnectionDB();
	public DataTable quantri_check_login(String taikhoan, String matkhau)
    {
        DataTable dts = new DataTable();
        List<SqlParameter> parameters = new List<SqlParameter>();
        parameters.Add(new SqlParameter("@taikhoan", taikhoan));
        parameters.Add(new SqlParameter("@matkhau", matkhau));
        dts = myConn.Stored_ExecuteQuery_Datatable("quantri_check_login", parameters);
        return dts;
    }

}