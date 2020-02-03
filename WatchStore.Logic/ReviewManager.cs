using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WatchStore.Data;

namespace WatchStore.Logic
{
    public class ReviewManager
    {
        
        public bool VerifyReviewByIds (int userId, int productId)
        {
            using(var context = new StoreEntities())
            {
                var rvById = context.Reviews.Where(r => r.UserID == userId && r.ProductID == productId).First();
                if(rvById != null)
                {
                    return true;
                }
            }
            return false;
        }
     
    }
}

