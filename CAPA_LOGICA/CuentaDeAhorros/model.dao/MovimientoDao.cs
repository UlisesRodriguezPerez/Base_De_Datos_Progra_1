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
    public class MovimientoDao:TemplateCRUD<Movimiento>
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
        public List<Movimiento> findAll()
        {
            List<Movimiento> listaMovimientos = new List<Movimiento>();
            return listaMovimientos;
        }

        public List<Movimiento> findMovimientos(int id)
        {
            List<Movimiento> listaMovimientos = new List<Movimiento>();

            try
            {
                //string findAll = "Select * from Movimiento";
                comando = new SqlCommand("SPObtenerMovimientosEstadoCuenta", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                //comando.Parameters.AddWithValue("@idCuentaAhorro",objeMovimiento.IdCuentaAhorro );
                comando.Parameters.AddWithValue("@idEstadoCuenta", id);
                //comando.Parameters.AddWithValue("@fechaInicio", objeMovimiento.f);

                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();

                while (read.Read())
                {
                    Movimiento objMovimiento = new Movimiento
                    {
                        Monto = Convert.ToDecimal(read[0].ToString()),
                        Fecha = Convert.ToDateTime(read[1].ToString()),
                        Descripcion = read[2].ToString(),
                        //NuevoSaldo = Convert.ToDecimal(read[3].ToString()),
                        TipoMovimiento = read[3].ToString(),
                        IdCuentaAhorro = Convert.ToInt32(read[4].ToString()),
                        IdEstadoCuenta = Convert.ToInt32(read[5].ToString())
                    };
                    listaMovimientos.Add(objMovimiento);
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

            return listaMovimientos;
        }

        public List<Movimiento> findCompras(string descripcionBuscar, string categoria, string idUsuario)
        {
            List<Movimiento> listaMovimientosCompra = new List<Movimiento>();

            try
            {
                //string findAll = "Select * from Movimiento";
                comando = new SqlCommand("SPObtenerMovimientosDescripcion", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("@pDescripcion", descripcionBuscar);
                comando.Parameters.AddWithValue("@pCategoria", categoria);
                comando.Parameters.AddWithValue("@pIdUsuarioPA", Convert.ToInt32(idUsuario));

                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();

                while (read.Read())
                {
                    Movimiento objMovimiento = new Movimiento
                    {
                        Monto = Convert.ToDecimal(read[0].ToString()),
                        Fecha = Convert.ToDateTime(read[1].ToString()),
                        Descripcion = read[2].ToString(),
                        //NuevoSaldo = Convert.ToDecimal(read[3].ToString()),
                        TipoMovimiento = read[3].ToString(),
                        IdCuentaAhorro = Convert.ToInt32(read[4].ToString()),
                        IdEstadoCuenta = Convert.ToInt32(read[5].ToString()),
                        NumeroCuenta = Convert.ToInt32(read[6].ToString()),
                    };
                    listaMovimientosCompra.Add(objMovimiento);
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

            return listaMovimientosCompra;
        }


        public void update(Movimiento objetoMovimiento)
        {

        }

    }
}
