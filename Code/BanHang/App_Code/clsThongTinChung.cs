using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsThongTinChung
/// </summary>
public class clsThongTinChung
{
	public clsThongTinChung()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    ConnectionDB myConn = new ConnectionDB();
    public DataTable select_ThongTinChung()
    {
        DataTable dts = new DataTable();
        dts = myConn.Stored_ExecuteQuery_Datatable_noPara("select_thongtinchung");
        return dts;
    }
}