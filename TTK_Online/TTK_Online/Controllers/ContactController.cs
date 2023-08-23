using Models.DataProvider;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.Mvc;

namespace TTK_Online.Controllers
{
    public class ContactController : BaseController
    {
        // GET: Contact
        public ActionResult Index()
        {
            var model = new ContactDao().GetFirst();
            return View(model);
        }

        [HttpPost]
        public ActionResult Feedback(string name, string phone, string email, string address, string content)
        {
            var feedback = new Feedback()
            {
                Name = name,
                Phone = phone,
                Email = email,
                Address = address,
                Content = content
            };
            var result = new FeedbackDao().Insert(feedback);
            if (result)
            {
                SetAlert("Gửi góp ý thành công, Xin chân thành cảm ơn góp ý của bạn", "success");
                return RedirectToAction("Index");
            }
            else
            {
                SetAlert("Gửi góp ý không thành công !", "error");
                return RedirectToAction("Index");
            }
        }
    }
}