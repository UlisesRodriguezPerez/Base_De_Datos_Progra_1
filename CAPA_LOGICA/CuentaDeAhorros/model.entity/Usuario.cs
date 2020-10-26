using System;
using System.Collections.Generic;
using System.Text;

namespace model.entity
{
    public class Usuario
    {
        //Creamos los atributos de la clase.
        private int idUsuario;
        private string nombreUsuario;
        private string password;
        private bool tipoUsuario;

        public Usuario()
        {

        }

        //Creamos un constructor con la llave primaria.
        public Usuario(int pIdUsuario)
        {
            this.idUsuario = pIdUsuario;
        }

        //Constructor con todos los campos.
        public Usuario(int pIdUsuario, string pNombreUsuario, string pPassword, bool pTipoUsuario)
        {
            this.idUsuario = pIdUsuario;
            this.nombreUsuario = pNombreUsuario;
            this.password = pPassword;
            this.tipoUsuario = pTipoUsuario;
        }

        //getters and setters
        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public string NombreUsuario { get => nombreUsuario; set => nombreUsuario = value; }
        public string Password { get => password; set => password = value; }
        public bool TipoUsuario { get => tipoUsuario; set => tipoUsuario = value; }
    }
}