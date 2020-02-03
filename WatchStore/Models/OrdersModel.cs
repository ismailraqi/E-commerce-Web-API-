using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WatchStore.Data;
namespace WatchStore.Models
{
    public class OrdersModel
    {
        public int ID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public List<Order_detail> Order_details { get; set; }

    }
}