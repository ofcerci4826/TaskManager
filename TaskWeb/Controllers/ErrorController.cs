using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TaskCore.Core;
using TaskCore.Core.IO;
using TaskCore.Model;
using TaskCore.NetCore.Utils;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace TaskWeb.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            string guid = Guid.NewGuid().ToString();
            // Get the details of the exception that occurred
            var exceptionFeature = HttpContext.Features.Get<IExceptionHandlerPathFeature>();

            if (exceptionFeature != null)
            {
                // Get which route the exception occurred at
                string routeWhereExceptionOccurred = exceptionFeature.Path;

                // Get the exception that occurred
                Exception exceptionThatOccurred = exceptionFeature.Error;

                // TODO: Do something with the exception
                // Log it with Serilog?
                // Send an e-mail, text, fax, or carrier pidgeon?  Maybe all of the above?
                // Whatever you do, be careful to catch any exceptions, otherwise you'll end up with a blank page and throwing a 500
                Log.Error(guid + " " + exceptionThatOccurred.Message, exceptionThatOccurred.StackTrace, LogHelper.GetPrefix());
                Sql.GetInstance().Run("sp_diagnostic_error", new List<object> { "ERR5001", "Web", routeWhereExceptionOccurred, "Beklenmedik site hatası", exceptionThatOccurred.Message, guid });
            }

            return View("Error", new ErrorViewModel { RequestId = guid, Status = 500 });
        }

        public IActionResult Forbidden()
        {
            return View("Error", new ErrorViewModel { Status = 403 });
        }

        public IActionResult ForbiddenJson()
        {
            return Content(AppResponse.Return(403));
        }

        public IActionResult Session()
        {
            return RedirectToAction("Giris", "Kullanici");
        }

        public IActionResult SessionJson()
        {
            return Content(AppResponse.Return(402));
        }

        public IActionResult Server()
        {
            return View("Error", new ErrorViewModel { Status = 501 });
        }

        public IActionResult ServerJson()
        {
            return Content(AppResponse.Return(501));
        }

        public IActionResult Javascript(string message, string metod)
        {
            string guid = Guid.NewGuid().ToString();
            Log.Error(guid + " " + message, message, metod);
            Sql.GetInstance().Run("sp_diagnostic_error", new List<object> { "ERR5005", "Web", metod, "Beklenmedik site javascript hatası", message, guid });
            return Content(AppResponse.Return(501));
        }
    }
}