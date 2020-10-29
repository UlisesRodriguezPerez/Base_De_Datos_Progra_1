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

        // POST: Beneficiarios/Create
        [HttpPost]
        public ActionResult Create(Beneficiario objBeneficiario)
        {
            try
            {
                
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Beneficiarios/Edit/5
        public ActionResult Edit(int id)
        {
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
