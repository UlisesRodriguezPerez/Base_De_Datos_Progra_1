using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class TipoParentezco
    {
        private int id;
        private string nombre;

        public TipoParentezco(int id, string nombre)
        {
            this.nombre = nombre;
            this.id = id;
            
        }
        public TipoParentezco(){}


        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}
