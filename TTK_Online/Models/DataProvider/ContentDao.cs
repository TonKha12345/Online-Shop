using Models.Common;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Models.DataProvider
{
    public class ContentDao
    {
        private OnlineDbContext db;
        public ContentDao()
        {
            db = new OnlineDbContext();
        }

        public long Insert(Content content)
        {
            //Xu li alias
            if (string.IsNullOrEmpty(content.MetaTitle))
            {
                content.MetaTitle = StringHelper.ToUnsignString(content.Name);
            }
            db.Contents.Add(content);
            db.SaveChanges();

            //Xu li tag
            if (!string.IsNullOrEmpty(content.Tags))
            {
                string[] tags = content.Tags.Split(',');
                foreach(string tag in tags)
                {
                    var tagID = StringHelper.ToUnsignString(tag);
                    var checkTag = this.CheckTag(tagID);
                    if (!checkTag)
                    {
                        var newtag = new Tag()
                        {
                            ID = tagID,
                            Name = tag
                        };
                        db.Tags.Add(newtag);
                        db.SaveChanges();
                    }
                    var check = db.ContentTags.FirstOrDefault(x => x.TagID == tagID && x.ContentID == content.ID);
                    if (check == null)
                    {
                        var newContentTag = new ContentTag()
                        {
                            ContentID = content.ID,
                            TagID = tagID
                        };
                        db.ContentTags.Add(newContentTag);
                        db.SaveChanges();
                    }
                        
                }
            }
            return content.ID;
        }

        public bool CheckTag (string TagID)
        {
            return db.Tags.Count(x => x.ID == TagID) > 0;
        }

        public IEnumerable<Content> Paging(string search, ref int totalRecord, int page, int pageSize)
        {
            IEnumerable<Content> model = db.Contents;
            if (search != null)
            {
                var result = db.Contents.Where(x => x.Name.Contains(search));
                model = result;
            }
            totalRecord = model.Count();
            return model.OrderBy(x => x.ID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public bool ChangeStatus(int ID)
        {
            var content = db.Contents.Find(ID);
            if (content.Status == true) content.Status = false;
            else content.Status = true;
            db.SaveChanges();
            return content.Status;
        }

        public Content GetByID(long ID)
        {
            return db.Contents.Find(ID);
        }

        public bool Edit(Content content)
        {
            var contentEdit = db.Contents.Find(content.ID);
            contentEdit.Name = content.Name;
            contentEdit.MetaTitle = content.MetaTitle;
            if (string.IsNullOrEmpty(content.MetaTitle))
            {
                content.MetaTitle = StringHelper.ToUnsignString(content.Name);
            }
            contentEdit.Decriptions = content.Decriptions;
            contentEdit.Images = content.Images;
            contentEdit.CategoryID = content.CategoryID;
            contentEdit.Detail = content.Detail;
            contentEdit.MetaKeyword = content.MetaKeyword;
            contentEdit.MetaDescription = content.MetaDescription;
            contentEdit.Status = content.Status;
            contentEdit.ShowOnHome = content.ShowOnHome;
            contentEdit.ToHot = content.ToHot;
            if (!string.IsNullOrEmpty(content.Tags))
            {
                string[] tags = content.Tags.Split(',');
                foreach (string tag in tags)
                {
                    var tagID = StringHelper.ToUnsignString(tag);
                    var checkTag = this.CheckTag(tagID);
                    if (!checkTag)
                    {
                        var newtag = new Tag()
                        {
                            ID = tagID,
                            Name = tag
                        };
                        db.Tags.Add(newtag);
                        db.SaveChanges();
                    }
                    var check = db.ContentTags.FirstOrDefault(x => x.TagID == tagID && x.ContentID == content.ID);
                    if(check == null)
                    {
                        var newContentTag = new ContentTag()
                        {
                            ContentID = content.ID,
                            TagID = tagID
                        };
                        db.ContentTags.Add(newContentTag);
                        db.SaveChanges();
                    }
                }
            }
            db.SaveChanges();
            return true;
        }

        public bool Delete(int ID)
        {
            try
            {
                var deleteContent = db.Contents.Find(ID);
                db.Contents.Remove(deleteContent);
                db.SaveChanges();
                return true;
            }
            catch {  return false; }
        }

        public List<Content> Paging( ref int totalRecord, int page, int pageSize)
        {
            List<Content> model = db.Contents.ToList();
            totalRecord = model.Count();
            return model.OrderBy(x => x.ID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public List<Content> GetContentByTagID(string tagID, int page, int pageSize)
        {
            var contents = (from a in db.Contents
                            join b in db.ContentTags
                            on a.ID equals b.ContentID
                            where b.TagID == tagID
                            select new
                            {
                                Name = a.Name,
                                MetaTitle = a.MetaTitle,
                                Images = a.Images,
                                Description = a.Decriptions,
                                CreatedDate = a.CreateDate,
                                CreatedBy = a.CreateBy,
                                ID = a.ID
                            }).AsEnumerable().Select(x => new Content()
                            {
                                Name = x.Name,
                                MetaTitle = x.MetaTitle,
                                Images = x.Images,
                                Decriptions = x.Description,
                                CreateDate = x.CreatedDate,
                                CreateBy = x.CreatedBy,
                                ID = x.ID
                            });
            return contents.OrderBy(x => x.ID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }
    }
}
