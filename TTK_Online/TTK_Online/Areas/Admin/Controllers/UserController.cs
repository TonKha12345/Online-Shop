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
    public class UserController : BaseController
    {
        // GET: Admin/User
        [HasCredential(RoleID = "VIEW_USER")]
        public ActionResult Index(string search, int page = 1, int pageSize = 10)
        {
            int totalRecord = 0;

            var model = new UserDao().Paging(search, ref totalRecord, page, pageSize);
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

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public JsonResult ChangeStatus(int ID)
        {
            var result = new UserDao().ChangeStatus(ID);
            return Json(new
            {
                status = result
            });
        }

        [HttpGet]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(User user)
        {
            var userdao = new UserDao();
            var newUser = new User()
            {
                UserName = user.UserName,
                Password = Encryptor.MD5Hash(user.Password),
                Name = user.Name,
                Address = user.Address,
                Email = user.Email,
                Phone = user.Phone,
                Status = user.Status,
                GroupID = user.GroupID,
            };
            var result = userdao.Create(newUser);
            if (result)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int ID)
        {
            var userEdit = new UserDao().GetByID(ID);
            return View(userEdit);
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(User user)
        {
            var result = new UserDao().Edit(user);
            if (result)
            {
                SetAlert("Sửa thông tin thành công", "success");
                return RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        [HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int ID)
        {
            var userEdit = new UserDao().Delete(ID);
            return RedirectToAction("Index");
        }
    }
}