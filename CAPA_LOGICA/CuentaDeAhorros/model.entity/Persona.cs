using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Persona
    {
        //Atributos de la clase
        private int idPersona; //pk
        private int tipoDocumento;
        private string nombre;
        private string valorDocumentoId;
        private string fechaNacimiento;
        private string telefono1;
        private string telefono2;
        private string correoElectronico;
        //estado para controlar los errores
        private int estadoError;


        //Constructores
        public Persona() { } // mapeo

        public Persona(int pIdPersona) // primary key
        {
            this.IdPersona = pIdPersona;
            
        }

        public Persona(int pIdPersona, int pTipoDocumento, string pNombre, string pValorDocumentoId,
                        string pFechaNacimiento, string pTelefono1, string pTelefono2, string pCorreoElectronico)
        {
            this.IdPersona = pIdPersona;
            this.TipoDocumento = pTipoDocumento;
            this.Nombre = pNombre;
            this.ValorDocumentoId = pValorDocumentoId;
            this.FechaNacimiento = pFechaNacimiento;
            this.Telefono1 = pTelefono1;
            this.Telefono2 = pTelefono2;
            this.CorreoElectronico = pCorreoElectronico;
        }

        public int IdPersona { get => idPersona; set => idPersona = value; }
        public int TipoDocumento { get => tipoDocumento; set => tipoDocumento = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string ValorDocumentoId { get => valorDocumentoId; set => valorDocumentoId = value; }
        public string FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public string Telefono1 { get => telefono1; set => telefono1 = value; }
        public string Telefono2 { get => telefono2; set => telefono2 = value; }
        public string CorreoElectronico { get => correoElectronico; set => correoElectronico = value; }
        public int EstadoError { get => estadoError; set => estadoError = value; }
    }
}
