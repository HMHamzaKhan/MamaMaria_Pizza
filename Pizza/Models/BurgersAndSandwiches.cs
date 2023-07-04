using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Pizza.Models
{
    public class BurgersAndSandwiches
    {
        public int ID { get; set; }
        public string BSName { get; set; }
        public string BSImage { get; set; }
        public string BSDesc { get; set; }
        public decimal BSPrice { get; set; }

        public List<BurgersAndSandwiches> getAllBurgerSandwitch()
        {
            Connection.dbconnect();

            SqlCommand sc = new SqlCommand("sp_getAllBurgersAndSandwiches", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;

            List<BurgersAndSandwiches> GaaList = new List<BurgersAndSandwiches>();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                BurgersAndSandwiches Gaa = new BurgersAndSandwiches();
                Gaa.ID = (int)reader[0];
                Gaa.BSName = (string)reader[1];
                Gaa.BSImage = (string)reader[3];
                Gaa.BSDesc = (string)reader[4];
                GaaList.Add(Gaa);
            }
            reader.Close();
            Connection.CloseConn();
            return GaaList;
        }

        public BurgersAndSandwiches get_burgerandsandwiches_by_id(int id)
        {
            Connection.dbconnect();

            SqlCommand sc = new SqlCommand("sp_getBurgersAndSandwichesByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@BSID", id)
;
            BurgersAndSandwiches Gaa = new BurgersAndSandwiches();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                Gaa.ID = (int)reader[0];
                Gaa.BSName = (string)reader[1];
                Gaa.BSPrice = (decimal)reader[2];
                Gaa.BSImage = (string)reader[3];
                Gaa.BSDesc = (string)reader[4];
                
            }
            reader.Close();
            Connection.CloseConn();
            return Gaa;
        }
    }
}