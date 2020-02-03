using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WatchStore.Data;
using WatchStore.Models;

namespace WatchStore.Controllers
{
    [RoutePrefix("Category")]
    public class CategoryController : ApiController
    {
        private StoreEntities context = new StoreEntities();
        // [GET] Method api/Category/getAllCat
        [Route("All")]
        public IHttpActionResult GetAllCat()
        {
            var catsModel = new List<CategoryModel>();
            using (var context = new StoreEntities())
            {
                var cats = context.Categories.ToList();
                foreach(var c in cats)
                {
                    var cat = new CategoryModel
                    {
                        ID = c.ID,
                        CategorieIcon = c.CategorieIcon,
                        CategorieName = c.CategorieName
                    };
                    catsModel.Add(cat);

                }
            }
            return Ok(catsModel);
        }

        // [GET] Method api/Category/{id}
        [Route("{id:int}")]
        public IHttpActionResult GetCat(int id)
        {
            var prodlist = new List<ProductModel>();
            using (var context = new StoreEntities())
            {
               
                var prods = context.Products.Where(p => p.CategoryID == id).ToList();
                foreach (var p in prods)
                {
                    var prod = new ProductModel
                    {
                        ID = p.ID,

                        Name = p.Name,
                        Price = p.Price,
                        Desc = p.Desc,
                        Created_at = p.Created_at,
                        Udated_at = p.Udated_at,
                        TagName = p.TagName
                    };


                    prodlist.Add(prod);
                }

            }
            return Ok(prodlist);
        }

        public IHttpActionResult PostCat(Category category)
        {
            context.Categories.Add(category);
            context.SaveChanges();
            return Ok();
        }

        public IHttpActionResult PutCat(int id , Category category)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != category.ID)
            {
                return BadRequest();
            }

            context.Entry(category).State = EntityState.Modified;
            context.SaveChanges();
            return Ok();
        }

        public IHttpActionResult DeleteCat (int id)
        {
            var cat = context.Categories.Find(id);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cat.ID)
            {
                return BadRequest();
            }            
            var pByCat = context.Products.Where(p => p.CategoryID == id).ToList();
            var prC = new ProductController();
            
            foreach(var p in pByCat)
            {
                foreach(var r in p.Reviews)
                {                   
                    context.Reviews.Remove(r);                   
                }  
                prC.DeletePoste(p.ID);
            }

            context.Categories.Remove(cat);
            context.SaveChanges();
            return Ok();
        }
    }
}
