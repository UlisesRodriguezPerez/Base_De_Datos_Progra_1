using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using model.entity;

namespace model.dao
{
    public class CuentaObjetivoDao : TemplateCRUD<CuentaObjetivo>
    {

        private Conexion objConexion;
        private SqlCommand comando;


        public CuentaObjetivoDao()
        {
            objConexion = Conexion.saberEstado();
        }

        public void create(CuentaObjetivo objetoCuentaObjetivo)
        {

        }


        public void delete(CuentaObjetivo objetoCuentaObjetivo)
        {

        }

        public bool find(CuentaObjetivo objetoCuentaObjetivo)
        {
            return true;
        }
        public List<CuentaObjetivo> findAll()
        {
            List<CuentaObjetivo> listaCuentaObjetivos = new List<CuentaObjetivo>();
            return listaCuentaObjetivos;
        }

        public void update(CuentaObjetivo objetoCuentaObjetivo)
        {

        }

    }
}
