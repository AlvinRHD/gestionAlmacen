using Dapper;
using gestionAlmacen.Data;
using gestionAlmacen.Models;
using System.Data;

namespace gestionAlmacen.Repositories.Clientes
{
    public class ClientesRepository : IClientesRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public ClientesRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }


        public IEnumerable<MClientes> GetAll()
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Clientes_GetAll";

                return connection.Query<MClientes>(
                                        storeProcedure,
                                        commandType: CommandType.StoredProcedure
                                        );
            }
        }

        public MClientes? GetById(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Clientes_GetById";

                return connection.QueryFirstOrDefault<MClientes>(
                                    storeProcedure,
                                    new { ID_Cliente = id },
                                    commandType: CommandType.StoredProcedure
                                   );
            }
        }

        public void Add(MClientes mClientes)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Clientes_Insert";

                connection.Execute(
                    storeProcedure,
                    new { mClientes.Nombre, mClientes.Direccion, mClientes.Telefono, mClientes.CorreoElectronico},
                    commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Edit(MClientes mClientes)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Clientes_Update";

                connection.Execute(
                    storeProcedure,
                    mClientes,
                    commandType: CommandType.StoredProcedure);

            }
        }

        public void Delete(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Clientes_Delete";

                connection.Execute(
                    storeProcedure,
                    new { id },
                    commandType: CommandType.StoredProcedure
                    );
            }
        }
    }
}
