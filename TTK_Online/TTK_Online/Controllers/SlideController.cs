using Models.DataProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace TTK_Online.Controllers
{
    public class SlideController : Controller
    {
        // GET: Slide
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult Slide()
        {
            var slidedao = new SlideDao();
            var model = slidedao.GetAll();
            ViewBag.First = slidedao.GetFirst();
            return PartialView(model);
        }
    }
}