using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class SlideDao
    {
        private OnlineDbContext db;
        public SlideDao()
        {
            db = new OnlineDbContext();
        }

        public List<Slide> GetAll()
        {
            return db.Slides.OrderBy(x => x.DisplayOrder).Skip(1).ToList();
        }

        public Slide GetFirst()
        {
            return db.Slides.First();
        }
    }
}
