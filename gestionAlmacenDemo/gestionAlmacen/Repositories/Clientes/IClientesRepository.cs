using gestionAlmacen.Models;

namespace gestionAlmacen.Repositories.Clientes
{
    public interface IClientesRepository
    {
        void Add(MClientes mClientes);

        void Delete(int ID_Cliente);

        void Edit(MClientes mClientes);

        IEnumerable<MClientes> GetAll();

        MClientes? GetById(int ID_Cliente);

    }
}
