//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WatchStore.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Discount_Product
    {
        public int Id { get; set; }
        public int DiscountID { get; set; }
        public int ProductID { get; set; }
    
        public virtual Discount Discount { get; set; }
        public virtual Product Product { get; set; }
    }
}
