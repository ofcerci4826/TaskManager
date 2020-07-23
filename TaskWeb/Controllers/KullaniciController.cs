using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using TaskCore.Core;
using TaskCore.Model;
using TaskCore.NetCore.Filters;

namespace TaskWeb.Controllers
{

    public class KullaniciController : Controller
    {
        [HttpGet]
        public IActionResult Giris()
        {
            return View();
        }
        

        [HttpPost]
        public IActionResult Giris(Kullanici param)
        {
            if (string.IsNullOrEmpty(param.Eposta)
               || string.IsNullOrEmpty(param.Parola))
                return Content(AppResponse.Return(400, ""));

            Kullanici kullanici = Kullanici.Giris(param.Eposta, param.Parola, "WEB", "");

            if (string.IsNullOrEmpty(kullanici.Token))
                return Content(AppResponse.Return(297, "Eposta adresi veya parola hatalı"));

            return Content(AppResponse.Return(200, kullanici));
        }

        [AuthControl]
        [HttpGet]
        public IActionResult Info()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Cikis()
        {
            HttpContext.Session.Remove("Kullanici");

            return RedirectToAction("Giris", "Kullanici");
        }


        [AuthControl]
        public IActionResult Kullanicilar()
        {
            return View(Kullanici.Listele());
        }

        [AuthControl]
        public IActionResult Olustur()
        {
            return View();
        }

        [AuthControl]
        public IActionResult Kaydet(Kullanici param)
        {
            return Content(AppResponse.Return(Kullanici.Olustur(param)));
        }

        [HttpPost]

        public IActionResult Guncelle(Kullanici param)
        {
            //if (!param.IsValid(true))
            //    return Content(AppResponse.Return(400));

            return Content(AppResponse.Return(Kullanici.Guncelle(param)));
        }


        [HttpGet]
        public IActionResult Detay(int id)
        {
            var result = Kullanici.Detay(id);
            if (result == null || result.Id <= 0)
                return View("NotFound");

            return View("Detay", result);
        }

        [AuthControl]
        public IActionResult Gruplar()
        {
            return View(KullaniciGrup.Listesi());
        }

        [HttpGet]
        [AuthControl]
        public IActionResult GrupOlustur()
        {
            return View(new KullaniciGrup());
        }

        [HttpPost]
        [AuthControl]
        public IActionResult GrupOlustur(KullaniciGrup param)
        {
            return Content(AppResponse.Return(KullaniciGrup.Olustur(param)));
        }

        [HttpGet]
        public IActionResult GrupDetay(int id)
        {
            var result = KullaniciGrup.Detay(id);
            if (result == null || result.Id <= 0)
                return View("NotFound");

            return View("GrupDetay", result);
        }

        [HttpPost]
        [AuthControl]
        public IActionResult GrupGuncelle(KullaniciGrup param)
        {
            return Content(AppResponse.Return(KullaniciGrup.Guncelle(param)));
        }


        [AuthControl]
        public IActionResult Yetkiler()
        {
            return View(Yetki.Listesi());
        }

        [HttpGet]
        [AuthControl]
        public IActionResult YetkiOlustur()
        {
            return View(new Yetki());
        }

        [HttpPost]
        [AuthControl]
        public IActionResult YetkiOlustur(Yetki param)
        {
            return Content(AppResponse.Return(Yetki.Olustur(param)));
        }



    }

}