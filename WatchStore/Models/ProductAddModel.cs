using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class ProductAddModel
    {
        public int? CategoryID { get; set; }
        public string Name { get; set; }
        public Nullable<float> Price { get; set; }
        public string Desc { get; set; }
        public DateTime? Created_at { get; set; }
        public DateTime? Udated_at { get; set; }
        public string TagName { get; set; }
        public string Poster { get; set; }
        public List<ImageModel> Images { get; set; }
    }
}