using Models.Common;
using Models.DataProvider;
using Models.EF;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Razor;

namespace TTK_Online.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(LoginModel loginModel)
        {
            if (ModelState.IsValid)
            {
                var userDao = new UserDao();
                var result = userDao.Login(loginModel.UserName, loginModel.Password, true);
                if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại !");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khoá.");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập.");
                }
                else
                {
                    var session = new UserSession()
                    {
                        UserName = loginModel.UserName,
                        GroupID = userDao.GetGroupID(loginModel.UserName)
                    };
                    var listCredentials = userDao.GetListCredential(loginModel.UserName);

                    Session.Add(SessionHelper.Credentials, listCredentials);
                    Session.Add(SessionHelper.UserSession, session);
                    return RedirectToAction("Index", "Home");
                }
            }
            return View("Index");
        }
    }
}