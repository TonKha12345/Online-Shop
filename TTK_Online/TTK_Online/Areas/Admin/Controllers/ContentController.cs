using Models.Common;
using Models.DataProvider;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TTK_Online.Areas.Admin.Controllers
{
    public class ContentController : BaseController
    {
        // GET: Admin/Content
        public ActionResult Index(string search, int page = 1, int pageSize = 1)
        {
            int totalRecord = 0;

            var model = new ContentDao().Paging(search, ref totalRecord, page, pageSize);
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
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Content model)
        {
            if (ModelState.IsValid)
            {
                var currentCulture = Session[SessionHelper.CurrentCulture];
                var session = (UserSession)Session[SessionHelper.UserSession];
                model.LanguageID = currentCulture.ToString();
                model.CreateDate = DateTime.Now;
                model.CreateBy = session.UserName;
                var result = new ContentDao().Insert(model);
                if (result > 0)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    SetAlert("Thêm mới tin tức không thành công", "error");
                }
            }
            return View();
        }

        [HttpPost]
        public JsonResult ChangeStatus(int ID)
        {
            var result = new ContentDao().ChangeStatus(ID);
            return Json(new
            {
                status = result
            });
        }

        [HttpGet]
        public ActionResult Edit(int ID)
        {
            var contentEdit = new ContentDao().GetByID(ID);
            return View(contentEdit);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Content content)
        {
            var result = new ContentDao().Edit(content);
            if (result)
            {
                SetAlert("Sửa thông tin thành công", "success");
                return RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Delete(int ID)
        {
            var userEdit = new ContentDao().Delete(ID);
            return RedirectToAction("Index");
        }
    }
}