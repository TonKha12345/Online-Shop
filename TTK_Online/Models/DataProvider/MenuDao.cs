using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class MenuDao
    {
        private OnlineDbContext db;
        public MenuDao()
        {
            db = new OnlineDbContext();
        }

        public List<Menu> TopMenu()
        {
            return db.Menus.Where(x => x.TypeID == 2 && x.Status ==true).OrderByDescending(x => x.DisplayOrder).ToList();
        }

        public List<Menu> MainMenu()
        {
            return db.Menus.Where(x => x.TypeID == 1 && x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }

        public List<Menu> LogoutMenu()
        {
            return db.Menus.Where(x => x.TypeID == 3 && x.Status == true).ToList();
        }
    }
}
