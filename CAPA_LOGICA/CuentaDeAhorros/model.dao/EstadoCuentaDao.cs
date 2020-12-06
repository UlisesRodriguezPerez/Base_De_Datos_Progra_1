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
    public class EstadoCuentaDao
    {
        private Conexion objConexion;
        private SqlCommand comando;


        public EstadoCuentaDao()
        {
            objConexion = Conexion.saberEstado();
        }


        public void create(EstadoCuenta objetoEstado)
        {
            //try
            //{
            //    string create = "insert into Usuario(ID,Nombre,Password,EsAdministrador)values('" + objetoUsuario.IdUsuario + "','" + objetoUsuario.NombreUsuario + "','" + objetoUsuario.Password + "','" + objetoUsuario.TipoUsuario + "')";
            //    comando = new SqlCommand("SPInsertarUsuario", objConexion.getConexion());
            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.Parameters.AddWithValue("@Nombre", objetoUsuario.NombreUsuario);
            //    comando.Parameters.AddWithValue("@Password", objetoUsuario.Password);
            //    comando.Parameters.AddWithValue("@TipoUsuario", objetoUsuario.TipoUsuario);
            //    objConexion.getConexion().Open();
            //    comando.ExecuteNonQuery();

            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            //finally
            //{
            //    objConexion.getConexion().Close();
            //    objConexion.cerrarConexion();
            //}


        }


        public void delete(EstadoCuenta objetoEstado)
        {
            //try
            //{
            //    //string delete = "delete from Usuario where idUsuario='" + objetoUsuario.IdUsuario + "')";
            //    comando = new SqlCommand("SPEliminarUsuario", objConexion.getConexion());
            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.Parameters.AddWithValue("@ID", objetoUsuario.IdUsuario);
            //    objConexion.getConexion().Open();
            //    comando.ExecuteNonQuery();
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            //finally
            //{
            //    objConexion.getConexion().Close();
            //    objConexion.cerrarConexion();
            //}
        }


        public bool find(EstadoCuenta objetoEstado)
        {
            //bool hayRegistros;
            //try
            //{
            //    //string find = "Select * from Usuario where idUsuario='" + objetoUsuario.IdUsuario + "'";
            //    comando = new SqlCommand("SPBuscarUsuario", objConexion.getConexion());
            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.Parameters.AddWithValue("@ID", objetoUsuario.IdUsuario);
            //    objConexion.getConexion().Open();
            //    SqlDataReader read = comando.ExecuteReader();
            //    hayRegistros = read.Read();
            //    if (hayRegistros)
            //    {
            //        objetoUsuario.IdUsuario = Convert.ToInt32(read[0].ToString());
            //        objetoUsuario.NombreUsuario = read[1].ToString();
            //        objetoUsuario.Password = read[2].ToString();
            //        objetoUsuario.TipoUsuario = Convert.ToBoolean(read[3].ToString());
            //    }
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            //finally
            //{
            //    objConexion.getConexion().Close();
            //    objConexion.cerrarConexion();
            //}
            //return hayRegistros;
            return true;
        }


        public List<EstadoCuenta> findAll()
        {
            List<EstadoCuenta> listaEstadoCuenta = new List<EstadoCuenta>();

            //try
            //{
            //    //string findAll = "Select * from Usuario";
            //    comando = new SqlCommand("SPMostrarUsuarios", objConexion.getConexion())
            //    {
            //        CommandType = CommandType.StoredProcedure
            //    };
            //    objConexion.getConexion().Open();
            //    SqlDataReader read = comando.ExecuteReader();
            //    while (read.Read())
            //    {
            //        Usuario objetoUsuario = new Usuario
            //        {
            //            IdUsuario = Convert.ToInt32(read[0].ToString()),
            //            NombreUsuario = read[1].ToString(),
            //            Password = read[2].ToString(),
            //            TipoUsuario = Convert.ToBoolean(read[3].ToString())
            //        };
            //        listaUsuarios.Add(objetoUsuario);
            //    }
            //}

            //catch (Exception)
            //{
            //    throw;
            //}
            //finally
            //{
            //    objConexion.getConexion().Close();
            //    objConexion.cerrarConexion();
            //}
            return listaEstadoCuenta;
        }


        public void update(EstadoCuenta objetoEstado)
        {
            //try
            //{
            //    //string update = "update Usuario set Nombre='" + objetoUsuario.NombreUsuario + "',Password='" + objetoUsuario.Password + "',EsAdministrador='" + objetoUsuario.TipoUsuario + "' where idUsuario='" + objetoUsuario.IdUsuario + "')";
            //    comando = new SqlCommand("SPEditarUsuario", objConexion.getConexion());
            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.Parameters.AddWithValue("@id", objetoUsuario.IdUsuario);
            //    comando.Parameters.AddWithValue("@Nombre", objetoUsuario.NombreUsuario);
            //    comando.Parameters.AddWithValue("@Password", objetoUsuario.Password);
            //    comando.Parameters.AddWithValue("@TipoUsuario", objetoUsuario.TipoUsuario);
            //    objConexion.getConexion().Open();
            //    comando.ExecuteNonQuery();

            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            //finally
            //{
            //    objConexion.getConexion().Close();
            //    objConexion.cerrarConexion();
            //}

        }

        public List<EstadoCuenta> findLastStates(int id)
        {
            List<EstadoCuenta> listaEstados = new List<EstadoCuenta>();
            try
            {
                comando = new SqlCommand("SPObtenerEstadosCuenta", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdCuentaDeAhorro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    EstadoCuenta objetoEstado = new EstadoCuenta
                    {

                        IdEstado = Convert.ToInt32(read[0].ToString()),
                        IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
                        FechaInicio = Convert.ToDateTime(read[2].ToString()),
                        FechaFinal = Convert.ToDateTime(read[3].ToString()),
                        SaldoInicial = Convert.ToDecimal(read[4].ToString()),
                        SaldoFinal = Convert.ToDecimal(read[5].ToString()),
                        NumeroCuenta = read[6].ToString(),
                        RetirosCajeroHumano = Convert.ToInt32(read[7].ToString()),
                        RetirosCajeroAutomatico = Convert.ToInt32(read[8].ToString()),
                        SaldoMinimo = Convert.ToDecimal(read[9].ToString()),
                    };
                    listaEstados.Add(objetoEstado);
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
            return listaEstados;
        }



    }
}
