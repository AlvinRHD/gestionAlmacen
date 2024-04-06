using System.Data.SqlTypes;

namespace gestionAlmacen.Models
{
    public class MVentas
    {
        public int ID_Venta { get; set; }

        public int ID_Cliente { get; set; }

        public DateTime Fecha { get; set; }

        public SqlMoney Total { get; set; }

        public string EstadoVenta { get; set; }

        public MClientes? MClientes { get; set; }

    }
}
