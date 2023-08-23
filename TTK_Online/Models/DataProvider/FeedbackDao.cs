using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class FeedbackDao
    {
        private OnlineDbContext db;
        public FeedbackDao()
        {
            db = new OnlineDbContext();
        }

        public bool Insert(Feedback feedback)
        {
            try
            {
                db.Feedbacks.Add(feedback);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
