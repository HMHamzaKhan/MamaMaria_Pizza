using Pizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Pizza.ViewModels
{
    public class MenuViewModel
    {
        public List<GetAllPizza> getAllPizza { get; set; }

        public List<GetAllAppetizers> getAllAppetizers { get; set; }
        public List<GetAllChickenDelight> getAllChickenDelight { get; set; }
        public List<BurgersAndSandwiches> getAllBurgerAndSendwithces { get; set; }
    }
}