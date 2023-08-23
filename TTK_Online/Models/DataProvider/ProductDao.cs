using Models.EF;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Models.DataProvider
{
    public class ProductDao
    {
        private OnlineDbContext db;
        public ProductDao()
        {
            db = new OnlineDbContext();
        }

        public List<Product> GetNewProduct()
        {
            return db.Products.Where(x => x.NewProduct == true && x.Status == true).ToList();
        }

        public List<Product> GetFeatureProduct()
        {
            return db.Products.Where(x => x.FeatureProduct == true && x.Status == true).ToList();
        }

        public Product Detail(long id)
        {
            return db.Products.Find(id);
        }

        public List<Product> RelatedProduct(Product p)
        {
            return db.Products.Where(x => x.Status ==true && x.CategoryID == p.CategoryID).ToList();
        }

        public IEnumerable<Product> Paging(long id, string search, ref int totalRecord, int page, int pageSize)
        {
            IEnumerable<Product> model = db.Products.Where(x => x.CategoryID == id && x.Status == true);
            if (search != null)
            {
                var result = db.Products.Where(x => x.Name.Contains(search) && x.CategoryID == id && x.Status == true);
                model = result;
            }
            totalRecord = model.Count();
            return model.OrderBy(x => x.ID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public List<ProductModel> Search(string keyword, ref int totalRecord, int page, int pageSize)
        {
            totalRecord = db.Products.Where(x => x.Name == keyword).Count();
            var model = (from a in db.Products
                         join b in db.ProductCategories on a.CategoryID equals b.ID
                         where a.Name.Contains(keyword)
                         select new
                         {
                             ID = a.ID,
                             Images = a.Images,
                             Name = a.Name,
                             Price = a.Price,
                             CategoryName = b.Name,
                             CategoryMetaTitle = b.MetaTitle,
                             CreatedDate = a.CreateDate,
                             MetaTitle = a.MetaTitle,
                         }).AsEnumerable().Select(x => new ProductModel()
                         {
                             ID = x.ID,
                             Images = x.Images,
                             Name = x.Name,
                             Price = x.Price,
                             MetaTitle = x.MetaTitle,
                             CategoryName = x.CategoryName,
                             CategoryMetaTitle= x.CategoryMetaTitle,
                             CreatedDate = x.CreatedDate
                         });
            return model.OrderBy(x => x.ID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public List<string> ListName (string keyword)
        {
            return db.Products.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
    }
}
