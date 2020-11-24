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
            string existePersona;
            try
            {
                comando = new SqlCommand("CREAR SP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                //comando.Parameters.AddWithValue("@pIdTipoParentezco",objCuentaObjetivo.IdTipoParentezco);
                comando.Parameters.AddWithValue("@pParentezco", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pDocumentoIdentidadPersona", objCuentaObjetivo);
                //comando.Parameters.AddWithValue("@pIdPersona", objCuentaObjetivo.IdPersona);
                comando.Parameters.AddWithValue("@pNumeroCuentaAhorro", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pPorcentaje ", objCuentaObjetivo);
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
                comando = new SqlCommand("CREAR SP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objCuentaObjetivo.IdCuentaObjetivo);
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
                comando = new SqlCommand("CREAR SP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@Id", objCuentaObjetivo.IdCuentaObjetivo);
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                hayRegistros = read.Read();
                if (hayRegistros)
                {
                    //objCuentaObjetivo.IdBeneficiario = Convert.ToInt32(read[0].ToString());
                    //objCuentaObjetivo.IdPersona = Convert.ToInt32(read[1].ToString());
                    //objCuentaObjetivo.IdTipoParentezco = Convert.ToInt32(read[2].ToString());
                    //objCuentaObjetivo.IdCuenta = Convert.ToInt32(read[3].ToString());
                    //objCuentaObjetivo.Porcentaje = Convert.ToInt32(read[4].ToString());
                    //objCuentaObjetivo.Nombre = read[5].ToString();
                    //objCuentaObjetivo.Parentezco = read[6].ToString();
                    //objCuentaObjetivo.NumeroCuenta = Convert.ToInt32(read[7].ToString());
                    //objCuentaObjetivo.FechaNacimiento = Convert.ToDateTime(read[8].ToString());
                    //objCuentaObjetivo.Telefono1 = read[9].ToString();
                    //objCuentaObjetivo.Telefono2 = read[10].ToString();
                    //objCuentaObjetivo.CorreoElectronico = read[11].ToString();
                    //objCuentaObjetivo.ValorDocumentoId = read[12].ToString();

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
                comando = new SqlCommand("CREAR SP", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdBeneficiario", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pIdPersona", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pParentezco", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pIdCuenta", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pPorcentaje", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pNombre", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pValorDocumentoIdentidad", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pFechaNacimiento", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pTelefono1", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pTelefono2", objCuentaObjetivo);
                comando.Parameters.AddWithValue("@pCorreoElectronico", objCuentaObjetivo);
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



    }
}
