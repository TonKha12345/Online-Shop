using Common;
using Microsoft.Ajax.Utilities;
using Models.Common;
using Models.DataProvider;
using Models.EF;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using static System.Collections.Specialized.BitVector32;

namespace TTK_Online.Controllers
{
    public class CartController : BaseController
    {
        // GET: Cart
        public ActionResult Index()
        {
            var cart = (List<CartItem>)Session[SessionHelper.CartSession];
            var list = new List<CartItem>();
            if(cart != null)
            {
                list = cart;
            }
            return View(list);
        }

        public ActionResult AddItem(long productID, double quantity)
        {
            var product = new ProductDao().Detail(productID);
            var cart = Session[SessionHelper.CartSession];
            if(cart != null)
            {
                var list = (List<CartItem>)cart;
                if(list.Exists(x => x.Product.ID == productID))
                {
                    var p = list.FirstOrDefault(x => x.Product.ID == productID);
                    p.Quantity += quantity;
                }
                else
                {
                    var item = new CartItem()
                    {
                        Product = product,
                        Quantity = quantity
                    };
                    list.Add(item);
                }
                cart = list;
            }
            else
            {
                //Tao moi 1 doi tuong 
                var item = new CartItem()
                {
                    Product = product,
                    Quantity = quantity
                };
                var list = new List<CartItem>();
                list.Add(item);

                //Gan vao session
                Session[SessionHelper.CartSession] = list;
            }
            return RedirectToAction("Index");
        }

        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[SessionHelper.CartSession];
            foreach(var item in jsonCart)
            {
                var cartItem = sessionCart.FirstOrDefault(x => x.Product.ID == item.Product.ID);
                if(cartItem != null)
                {
                    cartItem.Quantity = item.Quantity;
                }
            }
            Session[SessionHelper.CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult DeleteAll()
        {
            Session[SessionHelper.CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        [HttpGet]
        public ActionResult DeleteItem(long id)
        {
            var listCart = (List<CartItem>)Session[SessionHelper.CartSession];
            listCart.RemoveAll(x => x.Product.ID == id);
            return RedirectToAction("Index");
        }

        public JsonResult Payment()
        {
            var user = (UserSession)Session[SessionHelper.UserSession];
            bool result = false;
            if(user != null)
            {
                result = true;
            }
            return Json(new
            {
                status = result
            });
        }

        public ActionResult PaymentUser()
        {
            var UserSession = (UserSession)Session[SessionHelper.UserSession];
            var user = new UserDao().GetByUserName(UserSession.UserName);
            var listCart = (List<CartItem>)Session[SessionHelper.CartSession];
            var orderDetailDao = new OrderDetailDao();
            double? total = 0;
            if(UserSession != null)
            {
                var order = new Order()
                {
                    CreateDate = DateTime.Now,
                };
                var orderID = new OrderDao().Insert(order);
                
                if(orderID > 0)
                {
                    foreach (var item in listCart)
                    {
                        var orderDetail = new OrderDetail()
                        {
                            ProductID = item.Product.ID,
                            OrderID = orderID,
                            Quantity = item.Quantity,
                            Price = item.Product.Price,
                            ShipName = user.Name, 
                            ShipPhone = user.Phone,
                            ShipAddress = user.Address,
                            ShipEmail = user.Email
                        };
                        total += orderDetail.Price * orderDetail.Quantity;
                        var result = orderDetailDao.Insert(orderDetail);
                        if (!result)
                        {
                            SetAlert("Đặt đơn hàng không thành công", "error");
                            return RedirectToAction("Index");
                        }
                    }
                }
            }
            Session[SessionHelper.CartSession] = null;
            SetAlert("Đặt hàng thành công, vui lòng chờ giao hàng", "success");
            string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/client/template/neworder.html"));

            content = content.Replace("{{CustomerName}}", user.Name);
            content = content.Replace("{{Phone}}", user.Phone);
            content = content.Replace("{{Email}}", user.Email);
            content = content.Replace("{{Address}}", user.Address);
            content = content.Replace("{{Total}}", total.HasValue ? total.Value.ToString("N0") : "Liên hệ");
            var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

            new MailHelper().SendMail(user.Email, "Đơn hàng mới từ OnlineShop", content);
            new MailHelper().SendMail(toEmail, "Đơn hàng mới từ OnlineShop", content);
            return RedirectToAction("PaymentSuccess");
        }

        [HttpGet]
        public ActionResult PaymentNotUser()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PaymentNotUser(OrderDetail model)
        {
            var listCart = (List<CartItem>)Session[SessionHelper.CartSession];
            var orderDetailDao = new OrderDetailDao();
            var order = new Order()
            {
                CreateDate = DateTime.Now,
            };
            var orderID = new OrderDao().Insert(order);
            double? total = 0;
            if (orderID > 0)
            {
                foreach (var item in listCart)
                {
                    var orderDetail = new OrderDetail()
                    {
                        ProductID = item.Product.ID,
                        OrderID = orderID,
                        Quantity = item.Quantity,
                        Price = item.Product.Price,
                        ShipName = model.ShipName,
                        ShipPhone = model.ShipPhone,
                        ShipAddress = model.ShipAddress,
                        ShipEmail = model.ShipEmail
                    };
                    total += orderDetail.Price * orderDetail.Quantity;
                    var result = orderDetailDao.Insert(orderDetail);
                    if (!result)
                    {
                        SetAlert("Đặt hàng không thành công", "error");
                        return RedirectToAction("Index");
                    }
                }
            }

            Session[SessionHelper.CartSession] = null;
            SetAlert("Đặt hàng thành công, vui lòng chờ giao hàng", "success");
            string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/client/template/neworder.html"));

            content = content.Replace("{{CustomerName}}", model.ShipName);
            content = content.Replace("{{Phone}}", model.ShipPhone);
            content = content.Replace("{{Email}}", model.ShipEmail);
            content = content.Replace("{{Address}}", model.ShipAddress);
            content = content.Replace("{{Total}}", total.HasValue ? total.Value.ToString("N0"): "Liên hệ");
            var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

            new MailHelper().SendMail(model.ShipEmail, "Đơn hàng mới từ OnlineShop", content);
            new MailHelper().SendMail(toEmail, "Đơn hàng mới từ OnlineShop", content);
            return View();
        }

        public ActionResult PaymentSuccess()
        {
            SetAlert("Chúc mừng bạn đã đặt đơn hàng thành công", "success");
            return View();
        }
    }
}