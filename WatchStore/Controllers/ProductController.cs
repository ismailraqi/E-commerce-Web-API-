using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using WatchStore.Data;
using WatchStore.Models;

namespace WatchStore.Controllers
{
    
    [RoutePrefix("Product")]
    public class ProductController : ApiController
    {
        
        private StoreEntities context = new StoreEntities();
        //[GET all Product METHOD] [api/Product]
        [Route("All")]
        public IHttpActionResult GetAll() {
            var pr = new List<ProductModel>();

                var product = context.Products.ToList();
                foreach(var p in product)
                {
                ProductModel m = new ProductModel
                {
                    ID = p.ID,
                    Poster = p.Poster,
                    CategoryID = p.CategoryID,
                    Name = p.Name,
                    Price = p.Price,
                    Desc = p.Desc,
                    Created_at = p.Created_at,
                    Udated_at =p.Udated_at,
                    TagName = p.TagName,                   
                };

                    pr.Add(m);
                    
                }
            
            return Ok(pr);

        }
        //[GET Product by id METHOD] [api/Product/id]
        [Route("{id:int}")]
        public IHttpActionResult GetProd(int id)

        {
                    var prod = new ProductModel();
                    var rviews = new List<ReviewModel>();
                    var mImgs = new List<ImageModel>();
                    var rv = context.Reviews.Where(r => r.ProductID == id).ToList();
                    var p = context.Products.Find(id);
                    var imgs = context.ProductImages.Where(i => i.ProductID == id).ToList();
                    if(p != null)
                    { 
                        prod.ID = p.ID;
                        prod.CategoryID = p.CategoryID;
                        prod.Name = p.Name;
                        prod.Price = p.Price;
                        prod.Desc = p.Desc;
                        prod.Created_at = p.Created_at;
                        prod.Udated_at = p.Udated_at;
                        prod.TagName = p.TagName;
                        foreach (var i in imgs)
                        {
                            var img = new ImageModel
                            {
                                Id = i.Id,
                                ImgUrl = i.imgUrl
                            };
                            mImgs.Add(img);
                }
                prod.Images = mImgs.ToList();
                foreach (var r in rv)
                {

                    var review = new ReviewModel
                    {
                        ID = r.ID,
                        ProductID = r.ProductID,
                        Created_at = r.Created_at,
                        Review_content = r.Review_content,
                        UserID = r.UserID,
                        Note = r.Note,
                        
                    };
                    //if (p.Reviews.Count > 0)
                    //{
                    //    review.Note = p.Reviews.Average(f => f.Note);
                    //}
                    //else
                    //{
                    //    review.Note = 0;
                    //}
                    rviews.Add(review);

                }
                prod.Reviews = rviews.ToList();
                if (rv.Count > 0)
                {
                    prod.Note = rv.Average(n => n.Note);
                }
                else
                {
                    prod.Note = 0;
                }
                
                return Ok(prod);
            }
            else
            {
                return NotFound();
            }
        }

        //[POST Product METHOD] [api/Product]

        //public IHttpActionResult PostProduct()
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }
        //    if (!Request.Content.IsMimeMultipartContent())
        //    {
        //        throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
        //    }
        //    var httpRequest = HttpContext.Current.Request;
        //    //Upload Image
        //    string imageName = null;
        //    //Upload Image
        //    var postedFile = httpRequest.Files["Image"];
        //    //Create custom filename
        //    imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray()).Replace(" ", "-");
        //    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
        //    var filePath = HttpContext.Current.Server.MapPath("~/Image/" + imageName);
        //    postedFile.SaveAs(filePath);
        //    //Save to DB
        //    //product.Poster = imageName;

        //    var pr = new Product
        //    {
        //        CategoryID = Convert.ToInt32(httpRequest["CategoryID"]),
        //        Name = httpRequest["Name"],
        //        Price = Convert.ToInt32(httpRequest["Price"]),
        //        Desc = httpRequest["Desc"],
        //        Created_at = new DateTime(),
        //        Poster = httpRequest["Poster"],
        //    };
        //    context.Products.Add(pr);
        //    context.SaveChanges();
        //    var pId = context.Products.Where(p => p.Name == httpRequest["Name"]).FirstOrDefault().ID;

        //    var img = new ProductImage
        //    {
        //        Id = 0,
        //        imgUrl = imageName,
        //        ProductID = pId
        //    };
        //    context.ProductImages.Add(img);
        //    context.SaveChanges();


        //    return Ok();
        //}
        [Route("Create")]
        public IHttpActionResult PostProduct([FromBody]Product product)
        {
            context.Products.Add(product);
            context.SaveChanges();
            //var pr = new ProductAddModel
            //{
            //    CategoryID = product.CategoryID,
            //    Name = product.Name,
            //    Price = product.Price,
            //    Desc = product.Desc,
            //    Created_at = new DateTime(),
            //    TagName=product.TagName,
            //    Poster=product.Poster,
            //};
            //context.Products.Add(pr);
            var prd = product.ProductImages.ToList();
            var pId = context.Products.Where(p => p.Name == product.Name).FirstOrDefault();
            foreach (var p in prd)
            {

                for (int i = 0; i >= product.ProductImages.Count(); i++)
                {
                    var img = new ProductImage
                    {
                        Id = 0,
                        imgUrl = p.imgUrl,
                        ProductID = pId.ID
                    };
                    context.ProductImages.Add(img);
                    context.SaveChanges();

                }
            }


            return Ok();
        }
        [Route("Edit/{id:int}")]

        public IHttpActionResult PutProduct(int id, [FromBody]Product p)
        {
            var prod = context.Products.Find(id);
            prod.CategoryID = p.CategoryID;
            prod.Name = p.Name;
            prod.Price = p.Price;
            prod.Desc = p.Desc;
            prod.Udated_at = new DateTime();
            prod.TagName = p.TagName;
            foreach (var img in p.ProductImages)
            {
                var ig = new ProductImage
                {
                    Id = 0,
                    imgUrl = img.imgUrl,
                    ProductID = p.ID
                };
                context.ProductImages.Add(img);

            }
            context.SaveChanges();
            return Ok();
        }
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPoste(int id, Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != product.ID)
            {
                return BadRequest();
            }

            context.Entry(product).State = EntityState.Modified;
            context.SaveChanges();
            foreach(var l in product.ProductImages)
            {
                ProductImagesController pdic = new ProductImagesController();

                pdic.PutProductImage(l.Id, l);
            }


            return StatusCode(HttpStatusCode.NoContent);
        }
        [HttpDelete]
        [Route("Delete/{id:int}")]

        public IHttpActionResult DeletePoste(int id)
        {
            var idp = context.Products.Find(id);
            if(idp == null)
            {
                return NotFound();
            }
            var img = context.ProductImages.Where(p => p.ProductID == id).ToList();
            foreach (var im in img)
            {
                context.ProductImages.Remove(im);
                context.SaveChanges();

            }
            //foreach ()
            //{

            //}
            context.Products.Remove(idp);
            context.SaveChanges();
            
           return Ok();
        }
    }
}
