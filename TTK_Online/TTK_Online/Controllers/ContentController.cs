using Microsoft.Ajax.Utilities;
using Models.DataProvider;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace TTK_Online.Controllers
{
    public class ContentController : BaseController
    {
        // GET: Content
        public ActionResult Index(int page = 1, int pageSize = 4)
        {
            var dao = new ContentDao();
            int totalRecord = 0;

            var model = dao.Paging(ref totalRecord, page, pageSize);
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
            return View(model);
        }

        public ActionResult Detail(long contentID)
        {
            var model = new ContentDao().GetByID(contentID);
            ViewBag.Tags = new TagDao().ListTag(contentID);
            return View(model);
        }

        public ActionResult Tag(string tagID, int page = 1, int pageSize = 4)
        {
            var dao = new ContentDao();
            var model = dao.GetContentByTagID(tagID, page, pageSize);
            int totalRecord = model.Count();
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            double num = (double)totalRecord / pageSize;
            totalPage = (int)Math.Ceiling(num);

            ViewBag.Tags = new TagDao().GetByID(tagID);
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.Previous = page - 1;
            ViewBag.Next = page + 1;
            return View(model);
        }
    }
}