using Pizza.Models.Enitities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizza.ViewModels
{
    public class DealsViewModel
    {

        public List<Deal> allDeals { get; set; }
        public List<Deal> allSpeacialDeals { get; set; }
    }
}