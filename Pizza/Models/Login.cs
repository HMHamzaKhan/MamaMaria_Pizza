using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Data.SqlClient;
namespace Pizza.Models
{
    public class Login
    {
        [Required]
        [DisplayName("User Name")]
        public string Username { get; set; }
        [Required]
        [DisplayName("Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }


        public bool login()
        {
            Connection.dbconnect();
            SqlCommand cmd = new SqlCommand("select ID from Branches where BranchUsername = @name and BranchPassword = @pass", Connection.conn);
            cmd.Parameters.AddWithValue("@name", this.Username);
            cmd.Parameters.AddWithValue("@pass", this.Password);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                sdr.Close();
                return true;
            }
            else
            {
                sdr.Close();             
                return false;
            }


            

        }
    }
}