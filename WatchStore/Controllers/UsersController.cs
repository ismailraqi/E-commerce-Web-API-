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
    public class UsersController : ApiController
    {
        private StoreEntities db = new StoreEntities();
        // GET: api/Users
        public IHttpActionResult GetAllUsers()
        {
            var userM = new List<UsersModel>();
            var user = db.Users.ToList();
            
            
            foreach (var u in user)
            {
                var us = new UsersModel();
                us.ID = u.ID;
                //us.RolesID = u.RolesID;
                us.LoginStatus = u.LoginStatus;
                us.FirstName = u.FirstName;
                us.LastName = u.LastName;
                //us.Email = u.Email;
                us.Phone = u.Phone;
                //us.Username = u.Username;
                us.Sexe = u.Sexe;
                //us.Password = u.Password;
                us.AccountAdress = u.AccountAdress;
                us.ShippingAdress = u.ShippingAdress;
                userM.Add(us);
            }
            return Ok(userM);
        }

        // GET: api/Users/5
        [ResponseType(typeof(User))]
        public IHttpActionResult GetUser(int id)
        {
            var user = db.Users.Find(id);
            var userM = new UsersModel();
            
            if (user == null)
            {
                return NotFound();
            }
            else
            {
                userM.ID = user.ID;
                //userM.RolesID = user.RolesID;
                userM.LoginStatus = user.LoginStatus;
                userM.FirstName = user.FirstName;
                userM.LastName = user.LastName;
                //userM.Email = user.Email;
                userM.Phone = user.Phone;
                //userM.Username = user.Username;
                userM.Sexe = user.Sexe;
                //userM.Password = user.Password;
                userM.AccountAdress = user.AccountAdress;
                userM.ShippingAdress = user.ShippingAdress;

            }

            return Ok(userM);
        }

        // PUT: api/Users/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUser(int id, User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user.ID)
            {
                return BadRequest();
            }

            db.Entry(user).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Users
        [ResponseType(typeof(User))]
        public IHttpActionResult PostUser(User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Users.Add(user);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = user.ID }, user);
        }

        // DELETE: api/Users/5
        [ResponseType(typeof(User))]
        public IHttpActionResult DeleteUser(int id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return NotFound();
            }

            db.Users.Remove(user);
            db.SaveChanges();

            return Ok(user);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserExists(int id)
        {
            return db.Users.Count(e => e.ID == id) > 0;
        }
    }
}