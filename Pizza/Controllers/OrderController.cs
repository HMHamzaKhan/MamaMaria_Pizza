using Pizza.Models;
using Pizza.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pizza.Controllers
{
    public class OrderController : Controller
    {
         Order ordr = new Order();

        // GET: /Order/
        public ActionResult order()
        {
            if (Session["name"] == null)
            {
                return RedirectToAction("Index", "Admin");
            }
            string username = (string)Session["name"];
            return View(new Order().get_allOrders(username));
        }

        // GET: /Order/
        public ActionResult ConfirmOrders()
        {
            if (Session["name"] == null)
            {
                return RedirectToAction("Index", "Admin");
            }
            string username = (string)Session["name"];
            return View(new Order().GetConfirmOrders(username));
        }

        public ActionResult get_order_by_id(string ordercode)
        {
            if (Session["name"] == null)
            {
                return RedirectToAction("Index", "Admin");
            }
            return View(new OrderViewModel() { orderlist = ordr.get_order_by_code(ordercode), customerDetails = ordr.GetCustomerByOrderCode(ordercode) });
        }

        public ActionResult today_order()
        {
            if (Session["name"] == null)
            {
                return RedirectToAction("Index", "Admin");
            }
            string username = (string)Session["name"];
            return View(ordr.today_order(username));
        }

        public PartialViewResult orderRange(DateTime from, DateTime to)
        {
            var orderlist = ordr.get_allOrders((string)Session["name"]);
            var rangeorder = orderlist.Where(o => o.Datetime.Date >= from && o.Datetime.Date <= to).ToList();
            return PartialView("orderPartialView", rangeorder);
        }
        
        public PartialViewResult Refresh() =>
            PartialView("orderPartialView", ordr.get_allOrders((string)Session["name"]));
        
        [HttpPost]
        public JsonResult UpdateConfirm(int id) =>
             Json(new { Result = ordr.UpdateOrder(id) ? "order confirmed" : "something went wrong" }, JsonRequestBehavior.AllowGet);
        
        [HttpPost]
        public JsonResult DeleteOrder(string code) =>
             Json(new { Result = ordr.DeleteOrder(code) ? "order is deleted" : "something went wrong"}, JsonRequestBehavior.AllowGet);
        
    }
}