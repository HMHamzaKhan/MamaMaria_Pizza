using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Configuration;

namespace Pizza
{
    public class Connection 
    {

        public static SqlConnection conn;
        public static SqlConnection dbconnect()
        {
            conn = new SqlConnection(@WebConfigurationManager.ConnectionStrings["Dbconn"].ToString());
            conn.Open();
            return conn;
        }
        public static void CloseConn()
        {
            conn.Close();
        }

        public bool Insert_tbl(Dictionary<String, Object> param, string query, bool isStoredProcedure = false)
        {
            SqlCommand sc = new SqlCommand(query, conn);
            if (isStoredProcedure)
            {
                sc.CommandType = CommandType.StoredProcedure;
            }

            foreach (var keys in param)
            {
                sc.Parameters.AddWithValue(keys.Key, keys.Value);
            }

            if (sc.ExecuteNonQuery() > 0)
            {
                return true;
            }
            return false;
        }

        public bool checkEntry(Dictionary<String, Object> param, string query, bool isStoredProcedure = false)
        {
            SqlCommand sc = new SqlCommand(query, conn);

            if (isStoredProcedure)
            {
                sc.CommandType = CommandType.StoredProcedure;
            }

            foreach (var keys in param)
            {
                sc.Parameters.AddWithValue(keys.Key, keys.Value);
            }

            SqlDataReader sdr = sc.ExecuteReader();
            if (sdr.Read())
            {
                sdr.Close();
                return true;
            }
            sdr.Close();
            return false;
        }

        public DataTable getData(string query, bool isStoredProcedure = false,Dictionary<String, Object> param = null)
        {
            SqlCommand sc = new SqlCommand(query, conn);

            if (isStoredProcedure)
            {
                sc.CommandType = CommandType.StoredProcedure;
            }

            if (param != null)
            {
                foreach (var keys in param)
                {
                    sc.Parameters.AddWithValue(keys.Key, keys.Value);
                }
            }


            DataTable dt = new DataTable();
           
            using (SqlDataReader sdr = sc.ExecuteReader())
            {
                dt.Load(sdr);
            }

            

            return dt;

        }

       
        
    }
}