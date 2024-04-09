using Dapper;
using gestionAlmacen.Data;
using gestionAlmacen.Models;
using System.Data;

namespace gestionAlmacen.Repositories.Productos
{
    public class ProductosRepository : IProductosRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public ProductosRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public IEnumerable<MProductos> GetAll()
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Productos_GetAll";

                return connection.Query<MProductos>(
                                        storeProcedure,
                                        commandType: CommandType.StoredProcedure
                                        );
            }
        }

        public MProductos? GetById(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Productos_GetById";

                return connection.QueryFirstOrDefault<MProductos>(
                                    storeProcedure,
                                    new { ID_Producto = id },
                                    commandType: CommandType.StoredProcedure
                                   );
            }
        }

        public void Add(MProductos mProductos)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Productos_Insert";

                connection.Execute(
                    storeProcedure,
                    new { mProductos.Nombre, mProductos.Descripcion,
                    mProductos.Precio, mProductos.Stock,
                    mProductos.ID_Categoria, mProductos.ID_Proveedor},
                    commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Edit(MProductos mProductos)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Productos_Update";

                connection.Execute(
                        storeProcedure,
                        mProductos,
                        commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Delete(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Productos_Delete";

                connection.Execute(
                    storeProcedure,
                    new { ID_Producto = id },
                    commandType: CommandType.StoredProcedure
                    );
            }
        }

    }
}





