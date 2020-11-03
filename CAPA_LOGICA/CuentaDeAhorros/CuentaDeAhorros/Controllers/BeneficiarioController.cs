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
        // GET: Beneficiarios

        public BeneficiarioController()
        {
            objetoBeneficiario = new BeneficiarioDao();
        }
        public ActionResult Index()
        {
            return View();
        }

        // GET: Beneficiarios/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Beneficiarios/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Beneficiario beneficiario)
        {
            try
            {
                objetoBeneficiario.create(beneficiario);
                return RedirectToAction("Inicio");
            }
            catch
            {
                return View();
            }
        }

        // GET: Beneficiarios/Edit/5
        public ActionResult Update(int id)
        {
            return View();
        }

        // POST: Beneficiarios/Edit/5
        [HttpPost]
        public ActionResult Update(int id, FormCollection collection)
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
    }
}
