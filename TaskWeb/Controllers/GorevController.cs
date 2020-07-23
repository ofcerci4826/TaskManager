using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TaskCore.Core;
using TaskCore.Model;
using TaskCore.NetCore.Filters;

namespace TaskWeb.Controllers
{
    public class GorevController : Controller
    {
        [AuthControl]
        public IActionResult Index()
        {
            return View();
        }

        [AuthControl]
        [HttpPost]
        public IActionResult Listesi()
        {
            return Content(AppResponse.Return(200,GorevYoneticisi.Listesi()));
        }

        [AuthControl]
        public IActionResult Olustur()
        {
            return View();
        }

        public IActionResult Kaydet(GorevEvent param)
        {
            if (!param.IsValid(false))
                return Content(AppResponse.Return(400));
            return Content(AppResponse.Return(GorevEvent.Olustur(param)));
        }

        public IActionResult Detay(int Id)
        {
            var result = GorevEvent.Detay(Id);
            if (result == null || result.id <= 0)
                return View("NotFound");

            return View(result);
        }

        public IActionResult Guncelle(GorevEvent param)
        {
           
            return Content(AppResponse.Return(GorevEvent.Guncelle(param)));
        }
        
    }
}