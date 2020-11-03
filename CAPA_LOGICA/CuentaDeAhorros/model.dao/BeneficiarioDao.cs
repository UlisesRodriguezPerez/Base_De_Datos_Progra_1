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
    public class BeneficiarioDao : TemplateCRUD<Beneficiario>
    {

        //Atributos de la clase
        private Conexion objConexion;
        private SqlCommand comando;

        public BeneficiarioDao()
        {
            objConexion = Conexion.saberEstado();
        }

        public void create(Beneficiario beneficiario)
        {
            try
            {
                comando = new SqlCommand("SPInsertarBeneficiario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdTipoParentezco", beneficiario.IdTipoParentezco);
                comando.Parameters.AddWithValue("@pIdPersona", beneficiario.IdPersona);
                comando.Parameters.AddWithValue("@pIdDeBeneficiario", beneficiario.IdCuenta);
                comando.Parameters.AddWithValue("@pPorcentaje ", beneficiario.Porcentaje);

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

        public void delete(Beneficiario beneficiario)
        {
            try
            {
                comando = new SqlCommand("SPEliminarLogicoBeneficiario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdPersona", beneficiario.IdPersona);
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

        public bool find(Beneficiario beneficiario)
        {

            //bool hayRegistros;
            //try
            //{
            //    comando = new SqlCommand("CREARSP", objConexion.getConexion());
            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.Parameters.AddWithValue("@Id", objetoBeneficiario.IdBeneficiario);
            //    objConexion.getConexion().Open();
            //    SqlDataReader read = comando.ExecuteReader();
            //    hayRegistros = read.Read();
            //    if (hayRegistros)
            //    {
            //        beneficiario = Convert.ToInt32(read[0].ToString());
            //        beneficiario = Convert.ToInt32(read[1].ToString());
            //        beneficiario = Convert.ToDecimal(read[2].ToString());
            //        beneficiario = read[3].ToString();
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

        public List<Beneficiario> findAll()
        {
            List<Beneficiario> listaBeneficiarioes = new List<Beneficiario>();
            
            try
            {
                comando = new SqlCommand("CREARSP", objConexion.getConexion())
                {
                    CommandType = CommandType.StoredProcedure
                };
                objConexion.getConexion().Open();
                SqlDataReader read = comando.ExecuteReader();
                while (read.Read())
                {
                    Beneficiario objetoBeneficiario = new Beneficiario
                    {
                        IdBeneficiario = Convert.ToInt32(read[0].ToString()),
                        IdPersona = Convert.ToInt32(read[1].ToString()),
                        IdTipoParentezco = Convert.ToInt32(read[2].ToString()),
                        IdCuenta = Convert.ToInt32(read[3].ToString()),
                    };
                    listaBeneficiarioes.Add(objetoBeneficiario);
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
            return listaBeneficiarioes;
        }


        public void update(Beneficiario beneficiario)
        {
            try
            {
                comando = new SqlCommand("SPActualizarBeneficiario", objConexion.getConexion());
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@pIdPersona", beneficiario.IdPersona);
                comando.Parameters.AddWithValue("@pIdTipoParentezco", beneficiario.IdTipoParentezco);
                comando.Parameters.AddWithValue("@pPorcentaje", beneficiario.Porcentaje);
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



