using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;
using model.neg;
using model.dao;
using System.Diagnostics;


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

        [HttpPost]
        public ActionResult BuscarCompra(string say,string categoria, string nombreUsuario, string idUsuario)
        {
            
            Response.Write("<script>console.log('" + say + "');</script>");
            Response.Write("<script>console.log('" + categoria + "');</script>");
            Response.Write("<script>console.log('" + nombreUsuario + "');</script>");
            Response.Write("<script>console.log('" + idUsuario + "');</script>");
            List<Movimiento> lista = objetoMovimiento.findCompras(say,categoria,idUsuario);
            return View(lista);

        }
    }
}