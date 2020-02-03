using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class ImageModel
    {
        public int Id { get; set; }
        public string ImgUrl { get; set; }
        public Nullable<int> ProductID { get; set; }
    }
}