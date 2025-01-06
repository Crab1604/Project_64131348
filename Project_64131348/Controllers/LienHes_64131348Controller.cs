﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Project_64131348.Common;
using Project_64131348.Models;

namespace Project_64131348.Controllers
{
    public class LienHes_64131348Controller : Controller
    {
        private readonly Project_64131348Entities db = new Project_64131348Entities();

        // GET: LienHes
        public ActionResult Index()
        {
            return View(db.LienHes.ToList());
        }

        // GET: LienHes/Details/5
        [HasCredentia(IDQuyen = "QUANLYLIENHE")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LienHe lienHe = db.LienHes.Find(id);
            if (lienHe == null)
            {
                return HttpNotFound();
            }
            return View(lienHe);
        }

        [HasCredentia(IDQuyen = "QUANLYLIENHE")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LienHe lienHe = db.LienHes.Find(int.Parse(id));
            if (lienHe == null)
            {
                return HttpNotFound();
            }
            return View(lienHe);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYLIENHE")]
        public ActionResult Edit([Bind(Include = "id,hoTen,sdt,email,ngayGui,tinhTrang")] LienHe lienHe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lienHe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lienHe);
        }

        // GET: LienHes/Delete/5
        [HasCredentia(IDQuyen = "QUANLYLIENHE")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LienHe lienHe = db.LienHes.Find(id);
            if (lienHe == null)
            {
                return HttpNotFound();
            }
            return View(lienHe);
        }

        // POST: LienHes/Delete/5
        [HasCredentia(IDQuyen = "QUANLYLIENHE")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LienHe lienHe = db.LienHes.Find(id);
            db.LienHes.Remove(lienHe);
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

