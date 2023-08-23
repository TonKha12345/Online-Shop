namespace Models.EF
{
    using Models.Common;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Content")]
    public partial class Content
    {
        public long ID { get; set; }

        [Display(Name = "Content_Name", ResourceType = typeof(StaticResource.Resource))]
        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        [Display(Name = "Content_MetaTitle", ResourceType = typeof(StaticResource.Resource))]
        public string MetaTitle { get; set; }
 
        [Display(Name = "Content_Descriptions", ResourceType = typeof(StaticResource.Resource))]
        public string Decriptions { get; set; }

        [StringLength(250)]
        [Display(Name = "Content_Images", ResourceType = typeof(StaticResource.Resource))]
        public string Images { get; set; }

        [Display(Name = "Content_CategoryID", ResourceType = typeof(StaticResource.Resource))]
        public long? CategoryID { get; set; }

        [Display(Name = "Content_Detail", ResourceType = typeof(StaticResource.Resource))]
        public string Detail { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }

        public DateTime? ModifyDate { get; set; }

        [StringLength(250)]
        public string ModifyBy { get; set; }

        [StringLength(250)]
        [Display(Name = "Content_MetaKeyword", ResourceType = typeof(StaticResource.Resource))]
        public string MetaKeyword { get; set; }

        [StringLength(500)]
        [Display(Name = "Content_MetaDescription", ResourceType = typeof(StaticResource.Resource))]
        public string MetaDescription { get; set; }

        [Display(Name = "Content_Status", ResourceType = typeof(StaticResource.Resource))]
        public bool Status { get; set; }

        [StringLength(2)]
        public string LanguageID { get; set; }

        [Display(Name = "Content_ShowOnHome", ResourceType = typeof(StaticResource.Resource))]
        public bool ShowOnHome { get; set; }

        [Display(Name = "Content_ToHot", ResourceType = typeof(StaticResource.Resource))]
        public DateTime? ToHot { get; set; }

        public long? ViewCount { get; set; }

        [StringLength(250)]
        [Display(Name = "Content_Tags", ResourceType = typeof(StaticResource.Resource))]
        public string Tags { get; set; }
    }
}
