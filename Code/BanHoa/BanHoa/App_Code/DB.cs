using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace BanHoa.App_Code
{
    public class DB
    {
        String SQLConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ToString();
        SqlConnection Conn = new SqlConnection();
        public DB()
        {
            Conn.ConnectionString = SQLConnection;
        }
        public void Open()
        {
            if (Conn.State != ConnectionState.Open)
            {
                Conn.Open();
            }
        }
        public void Close()
        {
            if (Conn.State != ConnectionState.Closed)
            {
                Conn.Close();
            }
        }
        //Lấy DataTable từ câu lệnh SQL
        public DataTable getDataTableFromSQL(String SQL)
        {
            DataTable DT = new DataTable();
            Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(DT);
            Close();
            return DT;
        }
        //Lấy DataSet từ câu lệnh SQL
        public DataSet getDataSetFromSQL(String SQL)
        {
            DataSet DS = new DataSet();
            Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(DS);
            Close();
            return DS;
        }
        // lấy DataTable từ Store
        public DataTable getDataTableFromStored(String StoreName, SqlParameter[] Params)
        {
            DataTable DT = new DataTable();
            SqlCommand cmd = new SqlCommand();
            Open();
            cmd.Connection = Conn;
            foreach(SqlParameter Param in Params)
            {
                cmd.Parameters.Add(Param);
            }
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = StoreName;
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(DT);
            Close();
            return DT;
        }
        //Lấy DataSet từ Store
        public DataSet getDataSetFromStored(String StoreName, SqlParameter[] Params)
        {
            DataSet DS = new DataSet();
            SqlCommand cmd = new SqlCommand();
            Open();
            cmd.Connection = Conn;
            foreach (SqlParameter Param in Params)
            {
                cmd.Parameters.Add(Param);
            }
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = StoreName;
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DA.Fill(DS);
            Close();
            return DS;
        }
        //Thực thi câu lệnh SQL
        public int ExecuteSQL(String SQL)
        {
            int Result;
            Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = Conn;
                cmd.CommandText = SQL;
                cmd.CommandType = CommandType.Text;
                Result=cmd.ExecuteNonQuery();
            Close();
            return Result;
        }

        //Thực thi Store
        public int ExecuteSQL(String StoreName,SqlParameter[] Params)
        {
            int Result;
            Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = Conn;
            cmd.CommandText = StoreName;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach( SqlParameter Param in Params)
            {
                cmd.Parameters.Add(Param);
            }
            Result = cmd.ExecuteNonQuery();
            Close();
            return Result;
        }
    }
}