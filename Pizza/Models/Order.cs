using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace Pizza.Models
{
    public class Order
    {
        public bool add_order(List<cart> cartitems, CustomerDetails customer, int branchID)
        {

            string code = codeGenerator();
            try
            {
                Connection.dbconnect();
                SqlCommand sc = new SqlCommand("add_order_master", Connection.conn);
                sc.CommandType = CommandType.StoredProcedure;
                sc.Parameters.AddWithValue("@orderCode", code);
                sc.Parameters.AddWithValue("@branchID", branchID);
                sc.Parameters.AddWithValue("@firstname", customer.FristName);
                sc.Parameters.AddWithValue("@email", customer.Email);
                sc.Parameters.AddWithValue("@phoneno", customer.Contact);
                sc.Parameters.AddWithValue("@address", customer.Address);
                DateTime currentTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time"));
                sc.Parameters.AddWithValue("@createdon", currentTime.ToString());
                sc.Parameters.AddWithValue("@totalprice", customer.toalprice);
                sc.Parameters.AddWithValue("@remarks", customer.remarks);


                sc.ExecuteNonQuery();


                foreach (var item in cartitems)
                {
                    SqlCommand sc2 = new SqlCommand("add_order", Connection.conn);
                    sc2.CommandType = CommandType.StoredProcedure;
                    sc2.Parameters.AddWithValue("@ordercode", code);
                    sc2.Parameters.AddWithValue("@itemname", item.ItemName);
                    sc2.Parameters.AddWithValue("@itemprice", item.ItemPrice);
                    sc2.Parameters.AddWithValue("@itemdesc", item.ItemDesc);
                    sc2.Parameters.AddWithValue("@itemquantity", item.ItemQuantity);
                    sc2.Parameters.AddWithValue("@itemimage", item.ItemImage);
                    sc2.Parameters.AddWithValue("@ItemRemarks", item.ItemRemarks ?? "No Remarks");
                    sc2.ExecuteNonQuery();
                }

                Connection.CloseConn();
                return true;

            }
            catch(Exception ex)
            {
                return false;
            }

        }

        public List<CustomerDetails> get_allOrders(string username)
        {

            Connection.dbconnect();
            string q = "select * from OrderMaster  where BranchID = (Select ID from Branches where BranchAddress = @username) and IsDeleted = 0 order by ID Desc";
            SqlCommand sc = new SqlCommand(q, Connection.conn);
       
            sc.Parameters.AddWithValue("@username", username);

            SqlDataReader reader = sc.ExecuteReader();
            List<CustomerDetails> customerdetails = new List<CustomerDetails>();

            while (reader.Read())
            {
                CustomerDetails customerdetail = new CustomerDetails();
                customerdetail.ID = (int)reader[0];
                customerdetail.FristName = (string)reader[1];
                customerdetail.Datetime = (DateTime)reader[2];
                customerdetail.Address = (string)reader[3];
                customerdetail.Email = (string)reader[4];
                customerdetail.Contact = (string)reader[5];
                customerdetail.toalprice = (decimal)reader[6];
                customerdetail.ordecode = (string)reader[7];
                customerdetail.remarks = (reader[9] == DBNull.Value || reader[9].ToString() == null) ? "No Remarks" : reader[9].ToString();
                customerdetail.IsConfirmed = (bool) reader[10];
                customerdetail.IsDeleted = (bool) reader[11];
                customerdetails.Add(customerdetail);
            }

            reader.Close();
            Connection.CloseConn();
            return customerdetails;

        }


        public List<CustomerDetails> GetConfirmOrders(string username)
        {
            
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("select * from OrderMaster where BranchID = (Select ID from Branches where BranchAddress = @username) and IsConfirmed = 1 order by ID Desc", Connection.conn);
            sc.Parameters.AddWithValue("@username", username);

            SqlDataReader reader = sc.ExecuteReader();
            List<CustomerDetails> customerdetails = new List<CustomerDetails>();

            while (reader.Read())
            {
                CustomerDetails customerdetail = new CustomerDetails();
                customerdetail.ID = (int)reader[0];
                customerdetail.FristName = (string)reader[1];
                customerdetail.Datetime = (DateTime)reader[2];
                customerdetail.Address = (string)reader[3];
                customerdetail.Email = (string)reader[4];
                customerdetail.Contact = (string)reader[5];
                customerdetail.toalprice = (decimal)reader[6];
                customerdetail.ordecode = (string)reader[7];
                customerdetail.remarks = (reader[9] == DBNull.Value || reader[9].ToString() == null) ? "No Remarks" : reader[9].ToString();
                customerdetail.IsConfirmed = (bool)reader["IsConfirmed"];
                customerdetails.Add(customerdetail);
            }

            reader.Close();
            Connection.CloseConn();
            return customerdetails;

        }


        public bool UpdateOrder(int id)
        {

            try
            {
                Connection.dbconnect();
                SqlCommand sc = new SqlCommand("update OrderMaster set IsConfirmed = 1 where ID = @ID", Connection.conn);
                sc.Parameters.AddWithValue("@ID", id);
                sc.ExecuteNonQuery();

                Connection.CloseConn();
                return true;
            }
            catch
            {
                Connection.CloseConn();
                return false;
            }
        }


        public bool DeleteOrder(string code)
        {

            try
            {
                Connection.dbconnect();
                SqlCommand sc = new SqlCommand("update OrderMaster set IsDeleted = 1 where OrderCode = @code", Connection.conn);
                sc.Parameters.AddWithValue("@code", code);
                sc.ExecuteNonQuery();

                Connection.CloseConn();
                return true;
            }
            catch
            {
                Connection.CloseConn();
                return false;
            }

        }



        public List<CustomerDetails> today_order(string username)
        {

            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("todayorder", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@username", username);

            SqlDataReader reader = sc.ExecuteReader();
            List<CustomerDetails> customerdetails = new List<CustomerDetails>();

            while (reader.Read())
            {
                CustomerDetails customerdetail = new CustomerDetails();
                customerdetail.ID        = (int)reader[0];
                customerdetail.FristName = (string)reader[1];
                customerdetail.Address   = (string)reader[3];
                customerdetail.Email     = (string)reader[4];
                customerdetail.Contact   = (string)reader[5];
                customerdetail.ordecode  = (string)reader[7];
                customerdetail.toalprice = (decimal)reader[6];
                customerdetail.Datetime  = (DateTime)reader[2];
                customerdetail.remarks = (reader[9] == DBNull.Value || reader[9].ToString() == null) ? "No Remarks" : reader[9].ToString();

                customerdetails.Add(customerdetail);
            }

            reader.Close();
            Connection.CloseConn();
            return customerdetails;

        }

        public List<cart> get_order_by_id(int id)
        {

            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("get_order_by_id", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;
            sc.Parameters.AddWithValue("@id",id);

            SqlDataReader reader = sc.ExecuteReader();
            List<cart> cartitems = new List<cart>();

            while (reader.Read())
            {
                cart cartitem = new cart();
                cartitem.ID = (int)reader[0];
                cartitem.ItemName = (string)reader[1];
                cartitem.ItemPrice = (decimal)reader[2];
                cartitem.ItemDesc = (string)reader[3];
                cartitem.ItemQuantity = (int)reader[4];
                cartitem.ItemImage = (string)reader[5];
               
                cartitems.Add(cartitem);
            }

            reader.Close();
            Connection.CloseConn();
            return cartitems;

        }

        public CustomerDetails GetCustomerByOrderCode(string ordercode)
        {

            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("select * from OrderMaster where OrderCode = @ordercode", Connection.conn);
            sc.Parameters.AddWithValue("@ordercode", ordercode);
            SqlDataReader reader = sc.ExecuteReader();

            CustomerDetails customer = new CustomerDetails();
            while (reader.Read())
            {
                customer.ID        = (int)reader[0];
                customer.FristName = (string) reader[1];
                customer.Datetime  = (DateTime)reader[2];
                customer.Address   = (reader[3] == DBNull.Value) ? "-" : (string)reader[3];//(string)reader[3];
                customer.Email     = (string)reader[4];
                customer.Contact   = (string)reader[5];
                customer.toalprice = (decimal)reader[6];
                customer.ordecode  = (string)reader[7];
                customer.remarks   = (reader[9] == DBNull.Value) ? "-" : (string)reader[9];
            }
            return customer;
       
        }

        public string get_name_by(int id)
        {
            string name = "";
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("select OrderCode from OrderMaster where ID =" + id, Connection.conn);
            sc.Parameters.AddWithValue("@id", id);
            SqlDataReader sdr = sc.ExecuteReader();
            if (sdr.Read())
            {
                name = (string)sdr[0];
            }
            sdr.Close();
            Connection.CloseConn();
            return name;
        }

        public string codeGenerator()
        {
            int id = 1;
            string code = RandomString(3);
            Connection.dbconnect();
            SqlCommand sc = new SqlCommand("getMaxID", Connection.conn);
            sc.CommandType = CommandType.StoredProcedure;

            SqlDataReader sdr = sc.ExecuteReader();
            if (sdr.Read())
            {
                id = (int)sdr[0] + 1;

            }
            sdr.Close();
            Connection.CloseConn();
            return id.ToString() + code;
        }
       
        public List<cart> get_order_by_code(string ordercode)
       {

           Connection.dbconnect();
           SqlCommand sc = new SqlCommand("get_order_by_id", Connection.conn);
           sc.CommandType = CommandType.StoredProcedure;
           sc.Parameters.AddWithValue("@ordercode", ordercode);

           SqlDataReader reader = sc.ExecuteReader();
           List<cart> cartitems = new List<cart>();

           while (reader.Read())
           {
               cart cartitem = new cart();
               cartitem.ID           = (int)reader[0];
               cartitem.ItemName     = (string)reader[1];
               cartitem.ItemPrice    = (decimal)reader[2];
               cartitem.ItemDesc     = (string)reader[3];
               cartitem.ItemQuantity = (int)reader[4];
               cartitem.ItemImage    = (string)reader[5];
               cartitem.ordercode    = (string)reader[6];
               cartitem.ItemRemarks = (string)reader[7];

               cartitems.Add(cartitem);
           }

           reader.Close();
           Connection.CloseConn();
           return cartitems;

       }

        public string RandomString(int length, string allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        {
            if (length < 0) throw new ArgumentOutOfRangeException("length", "length cannot be less than zero.");
            if (string.IsNullOrEmpty(allowedChars)) throw new ArgumentException("allowedChars may not be empty.");

            const int byteSize = 0x100;
            var allowedCharSet = new HashSet<char>(allowedChars).ToArray();
            if (byteSize < allowedCharSet.Length) throw new ArgumentException(String.Format("allowedChars may contain no more than {0} characters.", byteSize));

            // Guid.NewGuid and System.Random are not particularly random. By using a
            // cryptographically-secure random number generator, the caller is always
            // protected, regardless of use.
            using (var rng = System.Security.Cryptography.RandomNumberGenerator.Create())
            {
                var result = new StringBuilder();
                var buf = new byte[128];
                while (result.Length < length)
                {
                    rng.GetBytes(buf);
                    for (var i = 0; i < buf.Length && result.Length < length; ++i)
                    {
                        // Divide the byte into allowedCharSet-sized groups. If the
                        // random value falls into the last group and the last group is
                        // too small to choose from the entire allowedCharSet, ignore
                        // the value in order to avoid biasing the result.
                        var outOfRangeStart = byteSize - (byteSize % allowedCharSet.Length);
                        if (outOfRangeStart <= buf[i]) continue;
                        result.Append(allowedCharSet[buf[i] % allowedCharSet.Length]);
                    }
                }
                return result.ToString();
            }
        }

    }
}
//add_order_master
//@firstname nvarchar(50),
//@lasttname nvarchar(50),
//@email nvarchar(50),
//@phoneno nvarchar(50),
//@address nvarchar(50),
//@createdon datetime,
//@totalprice decimal(18,2)


//add_order
//@itemname	 		nvarchar(50),
//@itemprice	 		decimal(18,2),
//@itemdesc	 	nvarchar(255),
//@itemquantity	int,
//@itemimage		nvarchar(50)