using System.ComponentModel.DataAnnotations;

namespace gestionAlmacen.Models
{
    public class MProveedores
    {

        public int ID_Proveedor { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        [MinLength(3, ErrorMessage = "Debe ingresar mínimo 3 letras")]
        [MaxLength(75, ErrorMessage = "Puede ingresar máximo 75 letras")]
        [Display(Name = "Nombre")]
        public string Nombre { get; set; }


        [Required(ErrorMessage = "La dirección es obligatoria")]
        [MinLength(5, ErrorMessage = "Debe ingresar mínimo 5 letras")]
        [MaxLength(100, ErrorMessage = "Puede ingresar máximo 75 letras")]
        [Display(Name = "Dirección")]
        public string Direccion { get; set; }


        [Required(ErrorMessage = "El telefono es obligatoria")]
        [MinLength(8, ErrorMessage = "Debe ingresar mínimo de 8 digitos")]
        [MaxLength(12, ErrorMessage = "Puede ingresar máximo de 12 dígitos")]
        [Display(Name = "Telefono")]
        public string Telefono { get; set; }


        [Required(ErrorMessage = "El correo electronico es obligatoria")]
        [MinLength(8, ErrorMessage = "Debe ingresar minimo de 8 caracteres")]
        [MaxLength(60, ErrorMessage = "Puede ingresar maximo de 60 caracteres")]
        [Display(Name = "CorreoElectronico")]
        public string CorreoElectronico { get; set; }


     }
}
