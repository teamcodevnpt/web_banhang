using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsSanPham
/// </summary>
public class clsSanPham
{
    public clsSanPham()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    ConnectionDB DB = new ConnectionDB();
    public int insert_sanpham(string manhom_sanpham , string ma_trangthai,string ten_sanpham,string mota, string thutu,string noidung, string slide_show, string gia,string avarta, string uu_tien, string gia_khuyenmai)
    {
        List<SqlParameter> Params = new List<SqlParameter>();
        Params.Add(new SqlParameter("@MANHOM_SANPHAM", manhom_sanpham));
        Params.Add(new SqlParameter("@MA_TRANGTHAI", ma_trangthai));
        Params.Add(new SqlParameter("@TEN_SANPHAM", ten_sanpham));
        Params.Add(new SqlParameter("@MOTA", mota));
        Params.Add(new SqlParameter("@THUTU", thutu));
        Params.Add(new SqlParameter("@NOIDUNG", noidung));
        Params.Add(new SqlParameter("@SLIDE_SHOW", slide_show));
        Params.Add(new SqlParameter("@GIA", gia));
        Params.Add(new SqlParameter("@AVATAR", avarta));
        Params.Add(new SqlParameter("@UU_TIEN", uu_tien));
        if (gia_khuyenmai == "")
        {
            Params.Add(new SqlParameter("@GIA_KHUYENMAI",0));
        }
        else
        {
            Params.Add(new SqlParameter("@GIA_KHUYENMAI", gia_khuyenmai));
        }
        return DB.Stored_ExecuteNonQuery("INSERT_SANPHAM", Params);
    }
    public int update_sanpham(string manhom_sanpham, string ma_trangthai, string ten_sanpham, string mota, string thutu, string noidung, string slide_show, string gia, string avarta, string uu_tien, string gia_khuyenmai,string ma_sanpham)
    {
        List<SqlParameter> Params = new List<SqlParameter>();
        Params.Add(new SqlParameter("@MANHOM_SANPHAM", manhom_sanpham));
        Params.Add(new SqlParameter("@MA_TRANGTHAI", ma_trangthai));
        Params.Add(new SqlParameter("@TEN_SANPHAM", ten_sanpham));
        Params.Add(new SqlParameter("@MOTA", mota));
        Params.Add(new SqlParameter("@THUTU", thutu));
        Params.Add(new SqlParameter("@NOIDUNG", noidung));
        Params.Add(new SqlParameter("@SLIDE_SHOW", slide_show));
        Params.Add(new SqlParameter("@GIA",gia));
        Params.Add(new SqlParameter("@AVATAR", avarta));
        Params.Add(new SqlParameter("@UU_TIEN", uu_tien));
        if (gia_khuyenmai == "") {
            Params.Add(new SqlParameter("@GIA_KHUYENMAI",(Decimal)(0)));
        }
        else
        {
            Params.Add(new SqlParameter("@GIA_KHUYENMAI", gia_khuyenmai));
        }
        Params.Add(new SqlParameter("@MA_SANPHAM", ma_sanpham));
        return DB.Stored_ExecuteNonQuery("UPDATE_SANPHAM", Params);
    }

    public DataTable select_sanpham_from_masp(string ma_sanpham)
    {
        List<SqlParameter> Params = new List<SqlParameter>();
        Params.Add(new SqlParameter("@MA_SANPHAM", ma_sanpham));
        return DB.Stored_ExecuteQuery_Datatable("SELECT_SANPHAM_FROM_MASP", Params);
    }
}