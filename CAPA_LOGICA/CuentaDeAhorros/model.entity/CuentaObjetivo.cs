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
        private int numeroCuenta;
        private Boolean activo;
        private int numeroCuentaObjetivo;
        private int diaDeAhorro;
        private decimal montoMensual;
        private int cantidadDepositosRealizados;
        private int cantidadDepositosNetos;
        private decimal montoAhorrado;
        private decimal montoEsperado;


        public CuentaObjetivo() { }

        public CuentaObjetivo(int pIdCuentaObjetivo)
        {
            this.idCuentaObjetivo = pIdCuentaObjetivo;
        }

        public CuentaObjetivo(int numeroCuentaObjetivo, int idCuentaAhorro, DateTime fechaInicio, DateTime fechaFinal, string objetivo, decimal saldo, decimal interesAcumulado, int numeroCuenta, bool activo, int diaDeAhorro, decimal montoMensual, int cantidadDepositosRealizados, int cantidadDepositosNetos, decimal montoAhorrado, decimal montoEsperado)
        {
            this.idCuentaAhorro = idCuentaAhorro;
            this.fechaInicio = fechaInicio;
            this.fechaFinal = fechaFinal;
            this.objetivo = objetivo;
            this.saldo = saldo;
            this.interesAcumulado = interesAcumulado;
            this.numeroCuenta = numeroCuenta;
            this.activo = activo;
            this.numeroCuentaObjetivo = numeroCuentaObjetivo;
            this.diaDeAhorro = diaDeAhorro;
            this.montoMensual = montoMensual;
            this.cantidadDepositosRealizados = cantidadDepositosRealizados;
            this.cantidadDepositosNetos = cantidadDepositosNetos;
            this.montoAhorrado = montoAhorrado;
            this.montoEsperado = montoEsperado;
        }

        public int IdCuentaObjetivo { get => idCuentaObjetivo; set => idCuentaObjetivo = value; }
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public DateTime FechaInicio { get => fechaInicio; set => fechaInicio = value; }
        public DateTime FechaFinal { get => fechaFinal; set => fechaFinal = value; }
        public string Objetivo { get => objetivo; set => objetivo = value; }
        public decimal Saldo { get => saldo; set => saldo = value; }
        public decimal InteresAcumulado { get => interesAcumulado; set => interesAcumulado = value; }
        public int NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }
        public bool Activo { get => activo; set => activo = value; }
        public int NumeroCuentaObjetivo { get => numeroCuentaObjetivo; set => numeroCuentaObjetivo = value; }
        public int DiaDeAhorro { get => diaDeAhorro; set => diaDeAhorro = value; }
        public decimal MontoMensual { get => montoMensual; set => montoMensual = value; }
        public int CantidadDepositosRealizados { get => cantidadDepositosRealizados; set => cantidadDepositosRealizados = value; }
        public int CantidadDepositosNetos { get => cantidadDepositosNetos; set => cantidadDepositosNetos = value; }
        public decimal MontoAhorrado { get => montoAhorrado; set => montoAhorrado = value; }
        public decimal MontoEsperado { get => montoEsperado; set => montoEsperado = value; }
    }

}
