using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace model.entity
{

    public class Beneficiario : Persona
    {
        private int idBeneficiario;
        private int idTipoParentezco;
        private int porcentaje;
        private int idCuenta;
        private string parentezco;
        private int numeroCuenta;
        private Boolean activo;


        public Beneficiario() { }
        public Beneficiario(int pIdBeneficiario)
        {
            this.idBeneficiario = pIdBeneficiario;
        }
        public Beneficiario(int idTipoParentezco, int idPersona, int idCuenta, int porcentaje,Boolean pActivo,string pNombre,string pParentezco,int pNumeroCuenta,int pTipoDocumento, string pValorDocumentoId,
                        DateTime pFechaNacimiento, string pTelefono1, string pTelefono2, string pCorreoElectronico)
        {
            
            this.idTipoParentezco = idTipoParentezco;
            this.IdPersona = idPersona;
            this.idCuenta = idCuenta;
            this.porcentaje = porcentaje;
            this.Activo = pActivo;
            this.Nombre = pNombre;
            this.parentezco = pParentezco;
            //----------------------Persona herencia
            this.numeroCuenta = pNumeroCuenta;

            this.TipoDocumento = pTipoDocumento;
            this.ValorDocumentoId = pValorDocumentoId;
            this.FechaNacimiento = pFechaNacimiento;
            this.Telefono1 = pTelefono1;
            this.Telefono2 = pTelefono2;
            this.CorreoElectronico = pCorreoElectronico;



        }

        public int IdBeneficiario { get => idBeneficiario; set => idBeneficiario = value; }
        public int IdTipoParentezco { get => idTipoParentezco; set => idTipoParentezco = value; }
        public int Porcentaje { get => porcentaje; set => porcentaje = value; }
        public int IdCuenta { get => idCuenta; set => idCuenta = value; }
        public bool Activo { get => activo; set => activo = value; }
        public string Parentezco { get => parentezco; set => parentezco = value; }
        public int NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }

    }
}
