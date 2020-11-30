using System.Collections.Generic;
using System.Web.Mvc;
using model.entity;
using model.dao;
using System;


namespace MunicipalidadWebMVC5.Controllers
{
    public class MenuController : Controller
    {
        private UsuarioDao objetoUsuario;
        public MenuController()
        {
            objetoUsuario = new UsuarioDao();
        }
        // GET: Menu
        [HttpGet]
        public ActionResult Inicio()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Verify(Usuario usuario)
        {
            
            string tipo = objetoUsuario.verificar(usuario);
            //System.Diagnostics.Debug.WriteLine(tipo);
            if (tipo == "Admin")
            {
                return RedirectToAction("/MenuAdmin/" + usuario.IdUsuario);
            }
            else if (tipo == "Normal")
            {
                //user = new Usuario();
                return RedirectToAction("/MenuNormal/" + usuario.IdUsuario);
            }
            else
            {
                usuario = new Usuario();
                return RedirectToAction("/Inicio/");
            }
        }
        [HttpGet]
        public ActionResult MenuAdmin()
        {
            //Usuario usuario = new Usuario(ID);
            //objetoUsuario.find(usuario);
            return View();
        }

        [HttpGet]
        public ActionResult MenuNormal(int Id) //int Id
        {
            List<CuentaAhorro> lista = objetoUsuario.findAllCuentaAhorro(Id);
            Usuario user = new Usuario(Id);
            string username = user.NombreUsuario;
            return View(lista);  //lista
        }
        [HttpPost]
        public ActionResult MenuNormal(Usuario user, int ID)
        {
            try
            {

                user.IdUsuario = ID;

                return RedirectToAction("Menu/MenuNormal/" + ID);
            }
            catch
            {
                return View();
            }
        }


        [HttpPost]
        public ActionResult Regresar(string idUsuario)
        {
            return RedirectToAction("/Inicio/"+ idUsuario); 
        }






        //[HttpPost]
        //public ActionResult BuscarComprar(Usuario usuario)
        //{
        //    List<Usuario> listaCompras = objetoUsuario.buscarCompra(usuario);
        //    //string tipo = objetoUsuario.buscarCompra(usuario);
        //    //System.Diagnostics.Debug.WriteLine(tipo);
        //    if (tipo == "Admin")
        //    {
        //        return RedirectToAction("/MenuAdmin/" + usuario.IdUsuario);
        //    }
        //    else if (tipo == "Normal")
        //    {
        //        //user = new Usuario();
        //        return RedirectToAction("/MenuNormal/" + usuario.IdUsuario);
        //    }
        //    else
        //    {
        //        usuario = new Usuario();
        //        return RedirectToAction("/Inicio/");
        //    }
        //}
    }
}