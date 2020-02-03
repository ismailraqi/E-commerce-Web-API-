using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WatchStore.Data;

namespace WatchStore.Models
{
    public class Order_detail
    {
        public int ID { get; set; }
        public int Quantity { get; set; }
        public string StatusOrder { get; set; }
        public float TotalPrice { get; set; }
        public float SubTotalPrice { get; set; }
        public Nullable<int> ProductID { get; set; }
        public Nullable<int> OrderID { get; set; }
    
    }
}