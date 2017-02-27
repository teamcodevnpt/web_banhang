using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ClsDanhMuc
/// </summary>
public class clsDanhMuc
{
    public clsDanhMuc()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    ConnectionDB DB = new ConnectionDB();
    public DataTable select_NhomSP()
    {
        DataTable DT = new DataTable();
        DT = DB.Stored_ExecuteQuery_Datatable_noPara("select_Nhom_SP");
        return DT;
    }
   public void insert_NhomSP(String TENNHOM_SANPHAM, String THUTU, String MANHOM_CHA, String SLIDE_SHOW,String AVATAR) {
        List<SqlParameter> Params = new List<SqlParameter>();
        Params.Add(new SqlParameter("@TENNHOM_SANPHAM", TENNHOM_SANPHAM));
        Params.Add(new SqlParameter("@THUTU", THUTU));
        Params.Add(new SqlParameter("@MANHOM_CHA", MANHOM_CHA));
        Params.Add(new SqlParameter("@SLIDE_SHOW", SLIDE_SHOW));
        Params.Add(new SqlParameter("@AVATAR", AVATAR));
        DB.Stored_ExecuteNonQuery("INSERT_NHOM_SANPHAM", Params);
    }
    public void update_NhomSP(String TENNHOM_SANPHAM, String THUTU, String MANHOM_CHA, String SLIDE_SHOW, String AVATAR,String MA_TRANGTHAI,String MANHOM_SANPHAM)
    {
        List<SqlParameter> Params = new List<SqlParameter>();
        Params.Add(new SqlParameter("@TENNHOM_SANPHAM", TENNHOM_SANPHAM));
        Params.Add(new SqlParameter("@THUTU", THUTU));
        Params.Add(new SqlParameter("@MANHOM_CHA", MANHOM_CHA));
        Params.Add(new SqlParameter("@SLIDE_SHOW", SLIDE_SHOW));
        Params.Add(new SqlParameter("@AVATAR", AVATAR));
        Params.Add(new SqlParameter("@MA_TRANGTHAI", MA_TRANGTHAI));
        Params.Add(new SqlParameter("@MANHOM_SANPHAM", MANHOM_SANPHAM));
        DB.Stored_ExecuteNonQuery("UPDATE_NHOM_SANPHAM", Params);
    }
    public DataTable select_nhomsp_from_sanpham(String MANHOM_SANPHAM)
    {
        List<SqlParameter> Params = new List<SqlParameter>();
        Params.Add(new SqlParameter("@MANHOM_SANPHAM", MANHOM_SANPHAM));
       return DB.Stored_ExecuteQuery_Datatable("SELECT_NHOMSP_FROM_SANPHAM", Params);
    }
}