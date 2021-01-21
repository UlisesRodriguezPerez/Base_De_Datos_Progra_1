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
    public class MovimientoCOIDao
    {
        private Conexion objConexion;
        private SqlCommand comando;


        public MovimientoCOIDao()
        {
            objConexion = Conexion.saberEstado();
        }
        public List<MovimientoCOI> buscarMoviminetosCOIAdmin(int id)
        {
            List<MovimientoCOI> listaMovimientosCOI = new List<MovimientoCOI>();
            try
            {
                comando = new SqlCommand("SPObtenerMovimientosCOIAdmin", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdCuentaObjetivo", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    MovimientoCOI objetoMovimientoCOI = new MovimientoCOI
                    {

                        IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
                        IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
                        NumeroCuentaObjetivo = Convert.ToInt32(read[2].ToString()),
                        Fecha = Convert.ToDateTime(read[3].ToString()),
                        Monto = Convert.ToDecimal(read[4].ToString()),
                        NuevoMonto = Convert.ToDecimal(read[5].ToString()),
                        Descripcion = read[6].ToString(),
                        NumeroCuentaAhorro = read[7].ToString(),
                        EsProcesada = Convert.ToBoolean(read[8].ToString()),

                    };
                    listaMovimientosCOI.Add(objetoMovimientoCOI);
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
            return listaMovimientosCOI;
        }

        public List<MovimientoCOI> buscarMoviminetosCOI(int id)
        {
            List<MovimientoCOI> listaMovimientosCOI = new List<MovimientoCOI>();
            try
            {
                comando = new SqlCommand("SPObtenerMovimientosCOI", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdCuentaObjetivo", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    MovimientoCOI objetoMovimientoCOI = new MovimientoCOI
                    {

                        IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
                        IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
                        NumeroCuentaObjetivo = Convert.ToInt32(read[2].ToString()),
                        Fecha = Convert.ToDateTime(read[3].ToString()),
                        Monto = Convert.ToDecimal(read[4].ToString()),
                        NuevoMonto = Convert.ToDecimal(read[5].ToString()),
                        Descripcion = read[6].ToString(),
                        NumeroCuentaAhorro = read[7].ToString(),
                        EsProcesada = Convert.ToBoolean(read[8].ToString()),

                    };
                    listaMovimientosCOI.Add(objetoMovimientoCOI);
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
            return listaMovimientosCOI;
        }
    }
}


