using model.entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.dao
{
    public class PersonaDao //: TemplateCRUD<Persona>  SE QUITÓ POR AHORA.
    {
        private Conexion objConexion;
        private SqlCommand comando;
        private static int IDPJ = 0;


        public PersonaDao()
        {

            objConexion = Conexion.saberEstado();
        }

        public bool find(Persona objPersona)
        {
            bool hayRegistros;
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objPersona.IdPersona);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    objPersona.IdPersona = Convert.ToInt32(read[0].ToString());
                    objPersona.Nombre = read[1].ToString();
                    objPersona.TipoDocumento = Convert.ToInt32(read[2].ToString());
                    objPersona.ValorDocumentoId = read[3].ToString();
                    objPersona.EstadoError = 99;
                }
                else
                {
                    objPersona.EstadoError = 1;
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

        public List<Persona> findAll()
        {
            List<Persona> listaPersonas = new List<Persona>();

            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Persona objetoPersona = new Persona
                    {
                        IdPersona = Convert.ToInt32(read[0].ToString()),
                        Nombre = read[1].ToString(),
                        TipoDocumento = Convert.ToInt32(read[2].ToString()),
                        ValorDocumentoId = read[3].ToString()
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

        public List<CuentaAhorro> findAllCuentaAhorro(int ID)

        {
            List<CuentaAhorro> listaPersonas = new List<CuentaAhorro>();
            List<int> listaid = new List<int>();
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", ID);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    CuentaAhorro objetoCuentaAhorro = new CuentaAhorro
                    {
                        IdCuentaAhorro = Convert.ToInt32(read[0].ToString()),
                        NumeroCuenta = Convert.ToInt32(read[1].ToString()),
                        Saldo = Convert.ToDecimal(read[2].ToString()),
                        FechaCreacion = read[3].ToString(),
                    };
                    listaPersonas.Add(objetoCuentaAhorro);
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

        

        public void deleteCuentaAhorro(int ID)
        {
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", ID);
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

        public List<CuentaAhorro> createCuentaAhorro(int id)
        {
            List<CuentaAhorro> listaCuentaAhorroes = new List<CuentaAhorro>();
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    CuentaAhorro objetoCuentaAhorro = new CuentaAhorro
                    {
                        IdCuentaAhorro = Convert.ToInt32(read[0].ToString()),
                        NumeroCuenta = Convert.ToInt32(read[1].ToString()),
                        Saldo = Convert.ToDecimal(read[2].ToString()),
                        FechaCreacion = read[3].ToString(),
                    };
                    listaCuentaAhorroes.Add(objetoCuentaAhorro);
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
            return listaCuentaAhorroes;
        }

        public void createCuentaAhorro(int idPersona, int idCuentaAhorro)   //Faltan parametros.
        {
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@IdPersona", idPersona);
                comando.Parameters.AddWithValue("@IdCuentaAhorro", idCuentaAhorro);

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
            return;
        }

        public void create(Persona objeto)
        {
            throw new NotImplementedException();
        }

        public void update(Persona objeto)
        {
            throw new NotImplementedException();
        }

        public void delete(Persona objeto)
        {
            throw new NotImplementedException();
        }
    }
}
