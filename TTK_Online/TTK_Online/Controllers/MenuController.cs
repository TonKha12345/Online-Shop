using Models.Common;
using Models.DataProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace TTK_Online.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult MainMenu()
        {
            var menuDao = new MenuDao();    
            var model = menuDao.MainMenu();
            return PartialView(model);
        }

        [ChildActionOnly]
        public PartialViewResult TopMenu()
        {
            var menuDao = new MenuDao();
            var model = menuDao.TopMenu();
            if (Session[SessionHelper.UserSession] != null)
            {
                model = menuDao.LogoutMenu();
            }
            return PartialView(model);
        }
    }
}