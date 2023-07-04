using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Pizza.Models
{
    public class CustomerDetails
    {
        public int ID { get; set; }
        
        public string FristName { get; set; }

        public string Address { get; set; }

        public string Email { get; set; }

        public string Contact { get; set; }

        public decimal toalprice { get; set; }

        public DateTime Datetime { get; set; }

        public string ordecode { get; set; }

        public string remarks { get; set; }
        public bool IsConfirmed { get; set; }        
        public bool IsDeleted { get; set; }        
    }
}