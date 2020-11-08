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
    public class TipoParentezcoDao
    {

        //Atributos de la clase
        private Conexion objConexion;
        private SqlCommand comando;

        public TipoParentezcoDao()
        {
            objConexion = Conexion.saberEstado();
        }

        public List<TipoParentezco> getTiposParentezco()
        {
            List<TipoParentezco> listaParentezco = new List<TipoParentezco>();

            try
            {
                comando = new SqlCommand("SPObtenerTiposParentezco", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    TipoParentezco objTipoParentezco = new TipoParentezco {
                       
                        Nombre = read[1].ToString(),
                        Id = Convert.ToInt32(read[0].ToString()),
                    };
                    listaParentezco.Add(objTipoParentezco);
                }
            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                objConexion.getConexion().Close();
                objConexion.cerrarConexion();
            }
            return listaParentezco;
        }


    }
}
