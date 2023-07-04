using Pizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizza.ViewModels
{
    public class SizesViewModel
    {
        public GetAllPizza Pizza { get; set; }

        public List<ToppingSize> PizzaSizes { get; set; }
        public List<ToppingSize> BananaPepperSizes { get; set; } //1
        public List<ToppingSize> BihariKabobSizes { get; set; } //2
        public List<ToppingSize> BlackOliveSizes { get; set; } //3
        public List<ToppingSize> CheeseSizes { get; set; } //4
        public List<ToppingSize> ChickenTikkaSizes { get; set; } //5
        public List<ToppingSize> GreenOliveSizes { get; set; } //6
        public List<ToppingSize> GreenPepperSizes { get; set; } //7
        public List<ToppingSize> GyrosSizes { get; set; } //8
        public List<ToppingSize> JalapenoSizes { get; set; } //9
        public List<ToppingSize> MushroomSizes { get; set; } //10
        public List<ToppingSize> OnionSizes { get; set; } //11
        public List<ToppingSize> PepperoniSizes { get; set; } //12
        public List<ToppingSize> PineappleSizes { get; set; } //13
        public List<ToppingSize> SausageSizes { get; set; } //14
        public List<ToppingSize> SpinachSizes { get; set; } //15
        public List<ToppingSize> TomatoSizes { get; set; } //16
        public List<ToppingSize> TurkeyHamSizes { get; set; } //17
    }
}