using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class EstadoCuenta
    {
        private int idEstado;
        private int idCuentaAhorro;
        private DateTime fechaInicio;
        private DateTime fechaFinal;
        private decimal saldoInicial;
        private decimal saldoFinal;
        private string numeroCuenta;
        private int retirosCajeroHumano;
        private int retirosCajeroAutomatico;
        private decimal saldoMinimo;

        public EstadoCuenta(){}

        public EstadoCuenta(int id) {
            this.idEstado = id;
        }
        public EstadoCuenta(int id, int idCuentaAhorro, DateTime fechaInicio, DateTime fechaFinal, decimal saldoInicial, decimal saldoFinal, string pNumeroCuenta, int retirosCajeroHumano, int retirosCajeroAutomatico, int saldoMinimo)
        {
            this.idEstado = id;
            this.idCuentaAhorro = idCuentaAhorro;
            this.fechaInicio = fechaInicio;
            this.fechaFinal = fechaFinal;
            this.saldoInicial = saldoInicial;
            this.saldoFinal = saldoFinal;
            this.numeroCuenta = pNumeroCuenta;
            this.retirosCajeroHumano = retirosCajeroHumano;
            this.retirosCajeroAutomatico = retirosCajeroAutomatico;
            this.saldoMinimo = saldoMinimo;
        }

        //Getters and Setters
        public int IdEstado { get => idEstado; set => idEstado = value; }
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public DateTime FechaInicio { get => fechaInicio; set => fechaInicio = value; }
        public DateTime FechaFinal { get => fechaFinal; set => fechaFinal = value; }
        public decimal SaldoInicial { get => saldoInicial; set => saldoInicial = value; }
        public decimal SaldoFinal { get => saldoFinal; set => saldoFinal = value; }
        public string NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }
        public int RetirosCajeroHumano { get => retirosCajeroHumano; set => retirosCajeroHumano = value; }
        public int RetirosCajeroAutomatico { get => retirosCajeroAutomatico; set => retirosCajeroAutomatico = value; }
        public decimal SaldoMinimo { get => saldoMinimo; set => saldoMinimo = value; }
    }
}
