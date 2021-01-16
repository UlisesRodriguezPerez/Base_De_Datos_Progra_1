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
        public List<MovimientoCo> buscarMoviminetosCO(int id)
        {
            List<MovimientoCo> listaMovimientosCO = new List<MovimientoCo>();
            try
            {
                comando = new SqlCommand("SPCREAR", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdCuentaObjetivo", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    MovimientoCo objetoEstado = new MovimientoCo
                    {

                        IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
                        IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
                        Fecha = Convert.ToDateTime(read[2].ToString()),
                        Monto = Convert.ToDecimal(read[3].ToString()),
                        NuevoMonto = Convert.ToDecimal(read[4].ToString()),
                        Descripcion = read[5].ToString(),
                        NumeroCuenta = read[6].ToString(),

                    };
                    listaMovimientosCO.Add(objetoEstado);
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
            return listaMovimientosCO;
        }
    }
}


