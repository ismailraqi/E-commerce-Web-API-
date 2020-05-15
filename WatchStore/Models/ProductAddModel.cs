using MultipartDataMediaFormatter.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class ProductAddModel
    {
        public int ID { get; set; }
        public string Poster { get; set; }
        public string Name { get; set; }
        public string Desc { get; set; }
        public int? CategoryID { get; set; }       
        public float? Price { get; set; }
        public DateTime? Created_at { get; set; }
        //public HttpFile Images { get; set; }


    }
}