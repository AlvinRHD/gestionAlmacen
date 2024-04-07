using gestionAlmacen.Models;

namespace gestionAlmacen.Repositories.Ventas
{
    public interface IVentasRepository
    {
        void Add(MVentas mVentas);

        void Delete(int id);

        void Edit(MVentas mVentas);

        IEnumerable<MVentas> GetAll();

        IEnumerable<MClientes> GetAllClientes();

        MVentas? GetById(int id);
    }
}
