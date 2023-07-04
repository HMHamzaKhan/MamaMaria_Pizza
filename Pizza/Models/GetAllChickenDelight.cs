using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pizza.Models
{
    public class GetAllChickenDelight
    {
        public int ChickenID { get; set; }
       
        public string ChickenName { get; set; }
        
        public string ChickenImage { get; set; }

        public string CheckenDesc { get; set; }

        public string Pieces { get; set; }

        public decimal Price { get; set; }

        public List<GetAllChickenDelight> DisplayAllChickenDelight()
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("sp_getAllChickenDelight", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;

            List<GetAllChickenDelight> GacdList = new List<GetAllChickenDelight>();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                GetAllChickenDelight Gacd = new GetAllChickenDelight();
                Gacd.ChickenID = (int)reader[0];
                Gacd.ChickenName = (string)reader[1];
                Gacd.ChickenImage = (string)reader[2];
                Gacd.CheckenDesc = (string)reader[3];

                GacdList.Add(Gacd);
            }
            reader.Close();
            Connection.CloseConn();
            return GacdList;

        }

        public List<SelectListItem> get_chickendelight_by_id(int id)
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("sp_getChickenDelightByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@ChickenID", id);

            List<SelectListItem> mySkills = new List<SelectListItem>() { 
            
            };

            

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                SelectListItem list = new SelectListItem();
               // GetAllChickenDelight Gacd = new GetAllChickenDelight();
               // Gacd.Pieces = (string)reader[0];
               // Gacd.Price = (decimal)reader[1];

                list.Text = (string)reader[0];
                list.Value = Convert.ToString( (decimal)reader[1] );

                mySkills.Add(list);
            }
            reader.Close();
            Connection.CloseConn();
            return mySkills;

        }

        public GetAllChickenDelight get_chickencat_by_id(int id)
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("sp_getChickenCatByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@ChickenID", id);

            GetAllChickenDelight Gacd = new GetAllChickenDelight();

            SqlDataReader reader = sc.ExecuteReader();

            while (reader.Read())
            {
                Gacd.ChickenID = (int)reader[0];
                Gacd.ChickenName = (string)reader[1];
                Gacd.ChickenImage = (string)reader[2];
                Gacd.CheckenDesc = (string)reader[3];
            }

            reader.Close();
            Connection.CloseConn();
            return Gacd;

        }

    }
}