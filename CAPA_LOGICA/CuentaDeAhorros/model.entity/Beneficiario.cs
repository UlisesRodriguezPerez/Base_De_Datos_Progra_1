using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace model.entity
{

    public class Beneficiario
    {
        private int idBeneficiario;
        private int idTipoParentezco;
        private int idPersona;
        private int porcentaje;
        private int idCuenta;
        private string nombre;
        private string parentezco;
        private int numeroCuenta;
        private Boolean activo;

        public Beneficiario() { }
        public Beneficiario(int pIdBeneficiario)
        {
            this.idBeneficiario = pIdBeneficiario;
        }
        public Beneficiario(int idTipoParentezco, int idPersona, int idCuenta, int porcentaje,Boolean pActivo,string pNombre,string pParentezco,int pNumeroCuenta)
        {
            
            this.idTipoParentezco = idTipoParentezco;
            this.idPersona = idPersona;
            this.idCuenta = idCuenta;
            this.porcentaje = porcentaje;
            this.Activo = pActivo;
            this.nombre = pNombre;
            this.parentezco = pParentezco;
            this.numeroCuenta = pNumeroCuenta;
            
        }


        public int IdBeneficiario { get => idBeneficiario; set => idBeneficiario = value; }
        public int IdTipoParentezco { get => idTipoParentezco; set => idTipoParentezco = value; }
        public int IdPersona { get => idPersona; set => idPersona = value; }
        public int Porcentaje { get => porcentaje; set => porcentaje = value; }
        public int IdCuenta { get => idCuenta; set => idCuenta = value; }
        public bool Activo { get => activo; set => activo = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Parentezco { get => parentezco; set => parentezco = value; }
        public int NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }
    }
}
