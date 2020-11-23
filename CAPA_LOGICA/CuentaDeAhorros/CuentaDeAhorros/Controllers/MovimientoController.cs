using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;
using model.neg;
using model.dao;


namespace CuentaDeAhorros.Controllers
{
    public class MovimientoController : Controller
    {


        private MovimientoDao objetoMovimiento;

        public MovimientoController()
        {
            objetoMovimiento = new MovimientoDao();
        }


        // GET: Movimiento
        [HttpGet]
        public ActionResult Inicio(int Id)
        {

            //Movimiento objMovimiento = new Movimiento();
            List<Movimiento> lista = objetoMovimiento.findMovimientos(Id);
            return View(lista);
        }
    }
}