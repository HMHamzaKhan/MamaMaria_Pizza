using Pizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizza.ViewModels
{
    public class OrderViewModel
    {
        public List<cart> orderlist { get; set; }
        public CustomerDetails customerDetails { get; set; }
    }
}
