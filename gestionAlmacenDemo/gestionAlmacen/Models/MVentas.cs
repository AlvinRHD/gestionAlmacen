using System.ComponentModel.DataAnnotations;
using System.Data.SqlTypes;

namespace gestionAlmacen.Models
{
    public class MVentas
    {
        public int ID_Venta { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Proveedor")]
        public int ID_Cliente { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Proveedor")]
        public DateTime Fecha { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Proveedor")]
        public decimal Total { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Proveedor")]
        public string EstadoVenta { get; set; }

        public MClientes? MClientes { get; set; }

    }
}
