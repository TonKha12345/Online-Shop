using Models.Common;
using Models.EF;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Web.Razor.Generator;

namespace Models.DataProvider
{
    public class UserDao
    {
        private OnlineDbContext db;
        public UserDao()
        {
            db = new OnlineDbContext();
        }

        public int Login(string Username, string password, bool isLoginAdmin = false)
        {
            var user = db.Users.FirstOrDefault(x => x.UserName == Username);
            if (user == null)
            {
                return 0;
            }
            else
            {
                if(isLoginAdmin == true)
                {
                    if(user.GroupID == "ADMIN" || user.GroupID == "MOD")
                    {
                        if (user.Status == false)
                        {
                            return -1;
                        }
                        else
                        {
                            if (user.Password != Encryptor.MD5Hash(password))
                            {
                                return -2;
                            }
                            else
                            {
                                return 1;
                            }
                        }
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if(user.Status == false)
                    {
                        return -1;
                    }
                    else
                    {
                        if (user.Password != Encryptor.MD5Hash(password))
                        {
                            return -2;
                        }
                        else
                        {
                            return 1;
                        }
                    }
                }
            }
        }

        public string GetGroupID(string Username)
        {
            return db.Users.FirstOrDefault(x => x.UserName == Username).GroupID;
        }

        public List<User> GetAll()
        {
            return db.Users.ToList();
        }

        public bool ChangeStatus(int ID)
        {
            var user = db.Users.Find(ID);
            if(user.Status == true) user.Status = false;
            else user.Status = true;
            db.SaveChanges();
            return user.Status;
        }

        public bool Create (User user)
        {
            try
            {
                db.Users.Add(user);
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }

        public bool Edit(User user)
        {
            var userEdit = db.Users.Find(user.ID);
            userEdit.UserName = user.UserName;
            userEdit.Password = Encryptor.MD5Hash(user.Password);
            userEdit.Name = user.Name;
            userEdit.Address = user.Address;
            userEdit.Email = user.Email;
            userEdit.Phone = user.Phone;
            userEdit.Status= user.Status;
            userEdit.GroupID = user.GroupID;
            db.SaveChanges();
            return true;
        }

        public bool Delete(int ID)
        {
            var deleteUser = db.Users.Find(ID);
            db.Users.Remove(deleteUser);
            db.SaveChanges();
            return true;
        }

        public User GetByID(long ID)
        {
            return db.Users.Find(ID);
        }

        public IEnumerable<User> Paging(string search, ref int totalRecord, int page, int pageSize)
        {
            IEnumerable<User> model = db.Users;
            if(search != null)
            {
                var result = db.Users.Where(x => x.UserName.Contains(search) || x.Name.Contains(search));
                model = result;
            }
            totalRecord = model.Count();
            return model.OrderBy(x => x.ID).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public User GetByUserName(string userName)
        {
            return db.Users.FirstOrDefault(x => x.UserName == userName);
        }

        public bool CheckUserName (string userName)
        {
            try
            {
                var user = db.Users.First(x => x.UserName.Equals("userName"));
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool CheckEmail(string email)
        {
            try
            {
                var user = db.Users.First(x => x.Email.Equals("email"));
                return true;
            }
            catch
            {
                return false;
            }
        }

        public List<string> GetListCredential(string userName)
        {
            var user = db.Users.FirstOrDefault(x => x.UserName == userName);
            var credentials = (from a in db.Credentials
                               join b in db.UserGroups on a.GroupID equals b.ID
                               join c in db.Roles on a.RoleID equals c.ID
                               where user.GroupID == b.ID
                               select new
                               {
                                   RoleID = c.ID,
                                   GroupID = b.ID,
                               }).AsEnumerable().Select(x => new Credential
                               {
                                   RoleID = x.RoleID,
                                   GroupID = x.GroupID
                               });
            return credentials.Select(x => x.RoleID).ToList();
        }
    }
}
