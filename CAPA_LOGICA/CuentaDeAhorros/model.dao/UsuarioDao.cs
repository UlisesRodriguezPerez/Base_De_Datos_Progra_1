using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using model.entity;

namespace model.dao
{
    public class UsuarioDao:TemplateCRUD<Usuario>   
    {
        private Conexion objConexion;
        private SqlCommand comando;
        //private string ip;
        //private static string host;


        public UsuarioDao()
        {
            //obtenerIP();
            objConexion = Conexion.saberEstado();
        }



        public void create(Usuario objetoUsuario)
        {
            try
            {
                //string create = "insert into Usuario(ID,Nombre,Password,EsAdministrador)values('" + objetoUsuario.IdUsuario + "','" + objetoUsuario.NombreUsuario + "','" + objetoUsuario.Password + "','" + objetoUsuario.TipoUsuario + "')";
                comando = new SqlCommand("SPInsertarUsuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Nombre", objetoUsuario.NombreUsuario);
                comando.Parameters.AddWithValue("@Password", objetoUsuario.Password);
                comando.Parameters.AddWithValue("@TipoUsuario", objetoUsuario.TipoUsuario);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
                
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
            

        }


        public void delete(Usuario objetoUsuario)
        {
            try
            {
                //string delete = "delete from Usuario where idUsuario='" + objetoUsuario.IdUsuario + "')";
                comando = new SqlCommand("SPEliminarUsuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", objetoUsuario.IdUsuario);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
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
        }

        public string verificar(Usuario usuario)
        {
            
            string result;
            try
            {
                
                comando = new SqlCommand("SPValidarUsuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                
                comando.Parameters.AddWithValue("@Nombre", usuario.NombreUsuario);
                comando.Parameters.AddWithValue("@Password", usuario.Password);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
                SqlDataReader read = comando.ExecuteReader();
                bool hayRegistros = read.Read();
                if (hayRegistros)
                {
                    usuario.IdUsuario = Convert.ToInt32(read[0].ToString());
                    usuario.NombreUsuario = read[1].ToString();
                    usuario.Password = read[2].ToString();
                    usuario.TipoUsuario = Convert.ToBoolean(read[3].ToString());
                    if (usuario.TipoUsuario == true)
                    {
                        result = "Admin";
                    }

                    else
                    {
                        result = "Normal";
                    }
                    
                }
                else
                {
                    result = "";
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
            
            return result;
        }
        public bool find(Usuario objetoUsuario)
        {
            bool hayRegistros;
            try
            {
                //string find = "Select * from Usuario where idUsuario='" + objetoUsuario.IdUsuario + "'";
                comando = new SqlCommand("SPBuscarUsuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID", objetoUsuario.IdUsuario);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoUsuario.IdUsuario = Convert.ToInt32(read[0].ToString());
                    objetoUsuario.NombreUsuario = read[1].ToString();
                    objetoUsuario.Password = read[2].ToString();
                    objetoUsuario.TipoUsuario = Convert.ToBoolean(read[3].ToString());
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
            return hayRegistros;
        }


        public List<Usuario> findAll()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();

            try
            {
                //string findAll = "Select * from Usuario";
                comando = new SqlCommand("SPMostrarUsuarios", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Usuario objetoUsuario = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(read[0].ToString()),
                        NombreUsuario = read[1].ToString(),
                        Password = read[2].ToString(),
                        TipoUsuario = Convert.ToBoolean(read[3].ToString())
                    };
                    listaUsuarios.Add(objetoUsuario);
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
            return listaUsuarios;
        }


        public void update(Usuario objetoUsuario)
        {
            try
            {
                //string update = "update Usuario set Nombre='" + objetoUsuario.NombreUsuario + "',Password='" + objetoUsuario.Password + "',EsAdministrador='" + objetoUsuario.TipoUsuario + "' where idUsuario='" + objetoUsuario.IdUsuario + "')";
                comando = new SqlCommand("SPEditarUsuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@id", objetoUsuario.IdUsuario);
                comando.Parameters.AddWithValue("@Nombre", objetoUsuario.NombreUsuario);
                comando.Parameters.AddWithValue("@Password", objetoUsuario.Password);
                comando.Parameters.AddWithValue("@TipoUsuario", objetoUsuario.TipoUsuario);
                objConexion.getConexion().Open();
                comando.ExecuteNonQuery();
                
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
        }
        public List<CuentaAhorro> findAllCuentaAhorro(int id)
        {
            List<CuentaAhorro> listaCuentaAhorro = new List<CuentaAhorro>();
            List<int> listaid = new List<int>();
            try
            {
                comando = new SqlCommand("SPMostrarCuentasUsuario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    CuentaAhorro objetoCuentaAhorro = new CuentaAhorro
                    {
                        IdCuentaAhorro = Convert.ToInt32(read[0].ToString()),
                        IdTipoCuneta = Convert.ToInt32(read[1].ToString()),
                        IdPersona = Convert.ToInt32(read[2].ToString()),
                        NumeroCuenta = Convert.ToInt32(read[3].ToString()),
                        Saldo = Convert.ToDecimal(read[4].ToString()),
                        FechaCreacion = read[5].ToString(),
                    };
                    listaCuentaAhorro.Add(objetoCuentaAhorro);
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
            return listaCuentaAhorro;
        }
    }

    
}
