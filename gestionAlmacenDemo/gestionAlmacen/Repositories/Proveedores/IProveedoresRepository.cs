using gestionAlmacen.Models;

namespace gestionAlmacen.Repositories.Proveedores
{
    public interface IProveedoresRepository
    {
        void Add(MProveedores mProveedores);

        void Delete(int id);

        void Edit(MProveedores mProveedores);

        IEnumerable<MProveedores> GetAll();

        MProveedores? GetById(int id);
    }
}