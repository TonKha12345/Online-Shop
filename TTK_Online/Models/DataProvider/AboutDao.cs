using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class AboutDao
    {
        private OnlineDbContext db;
        public AboutDao()
        {
            db = new OnlineDbContext();
        }

        public About About()
        {
            return db.Abouts.FirstOrDefault();
        }
    }
}
