using System.ComponentModel.DataAnnotations;

namespace gestionAlmacen.Models
{
    public class MClientes
    {
        //Modelo de Clientes (MClientes)
        
        public int ID_Cliente { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        [MinLength(3, ErrorMessage = "Debe ingresar minimo 3 letras")]
        [MaxLength(75, ErrorMessage = "Puede ingresar maximo 75 letras")]
        [Display(Name = "Nombre")]
        public string Nombre { get; set;}


        [Required(ErrorMessage = "La direccion es obligatoria")]
        [MinLength(5, ErrorMessage = "Debe ingresar minimo 5 letras")]
        [MaxLength(100, ErrorMessage = "Puede ingresar maximo 75 letras")]
        [Display(Name = "Direccion")]
        public string Direccion { get; set; }


        [Required(ErrorMessage = "El telefono es obligatoria")]
        [MinLength(8, ErrorMessage = "Debe ingresar minimo de 8 digitos")]
        [MaxLength(12, ErrorMessage = "Puede ingresar maximo de 12 digitos")]
        [Display(Name = "Telefono")]
        public string Telefono { get; set; }


        [Required(ErrorMessage = "El correo electronico es obligatoria")]
        [MinLength(8, ErrorMessage = "Debe ingresar minimo de 8 caracteres")]
        [MaxLength(60, ErrorMessage = "Puede ingresar maximo de 60 caracteres")]
        [Display(Name = "CorreoElectronico")]
        public string CorreoElectronico {  get; set; }



    }
}
