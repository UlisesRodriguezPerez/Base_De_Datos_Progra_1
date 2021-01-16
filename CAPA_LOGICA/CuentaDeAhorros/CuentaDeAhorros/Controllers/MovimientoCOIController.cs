using model.dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;

namespace CuentaDeAhorros.Controllers
{
    public class MovimientoCOIController : Controller
    {


        private static int idEC = 0;
        private MovimientoCOIDao objetoMovimientoCOI;

        public MovimientoCOIController()
        {
            objetoMovimientoCOI = new MovimientoCOIDao();
        }

        [HttpGet]
        public ActionResult Inicio(int Id)
        {
            List<MovimientoCOI> lista = objetoMovimientoCOI.buscarMoviminetosCOI(Id);
            return View(lista);
        }

        //[HttpGet]
        //public ActionResult Create()
        //{
        //    return View();
        //}
    }
}