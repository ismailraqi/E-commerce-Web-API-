using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WatchStore.Data;
using WatchStore.Models;

namespace WatchStore.Controllers
{
    public class OrdersController : ApiController
    {
        private StoreEntities db = new StoreEntities();

        //GET: api/Orders
        public IHttpActionResult GetAll()
        {

            var orderL = new List<OrdersModel>();
            var or = db.Orders.ToList();
            
            foreach (var o in or)
            {

                var orderD = new List<Order_detail>();
                var orM = new OrdersModel();
                orM.ID = o.ID;
                orM.Date = o.Date;
                orderL.Add(orM);
                var ord = db.Order_details.Where(od => od.OrderID == orM.ID).ToList();
                foreach (var od in ord)
                {
                    var orDM = new Order_detail
                    {
                        ID = od.ID,
                        Quantity = od.Quantity,
                        StatusOrder = od.StatusOrder,
                        TotalPrice = od.TotalPrice,
                        SubTotalPrice = od.SubTotalPrice,
                        ProductID = od.ProductID,
                        OrderID = od.OrderID
                    };
                    orderD.Add(orDM);
                }
                orM.Order_details = orderD.ToList();
            }

            db.SaveChanges();
            return Ok(orderL);
        }

        // GET: api/Orders/5


        [ResponseType(typeof(Order))]
        public IHttpActionResult GetOrder(int id)
        {
            var order = new OrdersModel();
            var ordsD = new List<Order_detail>();
            var orderById = db.Orders.Find(id);
            var odById = db.Order_details.Where(od => od.OrderID == id);
            
            if (orderById == null)
            {
                return NotFound();
            }
            else
            {
                order.ID = orderById.ID;
                order.Date = orderById.Date;
                foreach (var od in odById)
                {
                    var ordD = new Order_detail
                    {
                        ID = od.ID,
                        Quantity = od.Quantity,
                        StatusOrder = od.StatusOrder,
                        TotalPrice = od.TotalPrice,
                        SubTotalPrice = od.SubTotalPrice,
                        ProductID = od.ProductID,
                        OrderID = od.OrderID
                    };
                    ordsD.Add(ordD);
                }
                order.Order_details = ordsD.ToList();
                db.SaveChanges();
            }

            return Ok(order);
        }

        // PUT: api/Orders/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutOrder(int id, Order order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != order.ID)
            {
                return BadRequest();
            }

            db.Entry(order).State = EntityState.Modified;            
            foreach(var od in order.Order_details)
            {
                var ordDet = new OrderDetailsController();
                ordDet.PutOrder_details(od.ID, od);
            }
            db.SaveChanges();

            //try
            //{
            //    db.SaveChanges();
            //}
            //catch (DbUpdateConcurrencyException)
            //{
            //    if (!OrderExists(id))
            //    {
            //        return NotFound();
            //    }
            //    else
            //    {
            //        throw;
            //    }
            //}

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Orders
        [ResponseType(typeof(Order))]
        public IHttpActionResult PostOrder(Order order)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Orders.Add(order);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = order.ID }, order);
        }

        // DELETE: api/Orders/5
        [ResponseType(typeof(Order))]
        public IHttpActionResult DeleteOrder(int id)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return NotFound();
            }

            db.Orders.Remove(order);
            db.SaveChanges();

            return Ok(order);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool OrderExists(int id)
        {
            return db.Orders.Count(e => e.ID == id) > 0;
        }
    }
}