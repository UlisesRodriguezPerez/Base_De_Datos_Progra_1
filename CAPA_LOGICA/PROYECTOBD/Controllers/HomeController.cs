using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PROYECTOBD.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            /*View hace referencia a la vista correcpondiente a este action
             Index, .net entiende que debe retornar la vista index.cshtml*/
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "hola desde homecontroller";

            return View();
        }

        public ActionResult Contact()
        {
            /*Es convencion que el nombre de la funcion del actionresult 
            se llame igual que  su vista, de esta manera sabrá cuál es la 
            vista, pues todos los action retornar view, pero del nommbre depende
            a cual view se llame*/
            ViewBag.Message = "Your contact page. Desde homecontroller";
            
            // return View("Contact"); es una forma de decirle que view tiene que
            //abrir, en caso de que el metodo se llame distinton
            return View();
        }
    }
}