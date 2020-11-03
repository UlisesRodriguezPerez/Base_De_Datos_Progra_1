using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using model.entity;

namespace model.dao
{
    public class CuentaAhorroDao : TemplateCRUD<CuentaAhorro>
    {
        private Conexion objConexion;
        private SqlCommand comando;

        private static string host;

        public CuentaAhorroDao()
        {
            objConexion = Conexion.saberEstado();
        }



        public void create(CuentaAhorro objetoCuentaAhorro)
        {
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@NumeroDeCuenta", objetoCuentaAhorro.NumeroCuenta);
                comando.Parameters.AddWithValue("@Saldo", objetoCuentaAhorro.Saldo);
                comando.Parameters.AddWithValue("@fechaCreacion", objetoCuentaAhorro.FechaCreacion);
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

        public void delete(CuentaAhorro objetoCuentaAhorro)
        {
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objetoCuentaAhorro.IdCuentaAhorro);
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

        public bool find(CuentaAhorro objetoCuentaAhorro)
        {
            bool hayRegistros;
            try
            {
                comando = new SqlCommand("SPBuscarCuentaAhorro", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objetoCuentaAhorro.IdCuentaAhorro);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objetoCuentaAhorro.IdCuentaAhorro = Convert.ToInt32(read[0].ToString());
                    objetoCuentaAhorro.NumeroCuenta = Convert.ToInt32(read[1].ToString());
                    objetoCuentaAhorro.Saldo = Convert.ToDecimal(read[2].ToString());
                    objetoCuentaAhorro.FechaCreacion = read[3].ToString();
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

        public List<CuentaAhorro> findAll()
        {
            List<CuentaAhorro> listaCuentaAhorro = new List<CuentaAhorro>();

            try
            {
                comando = new SqlCommand("SPMostrarCuentas", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    CuentaAhorro objetoCuentaAhorro = new CuentaAhorro
                    {
                        IdCuentaAhorro = Convert.ToInt32(read[0].ToString()),
                        IdTipoCuneta = Convert.ToInt32(read[1].ToString()),
                        IdPersona = Convert.ToInt32(read[2].ToString()),
                        NumeroCuenta = Convert.ToInt32(read[1].ToString()),
                        Saldo = Convert.ToDecimal(read[2].ToString()),
                        FechaCreacion = read[3].ToString(),
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


        public void update(CuentaAhorro objetoCuentaAhorro)
        {
            try
            {
                comando = new SqlCommand("CERARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objetoCuentaAhorro.IdCuentaAhorro);
                comando.Parameters.AddWithValue("@NumeroDeCuenta", objetoCuentaAhorro.NumeroCuenta);
                comando.Parameters.AddWithValue("@Saldo", objetoCuentaAhorro.Saldo);
                comando.Parameters.AddWithValue("@FechaCreacion", objetoCuentaAhorro.FechaCreacion);
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

        public List<Usuario> findAllUsuarios(int id)
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Usuario objetoUsuario = new Usuario
                    {
                        IdUsuario = Convert.ToInt32(read[0].ToString()),
                        NombreUsuario = read[1].ToString(),
                        Password = read[2].ToString(),
                        TipoUsuario = Convert.ToBoolean(read[3].ToString()),
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

        public List<Persona> findAllPersonas(int id)
        {
            List<Persona> listaPersonas = new List<Persona>();
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Persona objetoPersona = new Persona
                    {
                        IdPersona = Convert.ToInt32(read[0].ToString()),
                        Nombre = read[1].ToString(),
                        TipoDocumento = Convert.ToInt32(read[2].ToString()),
                        ValorDocumentoId = read[3].ToString(),
                    };
                    listaPersonas.Add(objetoPersona);
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
            return listaPersonas;
        }

       

        public string Name { get => host; set => host = value; }
    }
}
