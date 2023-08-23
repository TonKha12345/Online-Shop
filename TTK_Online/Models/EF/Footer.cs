namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Footer")]
    public partial class Footer
    {
        public long ID { get; set; }

        public string Content { get; set; }

        public bool? Status { get; set; }

        [StringLength(2)]
        public string LanguageID { get; set; }
    }
}
