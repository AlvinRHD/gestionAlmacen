using System.ComponentModel.DataAnnotations;
using System.Data.SqlTypes;

namespace gestionAlmacen.Models
{
    public class MDetalle_Venta
    {
        public int ID_Detalle { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Venta")]
        public int ID_Venta { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Producto")]
        public int ID_Producto { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "Cantidad")]
        public int Cantidad { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "Precio_Unitario")]
        public decimal Precio_Unitario { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "Subtotal")]
        public decimal Subtotal { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "Impuesto")]
        public decimal Impuesto { get; set; }

        public MProductos? mProductos { get; set; }
    }
}
