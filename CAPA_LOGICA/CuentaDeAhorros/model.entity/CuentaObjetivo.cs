using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class CuentaObjetivo
    {

        private int idCuentaObjetivo;
        private int idCuentaAhorro;
        private DateTime fechaInicio;
        private DateTime fechaFinal;
        private string objetivo;
        private decimal saldo;
        private decimal interesAcumulado;


        public CuentaObjetivo() { }

        public CuentaObjetivo(int pIdCuentaObjetivo)
        {
            this.idCuentaObjetivo = pIdCuentaObjetivo;
        }

        public CuentaObjetivo(int idCuentaObjetivo, int idCuentaAhorro, DateTime fechaInicio, DateTime fechaFinal, string objetivo, decimal saldo, decimal interesAcumulado) : this(idCuentaObjetivo)
        {
            this.idCuentaObjetivo = idCuentaObjetivo;
            this.idCuentaAhorro = idCuentaAhorro;
            this.fechaInicio = fechaInicio;
            this.fechaFinal = fechaFinal;
            this.objetivo = objetivo;
            this.saldo = saldo;
            this.interesAcumulado = interesAcumulado;
        }

        public int IdCuentaObjetivo { get => idCuentaObjetivo; set => idCuentaObjetivo = value; }
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public DateTime FechaInicio { get => fechaInicio; set => fechaInicio = value; }
        public DateTime FechaFinal { get => fechaFinal; set => fechaFinal = value; }
        public string Objetivo { get => objetivo; set => objetivo = value; }
        public decimal Saldo { get => saldo; set => saldo = value; }
        public decimal InteresAcumulado { get => interesAcumulado; set => interesAcumulado = value; }
    }

}
