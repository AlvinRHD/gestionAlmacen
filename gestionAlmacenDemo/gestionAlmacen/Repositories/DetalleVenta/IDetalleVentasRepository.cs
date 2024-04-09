using gestionAlmacen.Models;
using System.Collections;

namespace gestionAlmacen.Repositories.DetalleVenta
{
    public interface IDetalleVentasRepository
    {
        void Add(MDetalle_Venta mDetalle_Venta);
        void Delete(int id);
        void Edit(MDetalle_Venta mDetalle_Venta);
        IEnumerable<MDetalle_Venta> GetAll();
        IEnumerable<MProductos> GetAllProductos();

        //IEnumerable<MVentas> GetAllVentas();
        
        MDetalle_Venta? GetById(int id);
    }
}