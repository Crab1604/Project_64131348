using Project_64131348.Models;
using System;
using System.Linq;
using System.Web.Mvc;
using System.Globalization;

namespace Project_64131348.Controllers
{
    public class KiemTraPhongTrong_64131348Controller : Controller
    {
        Project_64131348Entities db = new Project_64131348Entities();

        // GET: KiemTraPhongTrong_64131348
        [HttpGet]
        public ActionResult Index()
        {
            var chiTietPhieuThuePhong = db.CTPhieuThuePhongs.ToList();
            return View(chiTietPhieuThuePhong);
        }

        [HttpPost]
        public ActionResult Index(string ngayDen, string ngayDi)
        {
            DateTime dt1, dt2;

            // Sử dụng TryParseExact để kiểm tra và chuyển đổi ngày tháng
            if (DateTime.TryParseExact(ngayDen, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dt1) &&
                DateTime.TryParseExact(ngayDi, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dt2))
            {
                var chiTietPhieuThuePhong = db.CTPhieuThuePhongs
                    .Where(n => n.PhieuThuePhong.ngayThue <= dt1 && n.PhieuThuePhong.ngayTra >= dt2)
                    .ToList();
                return View(chiTietPhieuThuePhong);
            }
            else
            {
                // Nếu ngày không hợp lệ, trả về thông báo lỗi hoặc xử lý khác
                ModelState.AddModelError("", "Ngày không hợp lệ. Vui lòng nhập lại.");
                return View();
            }
        }
    }
}
