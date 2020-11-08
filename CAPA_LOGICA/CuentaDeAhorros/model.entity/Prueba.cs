using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Prueba
    {
        private int idprueba;


        public Prueba(int id)
        {
            this.idprueba = id;
        }
        public Prueba() { }


        public int IdPrueba { get => idprueba; set => idprueba = value; }
       
    }
}
