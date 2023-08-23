using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TTK_Online
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Product Detail",
                url: "chi-tiet/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Product Category",
                url: "san-pham/{metatitle}-{id}",
                defaults: new { controller = "ProductCategory", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Content Detail",
                url: "tin-tuc/{metatitle}-{contentID}",
                defaults: new { controller = "Content", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "News",
                url: "tin-tuc",
                defaults: new { controller = "Content", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "About",
                url: "gioi-thieu",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
               name: "Delivery",
               url: "van-chuyen",
               defaults: new { controller = "Delivery", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "TTK_Online.Controllers" }
           );

            routes.MapRoute(
                name: "product",
                url: "san-pham",
                defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "SeeallNewProduct",
                url: "see-all-new-product",
                defaults: new { controller = "Product", action = "SeeAllNewProduct", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "SeeallFeatureProduct",
                url: "see-all-feature-product",
                defaults: new { controller = "Product", action = "SeeAllFeatureProduct", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "them gio hang",
                url: "them-gio-hang",
                defaults: new { controller = "Cart", action = "AddItem", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Tags",
                url: "tag/{tagID}",
                defaults: new { controller = "Content", action = "Tag", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "PaymentUser",
                url: "thanh-toan-user",
                defaults: new { controller = "Cart", action = "PaymentUser", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "PaymentNotUser",
                url: "thanh-toan-khong-user",
                defaults: new { controller = "Cart", action = "PaymentNotUser", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "gio hang",
                url: "gio-hang",
                defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Register",
                url: "dang-ky",
                defaults: new { controller = "Register", action = "Register", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "Login", action = "Login", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Logout",
                url: "dang-xuat",
                defaults: new { controller = "Login", action = "Logout", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Contact",
                url: "lien-he",
                defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Search",
                url: "tim-kiem",
                defaults: new { controller = "ProductCategory", action = "Search", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Delete Item Cart",
                url: "xoa/{metatitle}-{id}",
                defaults: new { controller = "Cart", action = "DeleteItem", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TTK_Online.Controllers" } 
            );
        }
    }
}