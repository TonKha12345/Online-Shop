using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Models.Model
{
    public class LoginModel
    {
        [Key]
        [Required( ErrorMessage = "Vui lòng nhập tên đăng nhập ")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu ")]
        public string Password { get; set; }
        public bool RememberMe { get; set; }
    }
}
