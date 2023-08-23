using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class OrderDetailDao
    {
        private OnlineDbContext db;
        public OrderDetailDao()
        {
            db = new OnlineDbContext();
        }

        public bool Insert(OrderDetail orderDetail)
        {
            try
            {
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }

        public List<OrderDetail> GetByOrderID(long id)
        {
            return db.OrderDetails.Where(x => x.OrderID == id).ToList();
        }
    }
}
