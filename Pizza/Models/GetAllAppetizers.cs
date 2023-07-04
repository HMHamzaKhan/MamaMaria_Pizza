using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.WebPages.Html;

namespace Pizza.Models
{
    public class GetAllAppetizers
    {
        public int AppetizersID { get; set; }

        public string AppetizersName { get; set; }

        public string AppetizersImage { get; set; }

        public string Pieces { get; set; }
        public decimal Price { get; set; }
        public string Size { get; set; }
        

        public List<GetAllAppetizers> DisplayAllAppetizers()
        { 
            Connection.dbconnect();

            SqlCommand sc = new SqlCommand("sp_getAllAppetizers", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;

            List<GetAllAppetizers> GaaList = new List<GetAllAppetizers>();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                GetAllAppetizers Gaa = new GetAllAppetizers();
                Gaa.AppetizersID = (int)reader[0];
                Gaa.AppetizersName = (string)reader[1];
                Gaa.AppetizersImage = (string)reader[2];
                GaaList.Add(Gaa);
            }
            reader.Close();
            Connection.CloseConn();
            return GaaList;

        }


        public GetAllAppetizers get_appitizer_by_id(int id)
        {
            Connection.dbconnect();

            SqlCommand sc = new SqlCommand("sp_getAppetizerByID", Connection.conn);
            
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@AppetizerID", id);
            
            GetAllAppetizers Gaa = new GetAllAppetizers();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                Gaa.AppetizersID = (int)reader[0];
                Gaa.AppetizersName = (string)reader[1];
                Gaa.AppetizersImage = (string)reader[2];
                Gaa.Price = (decimal)reader[3];
                Gaa.Size = (string)reader[4];
                Gaa.Pieces = (string)reader[5];
                
            }
            reader.Close();
            Connection.CloseConn();
            return Gaa;

        }


        public List<SelectListItem> get_sizes_by_id(int id)
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("getAppitizerSizesByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@id", id);

            List<SelectListItem> mySkills = new List<SelectListItem>();

            SqlDataReader reader = sc.ExecuteReader();

            while (reader.Read())
            {
                SelectListItem list = new SelectListItem();

                list.Text = (string)reader[0];
                list.Value = Convert.ToString((decimal)reader[1]);

                mySkills.Add(list);
            }

            reader.Close();
            Connection.CloseConn();
            return mySkills;

        }


        public List<AppitizerSize> getAppitizerSizeByID(int id)
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("getAppitizerSizesByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@id", id);

            List<AppitizerSize> mySkills = new List<AppitizerSize>();

            SqlDataReader reader = sc.ExecuteReader();

            while (reader.Read())
            {
                AppitizerSize list = new AppitizerSize();

                list.text = (string)reader[0];
                list.value = (decimal)reader[1];

                mySkills.Add(list);
            }

            reader.Close();
            Connection.CloseConn();
            return mySkills;
        }
    }
}