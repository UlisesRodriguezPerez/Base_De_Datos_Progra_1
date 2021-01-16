using model.dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;

namespace CuentaDeAhorros.Controllers
{
    public class MovimientoCoController : Controller
    {


        private static int idEC = 0;
        private MovimientoCoDao objetoMovimientoCo;

        public MovimientoCoController()
        {
            objetoMovimientoCo = new MovimientoCoDao();
        }

        [HttpGet]
        public ActionResult Inicio(int Id)
        {
            List<EstadoCuenta> lista = objetoMovimientoCo.findLastStates(Id);
            return View(lista);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
    }
}