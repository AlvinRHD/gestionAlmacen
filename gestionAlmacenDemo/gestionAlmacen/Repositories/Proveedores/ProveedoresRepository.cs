using Dapper;
using gestionAlmacen.Data;
using gestionAlmacen.Models;
using System.Data;

namespace gestionAlmacen.Repositories.Proveedores
{
    public class ProveedoresRepository : IProveedoresRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public ProveedoresRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public IEnumerable<MProveedores> GetAll()
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Proveedores_GetAll";

                return connection.Query<MProveedores>(
                                        storeProcedure,
                                        commandType: CommandType.StoredProcedure
                                        );
            }
        }

        public MProveedores? GetById(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Proveedores_GetById";

                return connection.QueryFirstOrDefault<MProveedores>(
                                    storeProcedure,
                                    new { ID_Proveedor = id },
                                    commandType: CommandType.StoredProcedure
                                   );
            }
        }

        public void Add(MProveedores mProveedores)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Proveedores_Insert";

                connection.Execute(
                    storeProcedure,
                    new { mProveedores.Nombre, mProveedores.Direccion, mProveedores.Telefono, mProveedores.CorreoElectronico },
                    commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Edit(MProveedores mProveedores)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Proveedores_Update";

                connection.Execute(
                    storeProcedure,
                    mProveedores,
                    commandType: CommandType.StoredProcedure);

            }
        }

        public void Delete(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Proveedores_Delete";

                connection.Execute(
                    storeProcedure,
                    new { ID_Proveedor = id },
                    commandType: CommandType.StoredProcedure
                    );
            }
        }
    }
}
