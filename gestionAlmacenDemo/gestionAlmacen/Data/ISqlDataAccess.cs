using System.Data;

namespace gestionAlmacen.Data
{
    public interface ISqlDataAccess
    {
        IDbConnection GetConnection();
    }
}