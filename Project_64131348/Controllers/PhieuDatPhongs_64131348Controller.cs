using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Project_64131348.Common;
using Project_64131348.Models;

namespace Project_64131348.Controllers
{
    public class PhieuDatPhongs_64131348Controller : Base_64131348Controller
    {
        private readonly Project_64131348Entities db = new Project_64131348Entities();

        //string LayMaPDP()
        //{
        //    var maMax = db.PhieuDatPhongs.ToList().Select(n => n.maPDP).Max();
        //    int maPDP = int.Parse(maMax.Substring(3)) + 1;
        //    string PDP = String.Concat("000", maPDP.ToString());
        //    return "PDP" + PDP.Substring(maPDP.ToString().Length - 1);
        //}

        // Phương thức tự động tăng mã phiếu đặt phòng
        private string GenerateNewMaPDP()
        {
            var lastPDP = db.PhieuDatPhongs.OrderByDescending(p => p.maPDP).FirstOrDefault();
            string newMaPDP = "PDP" + (lastPDP != null ? (int.Parse(lastPDP.maPDP.Substring(3)) + 1).ToString("D3") : "001");
            return newMaPDP;
        }

        // GET: PhieuDatPhong
        public ActionResult Index()
        {
            var phieuDatPhongs = db.PhieuDatPhongs.Include(p => p.KhachHang).Include(p => p.NhanVien);
            return View(phieuDatPhongs.ToList());
        }

        // GET: PhieuDatPhong/Create
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult Create()
        {
            var newMaPDP = GenerateNewMaPDP(); // Tạo mã PDP tự động
            ViewBag.maPDP = newMaPDP; // Lưu mã vào ViewBag
            ViewBag.maKH = new SelectList(db.KhachHangs, "maKH", "tenKH");
            var session = (UserLogin)HttpContext.Session[CommonConstants.USER_SESSION];
            var maNV = db.QuanTris.Where(x => x.username == session.UserName).Select(x => x.maNV).SingleOrDefault();
            ViewBag.maNV = new SelectList(db.NhanViens, "maNV", "tenNV", maNV);
            ViewBag.maP = new SelectList(db.Phongs, "maP", "maP");
            return View();
        }

        [HttpPost]
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult SaveOrder(OrderViewModel model)
        {
            string result = "Xảy ra lỗi. Thêm không thành công";

            try
            {
                // Kiểm tra model
                if (model == null)
                {
                    return Json("Không nhận được dữ liệu", JsonRequestBehavior.AllowGet);
                }

                // Parse các giá trị
                DateTime parsedNgayDen = DateTime.Parse(model.ngayDen);
                DateTime parsedNgayDi = DateTime.Parse(model.ngayDi);
                int parsedSoNguoi = int.Parse(model.soNguoi);
                bool parsedTinhTrang = Boolean.Parse(model.tinhTrang);

                // Tạo đối tượng PhieuDatPhong
                PhieuDatPhong phieuDatPhong = new PhieuDatPhong
                {
                    maPDP = model.maPDP,
                    maKH = model.maKH,
                    ngayDen = parsedNgayDen,
                    ngayDi = parsedNgayDi,
                    soNguoi = parsedSoNguoi,
                    tinhTrang = parsedTinhTrang,
                    maNV = model.maNV
                };

                decimal tongTien = 0;

                // Xử lý chi tiết đặt phòng
                if (model.order != null && model.order.Any())
                {
                    foreach (var item in model.order)
                    {
                        CTPhieuDatPhong ctPhieu = new CTPhieuDatPhong
                        {
                            maPDP = model.maPDP,
                            maP = item.maP,
                            tienCoc = item.tienCoc
                        };
                        tongTien += item.tienCoc;
                        db.CTPhieuDatPhongs.Add(ctPhieu);
                    }
                }

                phieuDatPhong.tongTienCoc = tongTien;
                db.PhieuDatPhongs.Add(phieuDatPhong);
                db.SaveChanges();

                result = "Thêm thành công";
            }
            catch (Exception ex)
            {
                result = $"Có lỗi xảy ra: {ex.Message}";
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }


        // GET: PhieuDatPhong
        //public ActionResult Index()
        //{
        //    var phieuDatPhongs = db.PhieuDatPhongs.Include(p => p.KhachHang).Include(p => p.NhanVien);
        //    return View(phieuDatPhongs.ToList());
        //}

        // GET: PhieuDatPhong/Details/5
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuDatPhong phieuDatPhong = db.PhieuDatPhongs.Find(id);
            if (phieuDatPhong == null)
            {
                return HttpNotFound();
            }
            return View(phieuDatPhong);
        }

        // GET: PhieuDatPhong/Create
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        //public ActionResult Create()
        //{
        //    // Lấy giá trị mã phiếu đặt phòng tự động tăng
        //    var newMaPDP = GenerateNewMaPDP(); // Tạo phương thức tự động tăng mã PDP

        //    // Lưu mã mới vào ViewBag để hiển thị trong View
        //    ViewBag.maPDP = newMaPDP;
        //    //ViewBag.maPDP = LayMaPDP();
        //    ViewBag.maKH = new SelectList(db.KhachHangs, "maKH", "tenKH");
        //    var session = (UserLogin)HttpContext.Session[CommonConstants.USER_SESSION];
        //    var maNV = db.QuanTris.Where(x => x.username == session.UserName).Select(x => x.maNV).SingleOrDefault();
        //    ViewBag.maNV = new SelectList(db.NhanViens, "maNV", "tenNV", maNV);
        //    ViewBag.maP = new SelectList(db.Phongs, "maP", "maP");
        //    return View();
        //}

        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        //public ActionResult SaveOrder(string maPDP, string maKH, string ngayDen, string ngayDi, string soNguoi, string tinhTrang, string maNV, CTPhieuDatPhong[] order)
        //{
        //    string result = "Xảy ra lỗi. Thêm không thành công";
        //    if (maPDP != null && maKH != null && ngayDen != null && ngayDi != null && soNguoi != null && tinhTrang != null && maNV != null && order != null)
        //    {
        //        decimal tongTien = 0;
        //        PhieuDatPhong model = new PhieuDatPhong
        //        {
        //            maPDP = maPDP,
        //            maKH = maKH,
        //            ngayDen = DateTime.Parse(ngayDen),
        //            ngayDi = DateTime.Parse(ngayDi),
        //            soNguoi = int.Parse(soNguoi),
        //            tinhTrang = Boolean.Parse(tinhTrang),
        //            maNV = maNV
        //        };


        //        foreach (var item in order)
        //        {
        //            CTPhieuDatPhong cTPhieuDat = new CTPhieuDatPhong
        //            {
        //                maPDP = maPDP,
        //                maP = item.maP,
        //                tienCoc = item.tienCoc
        //            };
        //            tongTien += item.tienCoc;
        //            db.CTPhieuDatPhongs.Add(cTPhieuDat);
        //        }
        //        model.tongTienCoc = tongTien;
        //        db.PhieuDatPhongs.Add(model);
        //        db.SaveChanges();
        //        result = "Thêm thành công";
        //    }
        //    return Json(result, JsonRequestBehavior.AllowGet);
        //}

        // Phương thức tự động tăng mã phiếu đặt phòng

        // GET: PhieuDatPhong/Edit/5
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuDatPhong phieuDatPhong = db.PhieuDatPhongs.Find(id);
            if (phieuDatPhong == null)
            {
                return HttpNotFound();
            }
            ViewBag.maNV = new SelectList(db.NhanViens, "maNV", "tenNV", phieuDatPhong.maNV);
            ViewBag.maKH = new SelectList(db.KhachHangs, "maKH", "tenKH", phieuDatPhong.maKH);
            return View(phieuDatPhong);
        }

        // POST: PhieuDatPhong/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult Edit([Bind(Include = "maPDP,maKH,ngayDen,ngayDi,tongTienCoc,soNguoi,tinhTrang,maNV")] PhieuDatPhong phieuDatPhong)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phieuDatPhong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.maKH = new SelectList(db.KhachHangs, "maKH", "tenKH", phieuDatPhong.maKH);
            return View(phieuDatPhong);
        }

        // GET: PhieuDatPhong/Delete/5
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuDatPhong phieuDatPhong = db.PhieuDatPhongs.Find(id);
            if (phieuDatPhong == null)
            {
                return HttpNotFound();
            }
            return View(phieuDatPhong);
        }

        // POST: PhieuDatPhong/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult DeleteConfirmed(string id)
        {
            PhieuDatPhong phieuDatPhong = db.PhieuDatPhongs.Find(id);
            List<CTPhieuDatPhong> cTPhieuDatPhongs = db.CTPhieuDatPhongs.Where(x => x.maPDP == id).ToList();
            foreach (var item in cTPhieuDatPhongs)
            {
                db.CTPhieuDatPhongs.Remove(item);
            }
            List<PhieuThuePhong> phieuThuePhongs = db.PhieuThuePhongs.Where(x => x.maPDP == id).ToList();
            if (phieuThuePhongs != null)
            {
                foreach (var item in phieuThuePhongs)
                {
                    List<CTPhieuThuePhong> cTPhieuThuePhongs = db.CTPhieuThuePhongs.Where(x => x.maPTP == item.maPTP).ToList();
                    db.PhieuThuePhongs.Remove(item);
                    foreach (var detailItem in cTPhieuThuePhongs)
                    {
                        db.CTPhieuThuePhongs.Remove(detailItem);
                    }
                }
            }
            db.PhieuDatPhongs.Remove(phieuDatPhong);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult CreateCTPhieuDat(string maPDP)
        {
            var phongDaChon = db.CTPhieuDatPhongs.Where(x => x.maPDP == maPDP).Select(x => x.maP).ToList();
            var phongs = db.Phongs.Select(x => x.maP).ToList();
            foreach (var item in phongDaChon)
            {
                if (phongs.Contains(item))
                {
                    phongs.Remove(item);
                }
            }
            ViewBag.maP = new SelectList(phongs, "maP");
            ViewBag.maPDP = maPDP;
            return View();
        }

        // POST: CTPhieuDatPhongs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult CreateCTPhieuDat([Bind(Include = "maPDP,maP,tienCoc")] CTPhieuDatPhong cTPhieuDatPhong)
        {
            if (ModelState.IsValid)
            {
                db.CTPhieuDatPhongs.Add(cTPhieuDatPhong);
                var phieuDatPhong = db.PhieuDatPhongs.Find(cTPhieuDatPhong.maPDP);
                phieuDatPhong.tongTienCoc += cTPhieuDatPhong.tienCoc;
                db.Entry(phieuDatPhong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Details", "PhieuDatPhongs", new { id = cTPhieuDatPhong.maPDP });
            }

            var phongDaChon = db.CTPhieuDatPhongs.Where(x => x.maPDP == cTPhieuDatPhong.maPDP).Select(x => x.maP).ToList();
            var phongs = db.Phongs.Select(x => x.maP).ToList();
            foreach (var item in phongDaChon)
            {
                if (phongs.Contains(item))
                {
                    phongs.Remove(item);
                }
            }
            ViewBag.maP = new SelectList(phongs, "maP");
            ViewBag.maPDP = cTPhieuDatPhong.maPDP;
            return View(cTPhieuDatPhong);
        }

        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult DeleteCTPhieuDat(string maPDP, string maP)
        {
            if (maPDP == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CTPhieuDatPhong cTPhieuDatPhong = db.CTPhieuDatPhongs.Find(maPDP, maP);
            if (cTPhieuDatPhong == null)
            {
                return HttpNotFound();
            }
            ViewBag.maPDP = maPDP;
            return View(cTPhieuDatPhong);
        }

        // POST: PhieuDatPhong/Delete/5
        [HttpPost, ActionName("DeleteCTPhieuDat")]
        [ValidateAntiForgeryToken]
        [HasCredentia(IDQuyen = "QUANLYPHIEUDATPHONG")]
        public ActionResult DeleteCTPhieuDatConfirmed(string maPDP, string maP)
        {
            CTPhieuDatPhong cTPhieuDatPhong = db.CTPhieuDatPhongs.Find(maPDP, maP);
            PhieuDatPhong phieuDatPhong = db.PhieuDatPhongs.Find(maPDP);
            db.CTPhieuDatPhongs.Remove(cTPhieuDatPhong);
            phieuDatPhong.tongTienCoc -= cTPhieuDatPhong.tienCoc;
            db.Entry(phieuDatPhong).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Details", "PhieuDatPhongs", new { id = maPDP });
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
