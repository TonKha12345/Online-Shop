namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string Descriptions { get; set; }

        [StringLength(250)]
        public string Images { get; set; }

        [Column(TypeName = "xml")]
        public string MoreImages { get; set; }

        public double? Price { get; set; }

        public double? PromotionPrice { get; set; }

        public bool? IncludeVAT { get; set; }

        public double? Quantity { get; set; }

        public long CategoryID { get; set; }

        [StringLength(250)]
        public string Detail { get; set; }

        [StringLength(250)]
        public string Warranty { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        [StringLength(250)]
        public string ModifyBy { get; set; }

        [StringLength(250)]
        public string MetaKeyword { get; set; }

        [StringLength(500)]
        public string MetaDescription { get; set; }

        public bool? Status { get; set; }

        public bool? NewProduct { get; set; }

        public bool? FeatureProduct { get; set; }

        [StringLength(2)]
        public string LanguageID { get; set; }

        public bool? ShowOnHome { get; set; }

        public DateTime? ToHot { get; set; }

        public long? ViewCount { get; set; }
    }
}
