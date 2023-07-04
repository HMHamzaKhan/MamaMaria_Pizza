using Pizza.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pizza.Controllers
{
    public class AdminController : Controller
    {
        Connection db = new Connection();
        
        // GET: Auth
        public ActionResult Index()
        {
            return View();
        }


        Pizza_DBEntities entity = new Pizza_DBEntities();
        [HttpPost]
        public ActionResult Index(Login lg)
        {
            //    var userCheck = entity.UserTables.Where(x => x.UserName == lg.Username && x.UserPassword == lg.Password).ToList();
            //    if (userCheck != null)
            //    {
            //        StaticUserLogin.UserID = userCheck[0].UserID;
            //        Session["name"] = lg.Username;
            //        return RedirectToAction("Main");
            //    }
            //    else
            //    {
            //        return View();
            //    }
 
            if (lg.login())
            {
                Connection.dbconnect();
                //Session["name"] = lg.Username;
                Session["name"] = db.getData("select BranchAddress from Branches where BranchUsername = '" + lg.Username + "'").Rows[0][0];
                //this.Session.Timeout = 1;
                return RedirectToAction("today_order", "Order");
            }
            else
            {
                return View();   
            }
            
        }

        public ActionResult Main()
        {
            if (Session["name"] == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session.Remove("name");
            return RedirectToAction("Index");
        }

    }
}