﻿using Project_64131348.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_64131348.Controllers
{
    public class ThongKe_64131348Controller : Controller
    {
        Project_64131348Entities db = new Project_64131348Entities();
        // GET: ThongKe
        public ActionResult ByDichVu(string fromDate = "", string toDate = "")

        {
            if (fromDate == "" || toDate == "")
            {
                fromDate = "2000-1-1";
                toDate = "2050-1-1";
            }
            string query = "select dv.maDV, dv.tenDV, sum(dv.gia * ctptp.soLuong)" +
                " from DichVu dv, CTPhieuThuePhong ctptp, PhieuThuePhong ptp, HoaDon hd" +
                " where not(dv.maDV = 'DV0000') and (dv.maDV = ctptp.maDV) and (ptp.maPTP = hd.maPTP) and (ptp.maPTP = ctptp.maPTP) and (ptp.ngayThue between '" +
                fromDate + "' and '" + toDate + "') and (ptp.ngayTra between '" +
                fromDate + "' and '" + toDate + "')" +
                " group by dv.maDV, dv.tenDV";

            ViewBag.fromDate = fromDate;
            ViewBag.toDate = toDate;
            var data = db.Database.SqlQuery<DichVu>(query).ToList();

            return View(data);
        }
    }
}