//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class article_table
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public article_table()
        {
            this.comment_table = new HashSet<comment_table>();
        }
    
        public int article_id { get; set; }
        public string article_body { get; set; }
        public Nullable<int> admin_id { get; set; }
        public Nullable<int> cat_id { get; set; }
        public string article_heading { get; set; }
    
        public virtual admin_table admin_table { get; set; }
        public virtual category_table category_table { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<comment_table> comment_table { get; set; }
    }
}