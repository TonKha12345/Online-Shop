using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Model
{
    public class ProductModel
    {
        public long ID { get; set; }
        public string Images { set; get; }
        public string Name { set; get; }
        public double? Price { set; get; }
        public string CategoryName { set; get; }
        public string CategoryMetaTitle { set; get; }
        public string MetaTitle { set; get; }
        public DateTime? CreatedDate { set; get; }
    }
}
