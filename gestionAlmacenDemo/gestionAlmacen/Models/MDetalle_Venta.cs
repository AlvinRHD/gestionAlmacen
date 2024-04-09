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

        public decimal Subtotal { get; set; }

        public decimal Impuesto { get; set; }

        public MProductos? mProductos { get; set; }
    }
}
