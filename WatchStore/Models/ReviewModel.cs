using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class ReviewModel
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ProductID { get; set; }
        public DateTime? Created_at { get; set; }
        public string Review_content { get; set; }
        public double? Note { get; set; }
    }
}