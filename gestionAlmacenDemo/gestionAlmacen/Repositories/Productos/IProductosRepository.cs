using gestionAlmacen.Models;

namespace gestionAlmacen.Repositories.Productos
{
    public interface IProductosRepository
    {
        void Add(MProductos mProductos);

        void Delete(int id);

        void Edit(MProductos mProductos);

        IEnumerable<MProductos> GetAll();

        MProductos? GetById(int id);
    }
}