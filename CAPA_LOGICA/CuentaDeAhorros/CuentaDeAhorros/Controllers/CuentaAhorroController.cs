using model.dao;
using model.entity;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MunicipalidadWebMVC5.Controllers
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

        //public ActionResult Beneficiarios(int ID)
        //{
        //    List<Beneficiario> lista = objetoCuentaAhorro.findAllBeneficiarios(ID);
        //    return View(lista);
        //}

        //public ActionResult CreateUsuario()
        //{
        //    List<Usuario> listaProp = objetoCuentaAhorro.createUsuario(idUP);
        //    return View(listaProp);
        //}

        //public ActionResult AgregarUsuario(int ID)
        //{
        //    objetoCuentaAhorro.createUsuario(ID, idUP);
        //    return RedirectToAction("Usuarios/" + idUP);
        //}

        //public ActionResult DeleteUsuario(int ID)
        //{
        //    objetoCuentaAhorro.deleteUsuario(ID);
        //    return RedirectToAction("Usuarios/" + idUP);
        //}

        //public ActionResult CreateBeneficiario()
        //{
        //    List<Beneficiario> listaProp = objetoCuentaAhorro.createBeneficiario(idUP);
        //    return View(listaProp);
        //}

        //public ActionResult AgregarBeneficiario(int ID)
        //{
        //    objetoCuentaAhorro.createBeneficiario(ID, idUP);
        //    return RedirectToAction("Beneficiarios/" + idUP);
        //}
        //public ActionResult DeleteBeneficiario(int ID)
        //{
        //    objetoCuentaAhorro.deleteBeneficiario(ID);
        //    return RedirectToAction("Beneficiarios/" + idUP);
        //}

        //public ActionResult BeneficiarioVsCuentaAhorroes()
        //{
        //    string valorIngresado = Request["valor"];
        //    List<Beneficiario> lista = objetoCuentaAhorro.findAllBeneficiariosIngresado(@valorIngresado);
        //    return View(lista);
        //}
        //public ActionResult UsuarioVsCuentaAhorro()
        //{
        //    string valorIngresado = Request["valor"];
        //    List<Usuario> lista = objetoCuentaAhorro.findAllUsuariosIngresado(@valorIngresado);
        //    return View(lista);
        //}
    }
}
