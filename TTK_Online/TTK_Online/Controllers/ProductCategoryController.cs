using Models.DataProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TTK_Online.Controllers
{
    public class ProductCategoryController : Controller
    {
        // GET: ProductCategory
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryDao().GetAll();
            return PartialView(model);
        }

        public ActionResult Detail(long id, string search, int page = 1, int pageSize = 1)
        {
            var dao = new ProductCategoryDao();
            int totalRecord = 0;

            var model = new ProductDao().Paging(id, search, ref totalRecord, page, pageSize);
            ViewBag.Search = search;
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            double num = (double)totalRecord / pageSize;
            totalPage = (int)Math.Ceiling(num);

            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.Previous = page - 1;
            ViewBag.Next = page + 1;

            ViewBag.Name = dao.GetByID(id);
            //var model = dao.GetProductOfCategory(id);
            return View(model);
        }

        public ActionResult Search(string keyword, string search, int page = 1, int pageSize = 1)
        {
            var dao = new ProductCategoryDao();
            int totalRecord = 0;

            var model = new ProductDao().Search(keyword, ref totalRecord, page, pageSize);
            ViewBag.Search = search;
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            double num = (double)totalRecord / pageSize;
            totalPage = (int)Math.Ceiling(num);

            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.Previous = page - 1;
            ViewBag.Next = page + 1;

            ViewBag.Keyword = keyword;
            //var model = dao.GetProductOfCategory(id);
            return View(model);
        }

        public JsonResult ListName(string q)
        {
            var list = new ProductDao().ListName(q);
            return Json(new
            {
                data = list,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
    }
}