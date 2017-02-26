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
    public DataTable select_thongtintaikhoan(int ma_taikhoan)
    {
        DataTable dts = new DataTable();
        List<SqlParameter> parameters = new List<SqlParameter>();
        parameters.Add(new SqlParameter("@ma_taikhoan", ma_taikhoan));
        dts = myConn.Stored_ExecuteQuery_Datatable("select_thongtintaikhoan", parameters);
        return dts;
    }
    public int update_matkhau(String taikhoan, String matkhau_moi)
    {
        int rowEffect;
        List<SqlParameter> parameters = new List<SqlParameter>();
        parameters.Add(new SqlParameter("@taikhoan", taikhoan));
        parameters.Add(new SqlParameter("@matkhau_moi", matkhau_moi));
        rowEffect = myConn.Stored_ExecuteNonQuery("update_matkhau", parameters);
        return rowEffect;
    }
    public byte[] encryptData(string data)
    {
        System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
        byte[] hashedBytes;
        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
        hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
        return hashedBytes;
    }
    public string MD5(string data)
    {
        return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
    }
}