using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pizza.Models
{
    public class GetAllPizza
    {
        public int PizzaID { get; set; }
        
        public string PizzaName { get; set; }

        public string PizzaIngredients { get; set; }
        public string PizzaImage { get; set; }
       


        public List<GetAllPizza> DisplayAllPizza()
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("sp_getAllPizza", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            List<GetAllPizza> pzlist = new List<GetAllPizza>();
            SqlDataReader reader = sc.ExecuteReader();

            while (reader.Read())
            {
                GetAllPizza Gap = new GetAllPizza();
                Gap.PizzaID = (int)reader[0];
                Gap.PizzaName = (string)reader[1];
                Gap.PizzaIngredients = (string)reader[2];
                Gap.PizzaImage  = (string)reader[3];
                pzlist.Add(Gap);
            }
            reader.Close();
            Connection.CloseConn();
            return pzlist;
        }

        public GetAllPizza get_pizza_by_id(int id)
        {

            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("sp_getPizzaByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@PizzaID", id);
            
            GetAllPizza Gap = new GetAllPizza();
            
            SqlDataReader reader = sc.ExecuteReader();

            while (reader.Read())
            {
                Gap.PizzaID = (int)reader[0];
                Gap.PizzaName = (string)reader[1];
                Gap.PizzaIngredients = (string)reader[2];
                Gap.PizzaImage = (string)reader[3];
            }
            reader.Close();
            Connection.CloseConn();
            return Gap;
        }

        public List<SelectListItem> get_sizes_by_id(int id)
        {
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("sp_getPizzaSizeByPizzaID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@PizzaID", id);

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

    }
}
