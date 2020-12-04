using model.dao;
using model.entity;
using System.Collections.Generic;
using System.Web.Mvc;

namespace CuentaDeAhorros.Controllers
{
    public class CuentaAhorroController : Controller
    {
        private CuentaAhorroDao objetoCuentaAhorro;
        private static int idUP = 0;

        public CuentaAhorroController()
        {
            objetoCuentaAhorro = new CuentaAhorroDao();
        }

        // GET: CuentaAhorro
        public ActionResult Inicio(string nombre)
        {
            List<CuentaAhorro> lista = objetoCuentaAhorro.findAll();
            //objetoCuentaAhorro.Name = nombre;
            return View(lista);
        }
 

        [HttpGet]
        public ActionResult Find(int ID)
        {
            idUP = ID;
            CuentaAhorro objCuentaAhorro = new CuentaAhorro(ID);
            objetoCuentaAhorro.find(objCuentaAhorro);
            return View(objCuentaAhorro);
        }


        [HttpPost]
        public ActionResult Find(string ID)
        {
            return RedirectToAction("/" + ID);
        }

        [HttpGet]
        public ActionResult Update(int ID)
        {
            CuentaAhorro objCuentaAhorro = new CuentaAhorro(ID);
            objetoCuentaAhorro.find(objCuentaAhorro);
            return View(objCuentaAhorro);
        }

        [HttpPost]
        public ActionResult Update(CuentaAhorro objCuentaAhorro, int ID)
        {
            objCuentaAhorro.IdCuentaAhorro = ID;
            objetoCuentaAhorro.update(objCuentaAhorro);
            return RedirectToAction("Inicio");
        }

        public ActionResult Delete(CuentaAhorro objCuentaAhorro, int ID)
        {
            objCuentaAhorro.IdCuentaAhorro = ID;
            objetoCuentaAhorro.delete(objCuentaAhorro);
            return RedirectToAction("Inicio");
        }

        public ActionResult Usuarios(int ID)
        {
            List<Usuario> lista = objetoCuentaAhorro.findAllUsuarios(ID);
            return View(lista);
        }

       

   
    }
}
