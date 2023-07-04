using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Pizza.Models
{
    public class Size
    {
        public string  ToppingName  { get; set; }
        public string  ToppingSize  { get; set; }
        public decimal ToppingPrice { get; set; }



        public List<Size> getSizesByToppingName(string toppingName)
        {
            Connection.dbconnect();
            List<Size> sizes = new List<Size>();
            SqlCommand cmd = new SqlCommand("getSizesByName", Connection.conn);
            cmd.Parameters.AddWithValue("@toppingName", toppingName);
            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                Size size = new Size();
                size.ToppingName  = (string)  sdr["ToppingName"];
                size.ToppingSize  = (string)  sdr["ToppingSize"];
                size.ToppingPrice = (decimal) sdr["TwrtPrice"];
                sizes.Add(size);
            } sdr.Close();
            Connection.CloseConn();

            return sizes;
        }


    }
}