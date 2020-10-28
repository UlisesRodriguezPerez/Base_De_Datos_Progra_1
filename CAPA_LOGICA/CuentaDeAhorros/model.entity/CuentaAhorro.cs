using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class CuentaAhorro
    {
        private int idCuentaAhorro;
        private int idTipoCuneta;
        private int idPersona;
        private int idCuentaObjetivo;
        private int numeroCuenta;
        private decimal saldo;
        private string fechaCreacion;

        public CuentaAhorro() { }

        public CuentaAhorro(int pIdCuentaAhorro)
        {
            this.idCuentaAhorro = pIdCuentaAhorro;
        }

        public CuentaAhorro(int pIdCuentaAhorro, int pIdTipoCuneta, int pIdPersona, int pIdCuentaObjetivo, int pNumeroCuenta, decimal pSaldo, string pFechaCreacion)
        {
            this.idCuentaAhorro = pIdCuentaAhorro;
            this.idTipoCuneta = pIdTipoCuneta;
            this.idPersona = pIdPersona;
            this.idCuentaObjetivo = pIdCuentaObjetivo;
            this.numeroCuenta = pNumeroCuenta;
            this.saldo = pSaldo;
            this.fechaCreacion = pFechaCreacion;
        }

        //Getters and Setters
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public int IdTipoCuneta { get => idTipoCuneta; set => idTipoCuneta = value; }
        public int IdPersona { get => idPersona; set => idPersona = value; }
        public int IdCuentaObjetivo { get => idCuentaObjetivo; set => idCuentaObjetivo = value; }
        public int NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }
        public decimal Saldo { get => saldo; set => saldo = value; }
        public string FechaCreacion { get => fechaCreacion; set => fechaCreacion = value; }



       


    }
}