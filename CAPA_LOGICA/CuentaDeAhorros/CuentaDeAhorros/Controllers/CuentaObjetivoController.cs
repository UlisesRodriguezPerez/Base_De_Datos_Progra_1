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


        private CuentaObjetivoDao objetoCuentaObjetivo;

        public CuentaObjetivoController()
        {
            objetoCuentaObjetivo = new CuentaObjetivoDao();
        }
        // GET: CuentaObjetivo
        public ActionResult Inicio(int Id)
        {
            List<CuentaObjetivo> lista = objetoCuentaObjetivo.findCuentasObjetivosPorCuenta(Id);
            return View(lista);
            
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(CuentaObjetivo objCuentaObjetivo)
        {
            /**
             * Recibe el cuentaObjetivo que va a crear
             */
            try
            {

                objetoCuentaObjetivo.create(objCuentaObjetivo);
                int numeroCuenta = objCuentaObjetivo.NumeroCuenta;
                string id = objetoCuentaObjetivo.findIdCA(objCuentaObjetivo);
                return RedirectToAction("Inicio/"+id);


            }
            catch
            {
                Console.WriteLine("No se pudo agregar");
                return View();
            }
        }

        // GET: CuentaObjetivo/Edit/5
        [HttpGet]
        public ActionResult Update(int id)
        {
            CuentaObjetivo objCuentaObjetivo = new CuentaObjetivo(id);
            objetoCuentaObjetivo.find(objCuentaObjetivo);
            return View(objCuentaObjetivo);
        }

        // POST: Beneficiarios/Edit/5
        [HttpPost]
        public ActionResult Update(CuentaObjetivo objCuentaObjetivo, int ID)
        {
            try
            {

                objCuentaObjetivo.IdCuentaObjetivo = ID;
                objetoCuentaObjetivo.update(objCuentaObjetivo);
                string id = objetoCuentaObjetivo.findIdCuenta(objCuentaObjetivo);
                return RedirectToAction("Inicio/"+id );
            }
            catch
            {
                return View();
            }
        }

        // GET: Beneficiarios/Delete/5
        
        public ActionResult Delete(CuentaObjetivo objCuentaObjetivo, int ID)
        {
            objCuentaObjetivo.IdCuentaObjetivo = ID;
            string id = objetoCuentaObjetivo.findIdCuenta(objCuentaObjetivo);
            objetoCuentaObjetivo.delete(objCuentaObjetivo);
            
            return RedirectToAction("Inicio/"+id);

        }

        [HttpGet]
        public ActionResult Find(int Id)
        {
            
            CuentaObjetivo objCuentaObjetivo = new CuentaObjetivo(Id);
            objetoCuentaObjetivo.find(objCuentaObjetivo);
            return View(objCuentaObjetivo);
        }

        [HttpPost]
        public ActionResult Find(string ID)
        {
            return RedirectToAction("Inicio" + ID);
        }

        [HttpPost]
        public ActionResult FindAll(string ID)
        {
            return RedirectToAction("Inicio" + ID);
        }


    }
}