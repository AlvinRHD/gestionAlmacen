using System.Data.SqlTypes;

namespace gestionAlmacen.Models
{
    public class MDetalle_Venta
    {
        public int ID_Detalle { get; set; }

        public int ID_Venta { get; set; }

        public int ID_Producto { get; set; }

        public int Cantidad { get; set; }

        public decimal Precio_Unitario { get; set; }

        public SqlMoney Subtotal { get; set; }

        public SqlMoney Impuesto { get; set; }

        public MVentas? mVentas { get; set; }
    }
}
