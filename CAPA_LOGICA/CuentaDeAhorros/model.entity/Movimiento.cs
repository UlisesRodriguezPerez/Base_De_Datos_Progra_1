using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class Movimiento
    {
        private int id;
        private int idTipoMovimiento;
        private int idCuentaAhorro;
        private int idEstadoCuenta;
        private decimal monto;
        private DateTime fecha;
        private string descripcion;
        private decimal nuevoSaldo;
        private string tipoMovimiento;
        private int numeroCuenta;
        private string tipo;

        public Movimiento() { }

        public Movimiento(int id)
        {
            this.id = id;
        }

        public Movimiento(int idTipoMovimiento, int idCuentaAhorro, int idEstadoCuenta, decimal monto, DateTime fecha, string descripcion, decimal nuevoSaldo, string tipoMovimiento, int numeroCuenta, string tipo)
        {
            this.idTipoMovimiento = idTipoMovimiento;
            this.idCuentaAhorro = idCuentaAhorro;
            this.idEstadoCuenta = idEstadoCuenta;
            this.monto = monto;
            this.fecha = fecha;
            this.descripcion = descripcion;
            this.nuevoSaldo = nuevoSaldo;
            this.tipoMovimiento = tipoMovimiento;
            this.numeroCuenta = numeroCuenta;
            this.tipo = tipo;
        }

        public int Id { get => id; set => id = value; }
        public int IdTipoMovimiento { get => idTipoMovimiento; set => idTipoMovimiento = value; }
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public int IdEstadoCuenta { get => idEstadoCuenta; set => idEstadoCuenta = value; }
        public decimal Monto { get => monto; set => monto = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public decimal NuevoSaldo { get => nuevoSaldo; set => nuevoSaldo = value; }
        public string TipoMovimiento { get => tipoMovimiento; set => tipoMovimiento = value; }
        public int NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }
        public string Tipo { get => tipo; set => tipo = value; }
    }
}
