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
        private DateTime fechaNacimiento;
        private string telefono1;
        private string telefono2;
        private string correoElectronico;
        //estado para controlar los errores
        private int estadoError;


        //Constructores
        public Persona() { } // mapeo

        public Persona(int pIdPersona) // primary key
        {
            this.idPersona = pIdPersona;
            
            
        }

        public Persona(int pIdPersona, int pTipoDocumento, string pNombre, string pValorDocumentoId,
                        DateTime pFechaNacimiento, string pTelefono1, string pTelefono2, string pCorreoElectronico)
        {
            this.idPersona = pIdPersona;
            this.tipoDocumento = pTipoDocumento;
            this.nombre = pNombre;
            this.valorDocumentoId = pValorDocumentoId;
            this.fechaNacimiento = pFechaNacimiento;
            this.telefono1 = pTelefono1;
            this.telefono2 = pTelefono2;
            this.correoElectronico = pCorreoElectronico;
        }

        public int IdPersona { get => idPersona; set => idPersona = value; }
        public int TipoDocumento { get => tipoDocumento; set => tipoDocumento = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string ValorDocumentoId { get => valorDocumentoId; set => valorDocumentoId = value; }
        public DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public string Telefono1 { get => telefono1; set => telefono1 = value; }
        public string Telefono2 { get => telefono2; set => telefono2 = value; }
        public string CorreoElectronico { get => correoElectronico; set => correoElectronico = value; }
        public int EstadoError { get => estadoError; set => estadoError = value; }
    }
}
