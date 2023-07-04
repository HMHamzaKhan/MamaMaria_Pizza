using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizza.Models
{   
    public class cart
    {
        public int ID { get; set; }
        public string ordercode { get; set; }
        public string ItemName { get; set; }
        public string ItemDesc { get; set; }
        public int ItemQuantity { get; set; }
        public decimal ItemPrice { get; set; }
        public string ItemImage { get; set; }
        public string Topping { get; set; }
        public string Crust { get; set; }
        public string pieces { get; set; }
        public string sizes { get; set; }
        public string ItemRemarks { get; set; }
            

       // private List<cart> Carts { get; set; }
        //public static List<cart> carts = new List<cart>();
        //
        //
        //public void addItem(string itemname , string itemdesc, int qty, decimal itemprice,string itemimage)
        //{
        //    cart crt = new cart();
        //    crt.ItemDesc = itemdesc;
        //    crt.ItemName = itemname;
        //    crt.ItemQuantity = qty;
        //    crt.ItemPrice = itemprice;
        //    crt.ItemImage = ItemImage;
        //
        //    carts.Add(crt);
        //}

    }
}