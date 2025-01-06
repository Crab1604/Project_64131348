using System;
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
    public class PhanHois_64131348Controller : Base_64131348Controller
    {
        private readonly Project_64131348Entities db = new Project_64131348Entities();

        // GET: PhanHois
        public ActionResult Index()
        {
            return View(db.PhanHois.ToList());
        }

        // GET: PhanHois/Details/5

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanHoi phanHoi = db.PhanHois.Find(id);
            if (phanHoi == null)
            {
                return HttpNotFound();
            }
            return View(phanHoi);
        }

        [HasCredentia(IDQuyen = "QUANLYPHANHOI")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanHoi phanHoi = db.PhanHois.Find(int.Parse(id));
            if (phanHoi == null)
            {
                return HttpNotFound();
            }
            return View(phanHoi);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHANHOI")]
        public ActionResult Edit([Bind(Include = "id,hoTen,sdt,email,noiDung,ngayGui,tinhTrang")] PhanHoi phanHoi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phanHoi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phanHoi);
        }

        // GET: PhanHois/Delete/5
        [HasCredentia(IDQuyen = "QUANLYPHANHOI")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanHoi phanHoi = db.PhanHois.Find(id);
            if (phanHoi == null)
            {
                return HttpNotFound();
            }
            return View(phanHoi);
        }

        // POST: PhanHois/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHANHOI")]
        public ActionResult DeleteConfirmed(int id)
        {
            PhanHoi phanHoi = db.PhanHois.Find(id);
            db.PhanHois.Remove(phanHoi);
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
