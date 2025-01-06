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
    public class NhomNhanViens_64131348Controller : Controller
    {
        private Project_64131348Entities db = new Project_64131348Entities();

        // GET: NhomNhanViens_64131348
        [HasCredentia(IDQuyen = "QUANLYNHOMNHANVIEN")]
        public ActionResult Index()
        {
            return View(db.NhomNhanViens.ToList());
        }

        // GET: NhomNhanViens/Create
        [HasCredentia(IDQuyen = "QUANLYNHOMNHANVIEN")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: NhomNhanViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYNHOMNHANVIEN")]
        public ActionResult Create([Bind(Include = "IDNhom,TenNhom")] NhomNhanVien nhomNhanVien)
        {
            if (ModelState.IsValid)
            {
                NhomNhanVien oldNhomNhanVien = db.NhomNhanViens.Find(nhomNhanVien.IDNhom);
                if (oldNhomNhanVien == null)
                {
                    db.NhomNhanViens.Add(nhomNhanVien);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Mã nhóm nhân viên đã tồn tại.");
                }
            }

            return View(nhomNhanVien);
        }

        // GET: NhomNhanViens/Delete/5
        [HasCredentia(IDQuyen = "QUANLYNHOMNHANVIEN")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomNhanVien nhomNhanVien = db.NhomNhanViens.Find(id);
            if (nhomNhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhomNhanVien);
        }

        // POST: NhomNhanViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYNHOMNHANVIEN")]
        public ActionResult DeleteConfirmed(string id)
        {
            NhomNhanVien nhomNhanVien = db.NhomNhanViens.Find(id);
            db.NhomNhanViens.Remove(nhomNhanVien);
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
