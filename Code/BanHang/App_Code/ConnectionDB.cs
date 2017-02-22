﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Microsoft.ApplicationBlocks.Data;

public class ConnectionDB
{

    String SQLConnection = ConfigurationManager.ConnectionStrings["SQLConnections"].ToString();
    SqlConnection Conn;
    public ConnectionDB()
    {
        Conn = new SqlConnection(SQLConnection);
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
    #region stored
    public DataSet Stored_ExecuteQuery_Dataset(String storename, List<SqlParameter> parameters)
    {
        DataSet dts = SqlHelper.ExecuteDataset(SQLConnection, CommandType.StoredProcedure, storename, parameters.ToArray());
        return dts;

    }
    public DataTable Stored_ExecuteQuery_Datatable(String storename, List<SqlParameter> parameters)
    {
        DataTable dts = new DataTable();
        SqlDataReader sdr = SqlHelper.ExecuteReader(SQLConnection, CommandType.StoredProcedure, storename, parameters.ToArray());
        dts.Load(sdr);
        return dts;
    }
    protected int Stored_ExecuteNonQuery(String storename, List<SqlParameter> parameters)
    {
        int rowsAffected = SqlHelper.ExecuteNonQuery(SQLConnection, CommandType.StoredProcedure, storename, parameters.ToArray());
        return rowsAffected;
    }
    #endregion 

    #region query
    public DataSet Query_ExecuteQuery_Dataset(String query)
    {
        DataSet dts = SqlHelper.ExecuteDataset(SQLConnection, CommandType.Text, query);
        return dts;

    }
    public DataTable Query_ExecuteQuery_Datatable(String query)
    {
        DataTable dts = new DataTable();
        SqlDataReader sdr = SqlHelper.ExecuteReader(SQLConnection, CommandType.Text, query);
        dts.Load(sdr);
        return dts;
    }
    protected int Query_ExecuteNonQuery(String query)
    {
        int rowsAffected = SqlHelper.ExecuteNonQuery(SQLConnection, CommandType.Text, query);
        return rowsAffected;
    }
    #endregion
}