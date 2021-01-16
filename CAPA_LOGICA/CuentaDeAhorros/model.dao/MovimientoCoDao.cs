using model.entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.dao
{
    public class MovimientoCoDao
    {
        private Conexion objConexion;
        private SqlCommand comando;


        public MovimientoCoDao()
        {
            objConexion = Conexion.saberEstado();
        }
    }
}