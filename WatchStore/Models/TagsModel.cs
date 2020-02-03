using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class TagsModel
    {
        public int ID { get; set; }
        public string TagName { get; set; }
        public int ProductId { get; set; }
    }
}