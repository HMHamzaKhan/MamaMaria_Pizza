using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizza.Models
{
    public static class cartlist
    {
        private static List<cart> list = new List<cart>();
        public static List<cart> carts

        {
            get { return list; }
        }
    }
}