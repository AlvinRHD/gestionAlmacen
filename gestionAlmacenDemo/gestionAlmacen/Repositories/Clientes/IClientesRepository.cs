using gestionAlmacen.Models;

namespace gestionAlmacen.Repositories.Clientes
{
    public interface IClientesRepository
    {
        void Add(MClientes mClientes);

        void Delete(int id);

        void Edit(MClientes mClientes);

        IEnumerable<MClientes> GetAll();

        MClientes? GetById(int id);

    }
}
