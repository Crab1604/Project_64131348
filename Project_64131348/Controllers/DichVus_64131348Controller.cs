using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Project_64131348.Models;
using Project_64131348.Common;

namespace Project_64131348.Controllers
{
    public class DichVus_64131348Controller : Base_64131348Controller
    {
        private Project_64131348Entities db = new Project_64131348Entities();

        string LayMaDV()
        {
            var maMax = db.DichVus.ToList().Select(n => n.maDV).Max();
            int maDV = int.Parse(maMax.Substring(2)) + 1;
            string DV = String.Concat("000", maDV.ToString());
            return "DV" + DV.Substring(maDV.ToString().Length - 1);
        }
        // GET: DichVus_64131348
        public ActionResult Index()
        {
            return View(db.DichVus.ToList());
        }

        // GET: DichVus_64131348/Details/5
        //public ActionResult Details(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    DichVu dichVu = db.DichVus.Find(id);
        //    if (dichVu == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(dichVu);
        //}

        // GET: DichVus_64131348/Create
        [HasCredentia(IDQuyen = "QUANLYDICHVU")]
        public ActionResult Create()
        {
            ViewBag.maDV = LayMaDV();
            return View();
        }

        // POST: DichVus_64131348/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYDICHVU")]
        public ActionResult Create([Bind(Include = "maDV,tenDV,gia")] DichVu dichVu)
        {
            if (ModelState.IsValid)
            {
                dichVu.maDV = LayMaDV(); 
                db.DichVus.Add(dichVu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.maDV = LayMaDV();
            return View(dichVu);
        }

        // GET: DichVus_64131348/Edit/5
        [HasCredentia(IDQuyen = "QUANLYDICHVU")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DichVu dichVu = db.DichVus.Find(id);
            if (dichVu == null)
            {
                return HttpNotFound();
            }
            return View(dichVu);
        }

        // POST: DichVus_64131348/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYDICHVU")]
        public ActionResult Edit([Bind(Include = "maDV,tenDV,gia")] DichVu dichVu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dichVu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.maDV = LayMaDV();   
            return View(dichVu);
        }

        // GET: DichVus_64131348/Delete/5
        [HasCredentia(IDQuyen = "QUANLYDICHVU")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DichVu dichVu = db.DichVus.Find(id);
            if (dichVu == null)
            {
                return HttpNotFound();
            }
            return View(dichVu);
        }

        // POST: DichVus_64131348/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYDICHVU")]
        public ActionResult DeleteConfirmed(string id)
        {
            DichVu dichVu = db.DichVus.Find(id);
            db.DichVus.Remove(dichVu);
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
