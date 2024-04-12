using System.ComponentModel.DataAnnotations;

namespace gestionAlmacen.Models
{
    public class MProductos
    {
        public int ID_Producto { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        [MinLength(3, ErrorMessage = "Debe ingresar minimo 3 letras")]
        [MaxLength(75, ErrorMessage = "Puede ingresar maximo 75 letras")]
        [Display(Name = "Nombre")]

        public string Nombre { get; set; }


        [Required(ErrorMessage = "La Descripción es obligatoria")]
        [MinLength(5, ErrorMessage = "Debe ingresar minimo 5 letras")]
        [MaxLength(250, ErrorMessage = "Puede ingresar maximo 250 letras")]
        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "Precio")]
        public string Precio { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "Stock")]
        public string Stock { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Categoria")]
        public int ID_Categoria { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio obligatorio")]
        [Display(Name = "ID_Proveedor")]
        public int ID_Proveedor { get; set;}



    }
}
