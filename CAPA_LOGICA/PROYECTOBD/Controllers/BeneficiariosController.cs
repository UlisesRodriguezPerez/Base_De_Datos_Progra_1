using PROYECTOBD.Context;
using PROYECTOBD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PROYECTOBD.Controllers
{
    public class BeneficiariosController : Controller
    {

        Context_Conecction dbContext = new Context_Conecction();

        // GET: Beneficiarios
        public ActionResult Index()
        {
            return View();
        }

        // GET: Beneficiarios/Details/5
        public ActionResult Details(int? id)  
        {
            if (id <=0) return HttpNotFound();
            Beneficiario beneficiario = dbContext.GetBeneficiario(id);
            if (beneficiario == null) {
                return HttpNotFound();
            }
            return View(beneficiario);
        }

        // GET: Beneficiarios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Beneficiarios/Create
        [HttpPost]
        public ActionResult Create([Bind] Beneficiario beneficiario)
        {
            try
            {
                if (ModelState.IsValid) {
                    dbContext.crearBeneficiario(beneficiario);
                    return RedirectToAction("Index");
                }
                return View(beneficiario);
                
            }
            catch
            {
                return View();
            }
        }

        // GET: Beneficiarios/Edit/5
        public ActionResult Edit(int id)
        {
            //Este es el editar q
            return View();
        }

        // POST: Beneficiarios/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Beneficiarios/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Beneficiarios/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
