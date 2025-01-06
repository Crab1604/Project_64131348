using Project_64131348.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_64131348.Controllers
{
    public class Home_64131348Controller : Base_64131348Controller
    {
        Project_64131348Entities db = new Project_64131348Entities();
        // GET: Home_64131348
        public ActionResult Index()
        {
            List<string> maPDP = db.PhieuDatPhongs.Select(x => x.maPDP).ToList();
            List<string> maPDPinPTP = db.PhieuThuePhongs.Select(x => x.maPDP).ToList();
            for (int i = 0; i < maPDPinPTP.Count; i++)
            {
                string item = maPDPinPTP[i];
                if (maPDP.Contains(item))
                {
                    maPDP.Remove(item);
                }
            }
            //var phieuDatPhongs = db.PhieuDatPhongs
            var lienHe = db.LienHes.Where(x => x.tinhTrang == false).ToList();
            var phanHoi = db.PhanHois.Where(x => x.TinhTrang == false).ToList();
            ViewBag.PDP = maPDP.Count() == 0 ? "" : maPDP.Count().ToString();
            ViewBag.LienHe = lienHe.Count() == 0 ? "" : lienHe.Count().ToString();
            ViewBag.PhanHoi = phanHoi.Count() == 0 ? "" : phanHoi.Count().ToString();
            return View();
        }
    }
}