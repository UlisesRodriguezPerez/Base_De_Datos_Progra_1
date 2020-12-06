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
    public class BeneficiarioController : Controller
    {
        private static int idB = 0;
        private BeneficiarioDao objetoBeneficiario;
       // private TipoParentezcoDao objetoTipoParentezco;
        private CuentaAhorroDao objetoCuentaAhorro;
        // GET: Beneficiarios

        public BeneficiarioController()
        {
            objetoBeneficiario = new BeneficiarioDao();
        }

        [HttpGet]
        public ActionResult Inicio(int Id)
        {
            List<Beneficiario> lista = objetoBeneficiario.findAllbeneficiariosPorCuenta(Id);
            return View(lista);
        }


        [HttpPost]
        public ActionResult Regresar(Beneficiario beneficiario)
        {

            string indice = objetoBeneficiario.findIdCA(beneficiario);
            return RedirectToAction("/Menu/MenuNormal/" + indice);
        }

        // GET: Beneficiarios/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }


        public List<SelectListItem> obtenerListado()
        {

            var listado = new List<SelectListItem>()
              {
                new SelectListItem { Text = "Padre", Value = "1", Selected=true},
                new SelectListItem { Text = "Madre", Value = "2"},
                new SelectListItem { Text = "Hijo", Value = "3"},
                new SelectListItem { Text = "Hija", Value = "4"},
                new SelectListItem { Text = "Hermano", Value = "5"},
                new SelectListItem { Text = "Hermana", Value = "6"},
                new SelectListItem { Text = "amigo", Value = "7"},
                new SelectListItem { Text = "amiga", Value = "8"}

              };
            return listado;
        }
        // GET: Beneficiarios/Create
        [HttpGet]
        public ActionResult Create()
        {
            //Beneficiario objBeneficiario = new Beneficiario();
            //objetoBeneficiario.find(objBeneficiario);
            ////Pasarle el listado de selectItems a la vista
            //ViewBag.Tipos = obtenerListado();  

            //Traerlo de la base
            //List<TipoParentezco> listaP = objetoTipoParentezco.getTiposParentezco();
            //List<SelectListItem> items = new List<SelectListItem>();
            //foreach (var i in listaP)
            //{
            //    items.Add(new SelectListItem()
            //    {
            //        Text = i.Nombre,
            //        Value = Convert.ToString((i.Id))
            //    });
            //}
            //ViewBag.Tipos = items;

            return View();
          
        }

        [HttpPost]
        public ActionResult Create(Beneficiario beneficiario)
        {
            /**
             * Recibe el beneficiario que va a crear
             */
            try{

                objetoBeneficiario.create(beneficiario);
                int numeroCuenta = beneficiario.NumeroCuenta;
                string id = objetoBeneficiario.findIdCA(beneficiario);
                return RedirectToAction("Inicio/" + id);
                
                
            }
            catch{
                ViewBag.ErrorMessage = "Error al crear el beneficiario, para ver el error consulta la tabla de manejo de errores en la Base de datos";
                //Console.WriteLine("No se pudo agregar");
                return View();
            }
        }

        // GET: Beneficiarios/Edit/5
        [HttpGet]
        public ActionResult Update(int id)
        {
            Beneficiario objBeneficiario = new Beneficiario(id);
            objetoBeneficiario.find(objBeneficiario);
            return View(objBeneficiario);
        }

        // POST: Beneficiarios/Edit/5
        [HttpPost]
        public ActionResult Update(Beneficiario objBeneficiario, int ID)
        {
            try
            {

                objBeneficiario.IdBeneficiario = ID;
                objetoBeneficiario.update(objBeneficiario);
                //objetoBeneficiario.updatePersona(objBeneficiario);
                string id = objetoBeneficiario.findIdCuenta(objBeneficiario);
                return RedirectToAction("Inicio/"+id);
            }
            catch
            {
                ViewBag.ErrorMessage = "Error al actualizar el beneficiario, para ver el error consulta la tabla de manejo de errores en la Base de datos";
                return View();
            }
        }

        // GET: Beneficiarios/Delete/5
        
        public ActionResult Delete(Beneficiario objBeneficiario, int ID)
        {
            objBeneficiario.IdBeneficiario = ID;
            objetoBeneficiario.delete(objBeneficiario);
            string id = objetoBeneficiario.findIdCuenta(objBeneficiario);
            return RedirectToAction("Inicio/"+id);

        }

        [HttpGet]
        public ActionResult Find(int Id)
        {
            idB = Id;
            Beneficiario objBeneficiario = new Beneficiario(Id);
            objetoBeneficiario.find(objBeneficiario);
            return View(objBeneficiario);
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

        [HttpPost]
        public ActionResult VerifyPorcentaje(int porcent)
        {
            int porcentaje = Convert.ToInt32(porcent);
            if (porcentaje == 100) {
                return RedirectToAction("/Inicio/");
            }
            
            else
            {
                return RedirectToAction("/Inicio/");
            }
        }
    }
}
