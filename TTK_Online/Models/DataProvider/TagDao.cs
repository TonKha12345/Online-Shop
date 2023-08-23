using Models.EF;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Mapping;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class TagDao
    {
        private OnlineDbContext db;
        public TagDao()
        {
            db = new OnlineDbContext();
        }

        public List<Tag> ListTag(long contentID)
        {
            var tags = (from a in db.Tags
                        join b in db.ContentTags
                        on a.ID equals b.TagID
                        where b.ContentID == contentID
                        select new
                        {
                            ID = b.TagID,
                            Name = a.Name
                        }).AsEnumerable().Select(x => new Tag()
                        {
                            ID = x.ID,
                            Name = x.Name
                        });
            return tags.ToList();
        }

        public Tag GetByID(string tagID)
        {
            return db.Tags.Find(tagID);
        }
    }
}
