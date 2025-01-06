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
    public class Phongs_64131348Controller : Controller
    {
        private Project_64131348Entities db = new Project_64131348Entities();

        // GET: Phongs_64131348
        public ActionResult Index()
        {
            var phongs = db.Phongs.Include(p => p.LoaiPhong);
            return View(phongs.ToList());
        }

        // GET: Phongs_64131348/Details/5
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phong phong = db.Phongs.Find(id);
            if (phong == null)
            {
                return HttpNotFound();
            }
            return View(phong);
        }

        // GET: Phongs_64131348/Create
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult Create()
        {
            ViewBag.maLP = new SelectList(db.LoaiPhongs, "maLP", "tenLP");
            return View();
        }

        // POST: Phongs_64131348/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult Create([Bind(Include = "maP,maLP,tinhTrang")] Phong phong)
        {
            {
                Phong oldphong = db.Phongs.Find(phong.maP);
                if (oldphong == null)
                {
                    db.Phongs.Add(phong);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Mã phòng đã tồn tại.");
                }
            }

            ViewBag.maLP = new SelectList(db.LoaiPhongs, "maLP", "tenLP", phong.maLP);
            return View(phong);
        }

        // GET: Phongs_64131348/TimKiem
        [HttpGet]
        public ActionResult TimKiem(string tinhTrang = "", string maLP = "")
        {
            ViewBag.tinhTrang = tinhTrang;
            ViewBag.maLP = new SelectList(db.LoaiPhongs, "maLP", "tenLP");
            IQueryable<Phong> phongs;
            if (tinhTrang == "")
            {
                phongs = db.Phongs.Where(abc => abc.tinhTrang.Contains(tinhTrang) && abc.maLP.Contains(maLP));
            }
            else
            {
                phongs = db.Phongs.Where(abc => abc.tinhTrang == tinhTrang && abc.maLP.Contains(maLP));
            }
            if (phongs.Count() == 0)
                ViewBag.TB = "Không có thông tin tìm kiếm.";
            return View(phongs.ToList());
        }

        // GET: Phongs_64131348/Edit/5
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phong phong = db.Phongs.Find(id);
            if (phong == null)
            {
                return HttpNotFound();
            }
            ViewBag.maLP = new SelectList(db.LoaiPhongs, "maLP", "tenLP", phong.maLP);
            return View(phong);
        }

        // POST: Phongs_64131348/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult Edit([Bind(Include = "maP,maLP,tinhTrang")] Phong phong)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.maLP = new SelectList(db.LoaiPhongs, "maLP", "tenLP", phong.maLP);
            return View(phong);
        }

        // GET: Phongs_64131348/Delete/5
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phong phong = db.Phongs.Find(id);
            if (phong == null)
            {
                return HttpNotFound();
            }
            return View(phong);
        }

        // POST: Phongs_64131348/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHONG")]
        public ActionResult DeleteConfirmed(string id)
        {
            Phong phong = db.Phongs.Find(id);
            db.Phongs.Remove(phong);
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
