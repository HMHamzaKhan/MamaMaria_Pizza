using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pizza.Models;

namespace Pizza.ViewModels
{
    public class addtocartViewModel
    {
        public GetAllAppetizers appitizer { get; set; }
        public List<AppitizerSize> appitizersizes { get; set; }
    }
}