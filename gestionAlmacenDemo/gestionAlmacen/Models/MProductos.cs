namespace gestionAlmacen.Models
{
    public class MProductos
    {
        public int ID_Producto { get; set; }

        public string Nombre { get; set; }

        public string Descripcion { get; set; }

        public string Precio { get; set; }

        public string Stock { get; set; }

        public int ID_Categoria { get; set; }

        public int ID_Proveedor { get; set;}



    }
}
