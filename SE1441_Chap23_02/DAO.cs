﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AuctionWindow.DAL
{
    class DAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["AuctionConnectionString"].ConnectionString;
        static public DataTable GetDataTable(string sqlSelect)
        {
            try
              {
                    SqlConnection conn = new SqlConnection(strConn);
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
              }
            catch (Exception ex)
              {
                throw new Exception(ex.Message);
               
              }
            
        }

        static public DataTable GetDataTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        static public bool UpdateTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

    }
}
