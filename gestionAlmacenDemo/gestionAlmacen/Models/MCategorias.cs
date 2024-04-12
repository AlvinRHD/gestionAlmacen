using System.ComponentModel.DataAnnotations;

namespace gestionAlmacen.Models
{
    public class MCategorias
    {

        public int ID_Categoria { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        [MinLength(5, ErrorMessage = "Debe ingresar mínimo 5 letras")]
        [MaxLength(75, ErrorMessage = "Puede ingresar máximo 75 letras")]
        [Display(Name = "Nombre")]

        public string Nombre { get; set; }


        [Required(ErrorMessage = "La Descripción es obligatoria")]
        [MinLength(5, ErrorMessage = "Debe ingresar minimo 5 letras")]
        [MaxLength(250, ErrorMessage = "Puede ingresar maximo 250 letras")]
        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }


    }
}
