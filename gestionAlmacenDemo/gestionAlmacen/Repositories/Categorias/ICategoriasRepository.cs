using gestionAlmacen.Models;

namespace gestionAlmacen.Repositories.Categorias
{

        public interface ICategoriasRepository
        {
            void Add(MCategorias mCategorias);

            void Delete(int id);

            void Edit(MCategorias mCategorias);

            IEnumerable<MCategorias> GetAll();

            MCategorias? GetById(int id);

        }
    
}