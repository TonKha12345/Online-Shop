using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class FooterDao
    {
        private OnlineDbContext db;
        public FooterDao()
        {
            db = new OnlineDbContext();
        }

        public Footer GetFooter()
        {
            return db.Footers.First();
        }
    }
}
