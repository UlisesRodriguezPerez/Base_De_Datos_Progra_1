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

        public void create(CuentaObjetivo objCuentaObjetivo)
        {
            try
            {
                comando = new SqlCommand("SPCrearCuentaObjetivo", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                
                comando.Parameters.AddWithValue("@pNumeroCuentaAhorro", objCuentaObjetivo.NumeroCuenta);
                comando.Parameters.AddWithValue("@pObjetivo", objCuentaObjetivo.Objetivo);
                comando.Parameters.AddWithValue("@pNumeroCuentaObjetivo", objCuentaObjetivo.NumeroCuentaObjetivo);
                comando.Parameters.AddWithValue("@pSaldo", objCuentaObjetivo.Saldo);
                comando.Parameters.AddWithValue("@pFechaFinal", objCuentaObjetivo.FechaFinal);
                comando.Parameters.AddWithValue("@pDiaDeAhorro", objCuentaObjetivo.DiaDeAhorro);
                comando.Parameters.AddWithValue("@pMontoMensual", objCuentaObjetivo.MontoMensual);
                //comando.Parameters.AddWithValue("@pInteresAcumulado ", objCuentaObjetivo.InteresAcumulado);
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
            //return existePersona;
        }

        public void delete(CuentaObjetivo objCuentaObjetivo)
        {
            try
            {
                comando = new SqlCommand("SPEliminarCuentaObjetivoLog", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdCuentaObjetivo", objCuentaObjetivo.IdCuentaObjetivo);
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

        public bool find(CuentaObjetivo objCuentaObjetivo)
        {
            bool hayRegistros;
            try
            {
                comando = new SqlCommand("SPObtenerCuentaObjetivo", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objCuentaObjetivo.IdCuentaObjetivo);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
      
                    objCuentaObjetivo.IdCuentaObjetivo = Convert.ToInt32(read[0].ToString());
                    objCuentaObjetivo.IdCuentaAhorro = Convert.ToInt32(read[1].ToString());
                    objCuentaObjetivo.FechaInicio = Convert.ToDateTime(read[2].ToString());
                    objCuentaObjetivo.Objetivo = read[3].ToString();
                    objCuentaObjetivo.Saldo = Convert.ToDecimal(read[4].ToString());
                    objCuentaObjetivo.FechaFinal = Convert.ToDateTime(read[5].ToString());
                    //objCuentaObjetivo.InteresAcumulado = Convert.ToDecimal(read[5].ToString());
                    objCuentaObjetivo.NumeroCuenta = Convert.ToInt32(read[6].ToString());
                    objCuentaObjetivo.DiaDeAhorro = Convert.ToInt32(read[7].ToString());
                    objCuentaObjetivo.NumeroCuentaObjetivo = Convert.ToInt32(read[8].ToString());
                    objCuentaObjetivo.MontoMensual = Convert.ToDecimal(read[9].ToString());

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

        public bool findAdmin(CuentaObjetivo objCuentaObjetivo)
        {
            bool hayRegistros;
            try
            {
                comando = new SqlCommand("SPObtenerCuentaObjetivoAdmin", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objCuentaObjetivo.IdCuentaObjetivo);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {

                    objCuentaObjetivo.IdCuentaObjetivo = Convert.ToInt32(read[0].ToString());
                    objCuentaObjetivo.IdCuentaAhorro = Convert.ToInt32(read[1].ToString());
                    objCuentaObjetivo.FechaInicio = Convert.ToDateTime(read[2].ToString());
                    objCuentaObjetivo.Objetivo = read[3].ToString();
                    objCuentaObjetivo.Saldo = Convert.ToDecimal(read[4].ToString());
                    objCuentaObjetivo.FechaFinal = Convert.ToDateTime(read[5].ToString());
                    //objCuentaObjetivo.InteresAcumulado = Convert.ToDecimal(read[5].ToString());
                    objCuentaObjetivo.NumeroCuenta = Convert.ToInt32(read[6].ToString());
                    objCuentaObjetivo.DiaDeAhorro = Convert.ToInt32(read[7].ToString());
                    objCuentaObjetivo.NumeroCuentaObjetivo = Convert.ToInt32(read[8].ToString());
                    objCuentaObjetivo.MontoMensual = Convert.ToDecimal(read[9].ToString());
                    objCuentaObjetivo.CantidadDepositosRealizados = Convert.ToInt32(read[10].ToString());
                    objCuentaObjetivo.CantidadDepositosNetos = Convert.ToInt32(read[11].ToString());
                    objCuentaObjetivo.MontoAhorrado = Convert.ToDecimal(read[9].ToString());
                    objCuentaObjetivo.MontoEsperado = Convert.ToDecimal(read[9].ToString());

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

        public List<CuentaObjetivo> findAll()
        {
            List<CuentaObjetivo> listaCuentaObjetivo = new List<CuentaObjetivo>();
            return listaCuentaObjetivo;
        }

        public void update(CuentaObjetivo objCuentaObjetivo)
        {
            try
            {
                comando = new SqlCommand("SPActualizarCuentaObjetivo", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdCuentaObjetivo", objCuentaObjetivo.IdCuentaObjetivo);
                comando.Parameters.AddWithValue("@pNumeroCuentaAhorro", objCuentaObjetivo.NumeroCuenta);
                comando.Parameters.AddWithValue("@pObjetivo", objCuentaObjetivo.Objetivo);
                comando.Parameters.AddWithValue("@pSaldo", objCuentaObjetivo.Saldo);
                comando.Parameters.AddWithValue("@pFechaFinal", objCuentaObjetivo.FechaFinal);
                comando.Parameters.AddWithValue("@pDiaDeAhorro", objCuentaObjetivo.DiaDeAhorro);
                comando.Parameters.AddWithValue("@pMontoMensual", objCuentaObjetivo.MontoMensual);

                //comando.Parameters.AddWithValue("@pInteresAcumulado ", objCuentaObjetivo.InteresAcumulado);
                //comando.Parameters.AddWithValue("@pInteresAcumulado", objCuentaObjetivo.InteresAcumulado);

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

        public List<CuentaObjetivo> findCuentasObjetivosPorCuenta(int id)
        {
            List<CuentaObjetivo> listaCuentaObjetivo = new List<CuentaObjetivo>();

            try
            {
                comando = new SqlCommand("SPObtenerCuentasObjetivoPorCA", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idCuentaAhorro", id);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {

                    CuentaObjetivo objetoCuentaObjetivo = new CuentaObjetivo
                    {
                        IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
                        IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
                        FechaInicio = Convert.ToDateTime(read[2].ToString()),
                        //FechaFinal = Convert.ToDateTime(read[3].ToString()),
                        Objetivo = read[3].ToString(),
                        Saldo = Convert.ToDecimal(read[4].ToString()),
                        //InteresAcumulado = Convert.ToDecimal(read[5].ToString()),
                        FechaFinal = Convert.ToDateTime(read[5].ToString()),
                        
                        NumeroCuenta = Convert.ToInt32(read[6].ToString()),
                        DiaDeAhorro = Convert.ToInt32(read[7].ToString()),
                        NumeroCuentaObjetivo = Convert.ToInt32(read[8].ToString()),
                        MontoMensual = Convert.ToDecimal(read[9].ToString()),
                    };
                    listaCuentaObjetivo.Add(objetoCuentaObjetivo);
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
            return listaCuentaObjetivo;
        }

        public string findIdCA(CuentaObjetivo objCuentaObjetivo)
        {
            string indice;
            try
            {
                comando = new SqlCommand("SPFindIdCA", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pNumeroCuentaDeAhorro", objCuentaObjetivo.NumeroCuenta);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                read.Read();
                indice = read[0].ToString();
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
            return indice;
        }

        public string findIdCuenta(CuentaObjetivo objCuentaObjetivo)
        {
            string indice;
            try
            {
                comando = new SqlCommand("SPObtenerIdCuentaObjetivo", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objCuentaObjetivo.IdCuentaObjetivo);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                read.Read();
                indice = read[0].ToString();
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
            return indice;


        }

    }
}
