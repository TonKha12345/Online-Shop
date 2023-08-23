using Models.DataProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TTK_Online.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(long id)
        {
            var productDao = new ProductDao();
            var model = productDao.Detail(id);
            ViewBag.RelatedProduct = productDao.RelatedProduct(model);
            ViewBag.ProductCategory = new ProductCategoryDao().GetAll();
            return View(model);
        }

        public ActionResult SeeAllNewProduct()
        { 
            var productDao = new ProductDao();
            var model = productDao.GetNewProduct();
            return View(model);
        }

        public ActionResult SeeAllFeatureProduct()
        {
            var productDao = new ProductDao();
            var model = productDao.GetFeatureProduct();
            return View(model);
        }
    }
}