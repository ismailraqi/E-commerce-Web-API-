using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Models
{
    public class UsersModel
    {
        public int ID { get; set; }
        public string LoginStatus { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }       
        public string Phone { get; set; }
        public string Sexe { get; set; }       
        public string AccountAdress { get; set; }
        public string ShippingAdress { get; set; }
    }
}