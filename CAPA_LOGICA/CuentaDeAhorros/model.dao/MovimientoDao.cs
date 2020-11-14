using model.entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.dao
{
    class MovimientoDao
    {
        private Conexion objConexion;
        private SqlCommand comando;


        public MovimientoDao()
        {
            objConexion = Conexion.saberEstado();
        }

        public void create(Movimiento objetoMovimiento)
        {

        }


        public void delete(Movimiento objetoMovimiento)
        {

        }


        public bool find(Movimiento objetoMovimiento)
        {
            return true;
        }


        public List<EstadoCuenta> findAll()
        {
            List<EstadoCuenta> listaEstadoCuenta = new List<EstadoCuenta>();

           
            return listaEstadoCuenta;
        }


        public void update(Movimiento objetoMovimiento)
        {

        }

    }
}
