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
using facturacionApi.Models;

namespace facturacionApi.Controllers
{
    public class facturasController : ApiController
    {
        private facturacionEntities db = new facturacionEntities();

        // GET: api/facturas
        public IQueryable<factura> Getfacturas()
        {
            return db.facturas;
        }

        // GET: api/facturas/5
        [ResponseType(typeof(factura))]
        public IHttpActionResult Getfactura(int id)
        {
            factura factura = db.facturas.Find(id);
            if (factura == null)
            {
                return NotFound();
            }

            return Ok(factura);
        }

        // PUT: api/facturas/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putfactura(int id, factura factura)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != factura.num_factura)
            {
                return BadRequest();
            }

            db.Entry(factura).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!facturaExists(id))
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

        // POST: api/facturas
        [ResponseType(typeof(factura))]
        public IHttpActionResult Postfactura(factura factura)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.facturas.Add(factura);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = factura.num_factura }, factura);
        }

        // DELETE: api/facturas/5
        [ResponseType(typeof(factura))]
        public IHttpActionResult Deletefactura(int id)
        {
            factura factura = db.facturas.Find(id);
            if (factura == null)
            {
                return NotFound();
            }

            db.facturas.Remove(factura);
            db.SaveChanges();

            return Ok(factura);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool facturaExists(int id)
        {
            return db.facturas.Count(e => e.num_factura == id) > 0;
        }
    }
}