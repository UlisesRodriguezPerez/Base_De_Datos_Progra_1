using model.dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using model.entity;
namespace CuentaDeAhorros.Controllers
{
    public class CuentaObjetivoController : Controller
    {


        private static int idEC = 0;
        private CuentaObjetivoDao objetoEstados;

        public CuentaObjetivoController()
        {
            objetoEstados = new CuentaObjetivoDao();
        }
        // GET: CuentaObjetivo
        public ActionResult Inicio()
        {
            return View();
        }
    }
}