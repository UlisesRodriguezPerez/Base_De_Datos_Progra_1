using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class MovimientoCo
    {
        private int idMovimientoCo;
        private int idCuentaObjetivo;
        private DateTime fecha;
        private string tipoMovimientoCo;
        private int idTipoMovimientoCo;
        private decimal monto;
        private decimal nuevoMonto;
        private int idCuentaAhorro;
        private string numeroCuenta;
        private string descripcion;
        


        public MovimientoCo() { }

        public MovimientoCo(int id)
        {
            this.idMovimientoCo = id;
        }
        public MovimientoCo(int id, int idCuentaObjetivo, int idCuentaAhorro, int idTipoMovimientoCo, string pNumeroCuenta, DateTime fecha, string tipoMovimientoCo, decimal monto, decimal nuevoMonto, string descripcion)
        {
            this.idMovimientoCo = id;
            this.idCuentaAhorro = idCuentaAhorro;
            this.idCuentaObjetivo = idCuentaObjetivo;
            this.idTipoMovimientoCo = idTipoMovimientoCo;
            this.numeroCuenta = pNumeroCuenta;
            this.fecha = fecha;
            this.tipoMovimientoCo = tipoMovimientoCo;
            this.monto = monto;
            this.nuevoMonto = nuevoMonto;
            this.descripcion = descripcion;
        }

        //Getters and Setters
        public int IdMovimientoCo { get => idMovimientoCo; set => idMovimientoCo = value; }
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public string NumeroCuenta { get => numeroCuenta; set => numeroCuenta = value; }
        public int IdTipoMovimientoCo { get => idTipoMovimientoCo; set => idTipoMovimientoCo = value; }
        public int IdCuentaObjetivo { get => idCuentaObjetivo; set => idCuentaObjetivo = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public string TipoMovimientoCo { get => tipoMovimientoCo; set => tipoMovimientoCo = value; }
        public decimal Monto { get => monto; set => monto = value; }
        public decimal NuevoMonto { get => nuevoMonto; set => nuevoMonto = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
    }
}