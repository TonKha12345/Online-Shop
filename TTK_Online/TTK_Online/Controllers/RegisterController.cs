using Models.Common;
using Models.DataProvider;
using Models.EF;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace TTK_Online.Controllers
{
    public class RegisterController : BaseController
    {
        [HttpGet]
        public ActionResult Register()
        {
            return View();       
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if(ModelState.IsValid)
            {
                var userDao = new UserDao();
                if (userDao.CheckUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else if (userDao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    var newUser = new User()
                    {
                        UserName = model.UserName,
                        Password = Encryptor.MD5Hash(model.Password),
                        Name = model.Name,
                        Email = model.Email,
                        Phone = model.Phone,
                        Address = model.Address
                    };
                    var result = new UserDao().Create(newUser);
                    if (result)
                    {
                        SetAlert("Đăng kí thành công", "success");
                        model = new RegisterModel();
                    }
                    else
                    {
                        SetAlert("Đăng kí không thành công", "error");
                    }
                }
            }
            return View(model);
        }

        public JsonResult LoadProvince()
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/Assets/Client/xml/Provinces_Data.xml"));
            var xElements = xmlDoc.Root.Elements("Item").Where(x => x.Attribute("type").Value == "province");
            var list = new List<ProvinceModel>();
            ProvinceModel province = null;
            foreach (var item in xElements) 
            {
                province = new ProvinceModel()
                {
                    ID = int.Parse(item.Attribute("id").Value),
                    Name = item.Attribute("value").Value
                };
                list.Add(province);

            }
            return Json(new
            {
                data = list,
                status = true
            });
        }

        public JsonResult LoadDistrict(long provinceID)
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/Assets/Client/xml/Provinces_Data.xml"));
            var province = xmlDoc.Root.Elements("Item").FirstOrDefault(x => x.Attribute("type").Value == "province" && x.Attribute("id").Value == provinceID.ToString());
            var list = new List<DistrictModel>();
            DistrictModel district = null;
            foreach(var item in province.Elements("Item").Where(x => x.Attribute("type").Value == "district"))
            {
                district = new DistrictModel()
                {
                    ID = int.Parse(item.Attribute("id").Value),
                    Name = item.Attribute("value").Value,
                    ProvinceID = provinceID,
                };
                list.Add(district);
            }
            return Json(new
            {
                data = list,
                status = true
            }) ;
        }
    }
}