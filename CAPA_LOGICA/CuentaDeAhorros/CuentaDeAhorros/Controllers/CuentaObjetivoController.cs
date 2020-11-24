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
        public ActionResult Inicio()
        {
            return View();
        }

        public ActionResult Create()
        {
            CuentaObjetivo objCuentaObjetivo = new CuentaObjetivo();
            objetoCuentaObjetivo.find(objCuentaObjetivo);
            //Pasarle el listado de selectItems a la vista




            return View(objCuentaObjetivo);

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
                //int numeroCuenta = objCuentaObjetivo.NumeroCuenta;
                //string id = objetoCuentaObjetivo.findIdCA(objCuentaObjetivo);
                return RedirectToAction("Inicio/");


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
                //objetoCuentaObjetivo.updatePersona(objCuentaObjetivo);
                //string id = objetoCuentaObjetivo.findIdCuenta(objCuentaObjetivo);
                return RedirectToAction("Inicio/" );
            }
            catch
            {
                return View();
            }
        }

        // GET: Beneficiarios/Delete/5

        public ActionResult Delete(CuentaObjetivo objCuentaObjetivo, int ID)
        {
            //objCuentaObjetivo.IdBeneficiario = ID;
            objetoCuentaObjetivo.delete(objCuentaObjetivo);
            //string id = objetoCuentaObjetivo.findIdCuenta(objCuentaObjetivo);
            return RedirectToAction("Inicio/");

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