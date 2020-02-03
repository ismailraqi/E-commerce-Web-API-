using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class CategoryModel
    {
        public int ID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public string CategorieName { get; set; }
        public string CategorieIcon { get; set; }
    }
}