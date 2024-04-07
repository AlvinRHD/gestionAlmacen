using Dapper;
using gestionAlmacen.Data;
using gestionAlmacen.Models;
using NuGet.Protocol.Plugins;
using System.Data;

namespace gestionAlmacen.Repositories.Ventas
{
    public class VentasRepository : IVentasRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public VentasRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public IEnumerable<MClientes> GetAllClientes()
        {
            string query = "SELECT ID_Cliente, Nombre, Direccion, Telefono, CorreoElectronico  FROM Clientes;";

            using (var connection = _dataAccess.GetConnection())
            {
                return connection.Query<MClientes>(query);
            }
        }

        public IEnumerable<MVentas> GetAll()
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_Ventas_GetAll";

                var mVentas = connection.Query<MVentas, MClientes, MVentas>
                    (storedProcedure, (mVentas, mClientes) =>
                    {
                        mVentas.MClientes = mClientes;

                        return mVentas;
                    },
                    splitOn: "Nombre",
                    commandType: CommandType.StoredProcedure);

                return mVentas;
            }
        }

        public MVentas? GetById(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_Ventas_GetById";

                return connection.QueryFirstOrDefault<MVentas>(
                                storedProcedure,
                                new { ID_Venta = id },
                                commandType: CommandType.StoredProcedure

                    );
            }
        }

        public void Add(MVentas mVentas)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_Ventas_Insert";

                connection.Execute(
                        storedProcedure,
                        new { mVentas.ID_Cliente, mVentas.Fecha,
                            mVentas.Total, mVentas.EstadoVenta },
                        commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Edit(MVentas mVentas)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_Ventas_Update";

                connection.Execute(
                        storedProcedure,
                        new { mVentas.ID_Venta, mVentas.ID_Cliente, mVentas.Fecha,
                        mVentas.Total,mVentas.EstadoVenta },
                        commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Delete(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_Ventas_Delete";

                connection.Execute(
                    storedProcedure,
                    new { ID_Venta = id },
                    commandType: CommandType.StoredProcedure);
            }

        }
    }
}
