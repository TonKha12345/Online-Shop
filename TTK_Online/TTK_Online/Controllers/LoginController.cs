using Models.Common;
using Models.DataProvider;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TTK_Online.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var userDao = new UserDao();
                var result = userDao.Login(model.UserName, model.Password);
                if (result == 0)
                {
                    ModelState.AddModelError("", "Tên đăng nhập không đúng !");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng !");
                }
                else
                {
                    var session = new UserSession()
                    {
                        UserName = model.UserName,
                        GroupID = userDao.GetGroupID(model.UserName)
                    };
                    Session.Add(SessionHelper.UserSession, session);
                }
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session[SessionHelper.UserSession] = null;
            return Redirect("/");
        }
    }
}