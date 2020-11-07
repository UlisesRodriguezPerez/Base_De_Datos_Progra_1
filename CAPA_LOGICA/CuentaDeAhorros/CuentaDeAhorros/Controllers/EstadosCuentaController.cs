using model.dao;
using System.Collections.Generic;
using System.Web.Mvc;
using model.entity;

namespace CuentaDeAhorros.Controllers
{
    public class EstadosCuentaController : Controller
    {

           
        private static int idEC = 0;
        private EstadoCuentaDao objetoEstados;

        public EstadosCuentaController()
        {
            objetoEstados = new EstadoCuentaDao();
        }

        [HttpGet]
        public ActionResult Inicio(int Id)
        {
            List<EstadoCuenta> lista = objetoEstados.findLastStates(Id);
            return View(lista);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        //[HttpPost]
        //public ActionResult Create(Usuario objUsuario)
        //{
        //    objetoUsuario.create(objUsuario);
        //    return RedirectToAction("Inicio");
        //}

        //[HttpGet]
        //public ActionResult Find(int ID)
        //{
        //    idUs = ID;
        //    Usuario objusuario = new Usuario(ID);
        //    objetoUsuario.find(objusuario);
        //    return View(objusuario);
        //}

        //[HttpPost]
        //public ActionResult Find(string ID)
        //{
        //    return RedirectToAction("Inicio" + ID);
        //}

        //[HttpGet]
        //public ActionResult Update(int ID)
        //{
        //    Usuario objusuario = new Usuario(ID);
        //    objetoUsuario.find(objusuario);
        //    return View(objusuario);
        //}

        //[HttpPost]
        //public ActionResult Update(Usuario objusuario, int ID)
        //{
        //    objusuario.IdUsuario = ID;
        //    objetoUsuario.update(objusuario);
        //    return RedirectToAction("Inicio");
        //}

        //public ActionResult Delete(Usuario objUsuario, int ID)
        //{
        //    objUsuario.IdUsuario = ID;
        //    objetoUsuario.delete(objUsuario);
        //    return RedirectToAction("Inicio");
        //}




    }
}