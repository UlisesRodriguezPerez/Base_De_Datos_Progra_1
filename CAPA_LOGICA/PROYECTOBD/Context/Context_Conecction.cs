using DocumentFormat.OpenXml.Drawing.Diagrams;
using MongoDB.Driver.Core.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using PROYECTOBD.Models;

namespace PROYECTOBD.Context
{
    public class Context_Conecction
    {

        readonly string connectionString = "Data Source=amazon-server.cgalpjkz55ag.us-east-1.rds.amazonaws.com;Initial Catalog=BD_TP1_Cuenta_De_Ahorros;Persist Security Info=True;User ID=UlisesRodriguez;Password=BaseAWS2020";

        public IEnumerable<Beneficiario> GetBeneficiario()
        {
            var beneficiarioList = new List<Beneficiario>();
            //Esto para generar la conexion
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                //Obtener el SP que se va a usar 
                SqlCommand com = new SqlCommand("SPObtenerBeneficiario", connection);
                com.CommandType = CommandType.StoredProcedure;
                connection.Open();

                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    var beneficiario = new Beneficiario();
                    beneficiario.IdTipoParentezco = Convert.ToInt32(dr["IdTipoParentezco"].ToString());
                    beneficiario.IdPersona = Convert.ToInt32(dr["IdPersona"].ToString());
                    beneficiario.IdDeCuentaAhorro = Convert.ToInt32(dr["IdDeCuentaAhorro"].ToString());
                    beneficiario.Porcentaje = Convert.ToInt32(dr["Porcentaje"].ToString());

                    beneficiarioList.Add(beneficiario);
                }
                //Siempre hay que cerrar la conexion
                connection.Close();
            }

            return beneficiarioList;


        }


        public void crearBeneficiario(Beneficiario beneficiario)
        {
            using (SqlConnection connection = new SqlConnection(this.connectionString))
            {
                SqlCommand com = new SqlCommand("SPInsertarBeneficiario", connection);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@pIdTipoParentezco",beneficiario.IdTipoParentezco);
                com.Parameters.AddWithValue("@pIdPersona", beneficiario.IdPersona);
                com.Parameters.AddWithValue("@pIdDeCuentaAhorro", beneficiario.IdDeCuentaAhorro);
                com.Parameters.AddWithValue("@pPorcentaje", beneficiario.Porcentaje);

                connection.Open();
                com.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
        

}