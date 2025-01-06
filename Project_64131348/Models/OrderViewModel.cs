using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_64131348.Models
{
    public class OrderViewModel
    {
        public string maPDP { get; set; }
        public string maKH { get; set; }
        public string ngayDen { get; set; }
        public string ngayDi { get; set; }
        public string soNguoi { get; set; }
        public string tinhTrang { get; set; }
        public string maNV { get; set; }
        public List<CTPhieuDatPhong> order { get; set; }
    }
}