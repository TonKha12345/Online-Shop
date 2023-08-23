using Models.DataProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TTK_Online.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly] 
        public PartialViewResult NewProduct()
        { 
            var model = new ProductDao().GetNewProduct();
            return PartialView(model);
        }

        [ChildActionOnly]
        public PartialViewResult FeatureProduct()
        {
            var model = new ProductDao().GetFeatureProduct();
            return PartialView(model);
        }
    }
}