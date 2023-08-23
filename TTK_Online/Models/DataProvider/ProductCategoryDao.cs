using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class ProductCategoryDao
    {
        private OnlineDbContext db;
        public ProductCategoryDao()
        {
            db = new OnlineDbContext();
        }

        public List<ProductCategory> GetAll()
        {
            return db.ProductCategories.Where(x => x.Status ==true).OrderBy(x => x.DisplayOrder).ToList();
        }

        public List<Product> GetProductOfCategory(long id)
        {
            return db.Products.Where(x => x.CategoryID == id && x.Status == true).ToList();
        }

        public ProductCategory GetByID(long id)
        {
            return db.ProductCategories.Find(id);
        }
    }
}
