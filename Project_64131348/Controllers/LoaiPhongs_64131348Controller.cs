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
    public class LoaiPhongs_64131348Controller : Base_64131348Controller
    {
        private Project_64131348Entities db = new Project_64131348Entities();

        // GET: LoaiPhongs_64131348
        public ActionResult Index()
        {
            return View(db.LoaiPhongs.ToList());
        }

        // GET: LoaiPhongs_64131348/Details/5
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiPhong loaiPhong = db.LoaiPhongs.Find(id);
            if (loaiPhong == null)
            {
                return HttpNotFound();
            }
            return View(loaiPhong);
        }

        // GET: LoaiPhongs_64131348/Create
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoaiPhongs_64131348/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult Create([Bind(Include = "maLP,tenLP,hinhAnh,sucChua,donGia,moTa")] LoaiPhong loaiPhong)
        {
            if (ModelState.IsValid)
            {
                LoaiPhong oldLoaiPhong = db.LoaiPhongs.Find(loaiPhong.maLP);
                if (oldLoaiPhong == null)
                {
                    //System.Web.HttpPostedFileBase Avatar;
                    var imgLP = Request.Files["Avatar"];
                    //Lấy thông tin từ input type=file có tên Avatar
                    string postedFileName = System.IO.Path.GetFileName(imgLP.FileName);
                    //Lưu hình đại diện về Server
                    var path = Server.MapPath("/Images/" + postedFileName);
                    imgLP.SaveAs(path);
                    loaiPhong.hinhAnh = postedFileName;
                    db.LoaiPhongs.Add(loaiPhong);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Mã loại phòng đã tồn tại.");
                }
            }

            return View(loaiPhong);
        }

        // GET: LoaiPhongs_64131348/Edit/5
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiPhong loaiPhong = db.LoaiPhongs.Find(id);
            if (loaiPhong == null)
            {
                return HttpNotFound();
            }
            return View(loaiPhong);
        }

        // POST: LoaiPhongs_64131348/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult Edit([Bind(Include = "maLP,tenLP,hinhAnh,sucChua,donGia,moTa")] LoaiPhong loaiPhong)
        {
            var imgLP = Request.Files["Avatar"];
            try
            {
                //Lấy thông tin từ input type=file có tên Avatar
                string postedFileName = System.IO.Path.GetFileName(imgLP.FileName);
                //Lưu hình đại diện về Server
                var path = Server.MapPath("/Images/" + postedFileName);
                imgLP.SaveAs(path);
            }
            catch { }
            if (ModelState.IsValid)
            {

                db.Entry(loaiPhong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiPhong);
        }

        // GET: LoaiPhongs_64131348/Delete/5
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiPhong loaiPhong = db.LoaiPhongs.Find(id);
            if (loaiPhong == null)
            {
                return HttpNotFound();
            }
            return View(loaiPhong);
        }

        // POST: LoaiPhongs_64131348/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYLOAIPHONG")]
        public ActionResult DeleteConfirmed(string id)
        {
            LoaiPhong loaiPhong = db.LoaiPhongs.Find(id);
            db.LoaiPhongs.Remove(loaiPhong);
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
