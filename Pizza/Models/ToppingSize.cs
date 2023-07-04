using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Pizza.Models
{
    public class ToppingSize
    {
        public string Size { get; set; }
        public decimal Price { get; set; }



        public List<ToppingSize> getSizeByName(string name)
        {

            Connection.dbconnect();

            SqlCommand sc = new SqlCommand("sp_getToppingByID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@ToppingName", name);

            List<ToppingSize> toppingSizes = new List<ToppingSize>();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                ToppingSize toppingSize = new ToppingSize();
                toppingSize.Size = (string)reader[0];
                toppingSize.Price   = (decimal)reader[1];
                toppingSizes.Add(toppingSize);
            }
            reader.Close();
            Connection.CloseConn();
            return toppingSizes;

        }


        public List<ToppingSize> get_pizzasize_by_id(int id)
        {

            Connection.dbconnect();

            SqlCommand sc = new SqlCommand("sp_getPizzaSizeByPizzaID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@PizzaID", id);

            List<ToppingSize> toppingSizes = new List<ToppingSize>();

            SqlDataReader reader = sc.ExecuteReader();
            while (reader.Read())
            {
                ToppingSize toppingSize = new ToppingSize();
                toppingSize.Size = (string)reader[0];
                toppingSize.Price = (decimal)reader[1];
                toppingSizes.Add(toppingSize);
            }
            reader.Close();
            Connection.CloseConn();
            return toppingSizes;
        }
    }
}