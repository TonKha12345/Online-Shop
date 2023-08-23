using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;

namespace Models.Model
{
    public class RegisterModel
    {
        [Key]
        public int ID { get; set; }

        [Required(ErrorMessage ="Vui lòng nhập tên đăng nhập")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Tên đăng nhập ít nhất 6 ký tự")]
        [Display(Name = "Tên đăng nhập")]
        public string UserName { get; set; }

        [Required(ErrorMessage ="Vui lòng nhập mật khẩu")]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Bạn chưa nhập lại mật khẩu")]
        [Display(Name = "Nhập lại mật khẩu")]
        [Compare("Password", ErrorMessage ="xác nhận mật khẩu không trùng khớp")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tên của bạn")]
        [Display(Name = "Tên khách hàng")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [Display(Name = "Tỉnh/Thành")]
        public long ProvinceID { get; set; }

        [Display(Name = "Quận/Huyện")]
        public long DistrictID { get; set; }
    }
}
