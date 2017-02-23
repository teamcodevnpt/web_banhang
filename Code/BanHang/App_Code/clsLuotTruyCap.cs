using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsLuotTruyCap
/// </summary>
public class clsLuotTruyCap
{
    ConnectionDB myConn = new ConnectionDB();
	public clsLuotTruyCap()
	{
		
	}
    public DataTable select_luottruycap()
    {
        DataTable dts = new DataTable();
        dts = myConn.Stored_ExecuteQuery_Datatable_noPara("select_luottruycap");
        return dts;
    }
}