using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model.entity
{
    public class MovimientoCOI
    {
        private int idMovimientoCOI;
        private int idCuentaObjetivo;
        private DateTime fecha;
        private string tipoMovimientoCOI;
        private int idTipoMovimientoCOI;
        private decimal monto;
        private decimal nuevoMonto;
        private int idCuentaAhorro;
        private string numeroCuentaAhorro;
        private string descripcion;
        private int numeroCuentaObjetivo;



        public MovimientoCOI() { }

        public MovimientoCOI(int id)
        {
            this.idMovimientoCOI = id;
        }
        public MovimientoCOI(int id, int idCuentaObjetivo, int idCuentaAhorro, int idTipoMovimientoCOI, string pNumeroCuentaAhorro, DateTime fecha, string tipoMovimientoCOI, decimal monto, decimal nuevoMonto, string descripcion, int numeroCuentaObjetivo)
        {
            this.idMovimientoCOI = id;
            this.idCuentaAhorro = idCuentaAhorro;
            this.idCuentaObjetivo = idCuentaObjetivo;
            this.idTipoMovimientoCOI = idTipoMovimientoCOI;
            this.numeroCuentaAhorro = pNumeroCuentaAhorro;
            this.fecha = fecha;
            this.tipoMovimientoCOI = tipoMovimientoCOI;
            this.monto = monto;
            this.nuevoMonto = nuevoMonto;
            this.descripcion = descripcion;
            this.numeroCuentaObjetivo = numeroCuentaObjetivo;
        }

        //Getters and Setters
        public int IdMovimientoCOI { get => idMovimientoCOI; set => idMovimientoCOI = value; }
        public int IdCuentaAhorro { get => idCuentaAhorro; set => idCuentaAhorro = value; }
        public string NumeroCuentaAhorro { get => numeroCuentaAhorro; set => numeroCuentaAhorro = value; }
        public int IdTipoMovimientoCOI { get => idTipoMovimientoCOI; set => idTipoMovimientoCOI = value; }
        public int IdCuentaObjetivo { get => idCuentaObjetivo; set => idCuentaObjetivo = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public string TipoMovimientoCOI { get => tipoMovimientoCOI; set => tipoMovimientoCOI = value; }
        public decimal Monto { get => monto; set => monto = value; }
        public decimal NuevoMonto { get => nuevoMonto; set => nuevoMonto = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public int NumeroCuentaObjetivo { get => numeroCuentaObjetivo; set => numeroCuentaObjetivo = value; }
    }
}