using Pizza.Models;
using Pizza.Models.Enitities;
using Pizza.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using Pizza.ViewModels;
using System.Web;
using System.Web.Mvc;

namespace Pizza.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            ServicePointManager.SecurityProtocol 
                = SecurityProtocolType.Tls   |
                  SecurityProtocolType.Tls11 |
                  SecurityProtocolType.Tls12;

            ViewBag.Title = "Home";
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Title = "About Us";


            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Title = "Contact Us";

            return View();
        }

        public ActionResult Location()
        {
            ViewBag.Title = "Location";

            return View();
        }

        public ActionResult Deals()
        {
            ViewBag.Title = "Deals";


            Deal deal = new Deal();
            DealsViewModel vModel = new DealsViewModel();
            
            vModel.allDeals = deal.getAllDeals();
            vModel.allSpeacialDeals = deal.getSpecialDeals();
            return View(vModel);
        }

        public ActionResult Menu()
        {
            ViewBag.Title = "Menu";
            
            MenuViewModel vModel = new MenuViewModel();


            vModel.getAllPizza                = new GetAllPizza().DisplayAllPizza();
            vModel.getAllAppetizers           = new GetAllAppetizers().DisplayAllAppetizers();
            vModel.getAllChickenDelight       = new GetAllChickenDelight().DisplayAllChickenDelight();
            vModel.getAllBurgerAndSendwithces = new BurgersAndSandwiches().getAllBurgerSandwitch();
            
            return View(vModel);
        }

        public ActionResult SendEmail()
        {
            return View();
        } 

        [HttpPost]
        public ActionResult SendEmail(string receiver, string subject, string message, string name)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        var senderEmail = new MailAddress("mamamariasender@gmail.com", "Customer");
                        var receiverEmail = new MailAddress("mamamariareciever@gmail.com", "Owner");
                        //var password = "(Bstindawrld)";
                        var sub = subject + " Email : " + receiver;
                        var body =  " Name : "     + name
                                  + "\n Email : "  + receiver
                                  + "\n Message : "+ message;
                        var smtp = new SmtpClient
                        {
                            Host = "smtp.gmail.com",
                            Port = 587,
                            EnableSsl = true,
                            DeliveryMethod = SmtpDeliveryMethod.Network,
                            UseDefaultCredentials = false,
                            Credentials = new NetworkCredential(senderEmail.Address, "mama@12345")
                        };

                        using (var mess = new MailMessage(senderEmail, receiverEmail)
                        {
                            Subject = subject,
                            Body = body
                        })
                        {
                            smtp.Send(mess);
                        }

                        ViewBag.Success = " Email Sent Successfully ";                        
                    }
                }
                catch (Exception)
                {
                    ViewBag.Error = " Something Went Wrong Send Email again ";
                }
                return View();
            }


        [HttpGet]
        public ActionResult get_appitizer_by_id(int id)
        {
            addtocartViewModel addCart = new addtocartViewModel();
            GetAllAppetizers appitizers = new GetAllAppetizers();
            addCart.appitizer = appitizers.get_appitizer_by_id(id); 
            if (id == 1 || id == 16)
            {
               addCart.appitizersizes =  appitizers.getAppitizerSizeByID(id);

            }
            if (id == 15)
            {
               addCart.appitizersizes =  appitizers.getAppitizerSizeByID(id);
            }

            return View(addCart);
          //  return View(appitizers.get_appitizer_by_id(id));
        }

        [HttpGet]
        public ActionResult get_chickendelight_by_id(int id)
        {
            GetAllChickenDelight chickenDelight = new GetAllChickenDelight().get_chickencat_by_id(id);

            ViewBag.pieces = new GetAllChickenDelight().get_chickendelight_by_id(id);

            return View(chickenDelight);
        }

        [HttpGet]
        public ActionResult get_others_by_id(int id)
        {

            return View(new BurgersAndSandwiches().get_burgerandsandwiches_by_id(id));
        }



        [HttpGet]
        public ActionResult add_to_cart()
        {
            ViewBag.cartList = Session["cart"];

            
            return View();
        }

        [HttpPost]
        public ActionResult add_to_cart(decimal price, int qty, int id, string name, string desc, string image, string topping = "", string crust = "", string pieces = "",string sizes = "",string remarks = "")
        {

            if (Session["cart"] == null)
            {
                Session["cart"] = new List<cart>();
            }

            var items = (List<cart>)Session["cart"];
          
            var obj = items.FirstOrDefault(i => i.ItemName == name && i.Topping == topping && i.Crust == crust && i.pieces == pieces && i.sizes == sizes);

            if (obj != null)
            {
                obj.ItemQuantity += qty;
            }
            else
            {
                cart crt = new cart();
                crt.ItemImage = image;
                crt.ItemPrice = price;
                crt.ItemName = name;
                crt.ItemQuantity = qty;
                crt.Crust = crust;
                crt.ItemDesc = desc + sizes + topping;
                crt.Topping = topping;
                crt.pieces = pieces;
                crt.sizes = sizes;
                crt.ItemRemarks = remarks;
                items.Add(crt);
            }
            ViewBag.cartList = Session["cart"];


            return PartialView("tablePartial");

        }



        [HttpGet]
        public ActionResult get_pizza_by_id(int id)
        {
            GetAllPizza pizzas = new GetAllPizza();
            ViewBag.sizes = pizzas.get_sizes_by_id(id);
            return View(pizzas.get_pizza_by_id(id));
        }


        [HttpPost]
        public ActionResult delete_item_from_cart (string itemname)
        {

           var items = (List<cart>)Session["cart"];

           var obj = items.FirstOrDefault(i => i.ItemName == itemname);

           items.Remove(obj);
           Session["cart"] = items;

           return View();
        }

        [HttpPost]
        public ActionResult add_order(decimal totalprice)
        {
            var items = (List<cart>)Session["cart"];
            //if (new Order().add_order(items,totalprice))
            //{
            //    Session["cart"] = null;
            //}
            return View();
        }


        public ActionResult checkout(decimal totalprice)
        {
            TempData["totalPrice"] = totalprice;
            Session["customer_details"] = "go";
            return RedirectToAction("customer_details");
        }

        [HttpGet]
        public ActionResult customer_details()
        {
            
            if ( ((string)Session["customer_details"]) == "go")
            {
                return View();
            }else{
                return RedirectToAction("Menu");
            }

        }

        [HttpGet]
        public ActionResult get_deals_by_id(int id)
        {
            return View(new Deal().get_deal_by_id(id));
        }



        [HttpPost]
        public ActionResult customer_details(int branchID,string name , string address , string email , string number, string Remarks = "No Remarks" )
        {
                 if (Session["customer"] == null)
                 {
                     Session["customer"] = new CustomerDetails();
                 }

                 var customer = (CustomerDetails)Session["customer"];
                 var items    = (List<cart>)Session["cart"];

                 customer.FristName = name;
                 customer.Address = address;
                 customer.Email = email;
                 customer.Contact = number;
                 customer.toalprice = (decimal)TempData["totalPrice"];
                 customer.remarks = Remarks;
                 
                 if (new Order().add_order(items,customer,branchID))
                 {
                     Session["cart"] = null;
                     Session["customer"] = null;
                     Session["customer_details"] = null;
                 }
                  return View();
        }
        

        [HttpGet]
        public ActionResult change_qty(int qty, string name, string desc)
        {
            var items = (List<cart>)Session["cart"];

            var obj = items.FirstOrDefault(i => i.ItemName == name && i.ItemDesc == desc);

            if (obj != null)
            {
                obj.ItemQuantity = qty;
            }
            return RedirectToAction("add_to_cart");
        }


        [HttpGet]
        public ActionResult test() {

            return View();
        }

        [HttpGet]
        public void cleartcart() => Session["cart"] = null; 
    
    }
}    

//public ActionResult table()
        //{

        //    return PartialView();
        //}
        

    //public static class ControllerExtensions
    //{
    //    public static string RenderView<TModel>(this Controller controller, string viewName, TModel model, bool partial = false)
    //    {
    //        var controllerContext = controller.ControllerContext;
    //        controllerContext.Controller.ViewData.Model = model;

    //        // To be or not to be (partial)
    //        var viewResult = partial ? ViewEngines.Engines.FindPartialView(controllerContext, viewName) : ViewEngines.Engines.FindView(controllerContext, viewName, null);

    //        StringWriter stringWriter;

    //        using (stringWriter = new StringWriter())
    //        {
    //            var viewContext = new ViewContext(
    //                controllerContext,
    //                viewResult.View,
    //                controllerContext.Controller.ViewData,
    //                controllerContext.Controller.TempData,
    //                stringWriter);

    //            viewResult.View.Render(viewContext, stringWriter);
    //            viewResult.ViewEngine.ReleaseView(controllerContext, viewResult.View);
    //        }

    //        return stringWriter.ToString();
    //    }
    //}




