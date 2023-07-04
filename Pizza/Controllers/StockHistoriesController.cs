using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Pizza;

namespace Pizza.Controllers
{
    public class StockHistoriesController : Controller
    {
        private Pizza_DBEntities db = new Pizza_DBEntities();

        // GET: StockHistories
        public ActionResult Index()
        {
            var stockHistories = db.StockHistories.Include(s => s.Stock);
            return View(stockHistories.ToList());
        }

        // GET: StockHistories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockHistory stockHistory = db.StockHistories.Find(id);
            if (stockHistory == null)
            {
                return HttpNotFound();
            }
            return View(stockHistory);
        }

        // GET: StockHistories/Create
        public ActionResult Create()
        {
            ViewBag.stockID = new SelectList(db.Stocks, "StockID", "QuantityRemainig");
            return View();
        }

        // POST: StockHistories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "stockHistoryID,stockID,quantityConsumed,comments,createdOn")] StockHistory stockHistory)
        {
            if (ModelState.IsValid)
            {
                db.StockHistories.Add(stockHistory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.stockID = new SelectList(db.Stocks, "StockID", "QuantityRemainig", stockHistory.stockID);
            return View(stockHistory);
        }

        // GET: StockHistories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockHistory stockHistory = db.StockHistories.Find(id);
            if (stockHistory == null)
            {
                return HttpNotFound();
            }
            ViewBag.stockID = new SelectList(db.Stocks, "StockID", "QuantityRemainig", stockHistory.stockID);
            return View(stockHistory);
        }

        // POST: StockHistories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "stockHistoryID,stockID,quantityConsumed,comments,createdOn")] StockHistory stockHistory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(stockHistory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.stockID = new SelectList(db.Stocks, "StockID", "QuantityRemainig", stockHistory.stockID);
            return View(stockHistory);
        }

        // GET: StockHistories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockHistory stockHistory = db.StockHistories.Find(id);
            if (stockHistory == null)
            {
                return HttpNotFound();
            }
            return View(stockHistory);
        }

        // POST: StockHistories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            StockHistory stockHistory = db.StockHistories.Find(id);
            db.StockHistories.Remove(stockHistory);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
