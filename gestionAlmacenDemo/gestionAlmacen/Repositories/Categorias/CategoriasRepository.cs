using Dapper;
using gestionAlmacen.Data;
using gestionAlmacen.Models;
using System.Data;

namespace gestionAlmacen.Repositories.Categorias
{
    public class CategoriasRepository : ICategoriasRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public CategoriasRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public IEnumerable<MCategorias> GetAll()
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Categorias_GetAll"; 

                return connection.Query<MCategorias>(
                                        storeProcedure,
                                        commandType: CommandType.StoredProcedure
                                        );
            }
        }

        public MCategorias? GetById(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Categorias_GetById";

                return connection.QueryFirstOrDefault<MCategorias>(
                                    storeProcedure,
                                    new { ID_Categoria = id },
                                    commandType: CommandType.StoredProcedure
                                   );
            }
        }

        public void Add(MCategorias mCategorias)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Categorias_Insert";

                connection.Execute(
                    storeProcedure,
                    new {mCategorias.Nombre, mCategorias.Descripcion},
                    commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Edit(MCategorias mCategorias)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Categorias_Update";

                connection.Execute(
                    storeProcedure,
                    mCategorias,
                    commandType: CommandType.StoredProcedure);

            }
        }

        public void Delete(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storeProcedure = "dbo.sp_Categorias_Delete";

                connection.Execute(
                    storeProcedure,
                    new { ID_Categoria = id },
                    commandType: CommandType.StoredProcedure
                    );
            }
        }
    }
}

