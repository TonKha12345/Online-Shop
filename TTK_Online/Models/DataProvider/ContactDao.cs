using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class ContactDao
    {
        private OnlineDbContext db;
        public ContactDao()
        {
            db = new OnlineDbContext();
        }

        public Contact GetFirst()
        {
            return db.Contacts.FirstOrDefault();
        }

    }
}
