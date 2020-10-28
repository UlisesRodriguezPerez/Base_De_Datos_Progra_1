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
                return RedirectToAction("/MenuNormal/");
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
        public ActionResult MenuNormal() //int ID
        {
            //List<Propiedad> lista = objetoUsuario.findAllPropiedades(ID);
            //Usuario user = new Usuario(ID);
            //string username = user.NombreUsuario;
            return View();  //lista
        }


    }
}