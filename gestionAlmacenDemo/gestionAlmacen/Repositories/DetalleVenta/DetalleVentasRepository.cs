using Dapper;
using gestionAlmacen.Data;
using gestionAlmacen.Models;
using NuGet.Protocol.Plugins;
using System.Data;

namespace gestionAlmacen.Repositories.DetalleVenta
{
    public class DetalleVentasRepository : IDetalleVentasRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public DetalleVentasRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public IEnumerable<MVentas> GetAllVentas()
        {
            string query = "SELECT ID_Venta, ID_Cliente, Fecha, Total, EstadoVenta FROM Ventas;";

            using (var connection = _dataAccess.GetConnection())
            {
                return connection.Query<MVentas>(query);
            }
        }

        public IEnumerable<MDetalle_Venta> GetAll()
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_DetallesVenta_GetAll";
                var detalles_ventas = connection.Query<MDetalle_Venta, MVentas, MDetalle_Venta>
                    (storedProcedure, (detallesVenta, mVentas) =>
                    {
                        detallesVenta.mVentas = mVentas;

                        return detallesVenta;
                    },
                    splitOn: "ID_Venta",
                    commandType: CommandType.StoredProcedure);

                return detalles_ventas;
            }
        }

        public MDetalle_Venta? GetById(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_DetallesVenta_GetByVentaID";

                return connection.QueryFirstOrDefault<MDetalle_Venta>(
                                storedProcedure,
                                new { ID_Detalle = id },
                                commandType: CommandType.StoredProcedure

                    );
            }
        }

        public void Add(MDetalle_Venta mDetalle_Venta)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_DetallesVenta_Insert";

                connection.Execute(
                        storedProcedure,
                        new { 
                            mDetalle_Venta.ID_Venta, 
                            mDetalle_Venta.ID_Producto,
                            mDetalle_Venta.Cantidad, 
                            mDetalle_Venta.Precio_Unitario, 
                            mDetalle_Venta.Subtotal, 
                            mDetalle_Venta.Impuesto },
                        commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Edit(MDetalle_Venta mDetalle_Venta)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_DetallesVenta_Update";

                connection.Execute(
                        storedProcedure,
                        new { mDetalle_Venta.ID_Detalle, 
                            mDetalle_Venta.ID_Venta,
                            mDetalle_Venta.ID_Producto,
                            mDetalle_Venta.Cantidad,
                            mDetalle_Venta.Precio_Unitario,
                            mDetalle_Venta.Subtotal,
                            mDetalle_Venta.Impuesto },
                        commandType: CommandType.StoredProcedure
                    );
            }
        }

        public void Delete(int id)
        {
            using (var connection = _dataAccess.GetConnection())
            {
                string storedProcedure = "dbo.sp_DetallesVenta_Delete";

                connection.Execute(
                    storedProcedure,
                    new { ID_Detalle = id },
                    commandType: CommandType.StoredProcedure);
            }

        }
    }
}
