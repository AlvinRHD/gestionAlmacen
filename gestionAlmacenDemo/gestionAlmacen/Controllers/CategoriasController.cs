//using AspNetCore;
using gestionAlmacen.Models;
using gestionAlmacen.Repositories.Categorias;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


namespace gestionAlmacen.Controllers
{

    public class CategoriasController : Controller
    {
        private readonly ICategoriasRepository _categoriasRepository;

            public CategoriasController(ICategoriasRepository categoriasRepository) 
            {
                _categoriasRepository = categoriasRepository;
                
            }
            
        
        //Se muestra la vista del index del cliente
        public ActionResult Index()
        {
            return View(_categoriasRepository.GetAll());
        }

        // 
        public ActionResult Details(int id)
        {
            return View();
        }


        //Se muestra la vista agregar un nuevo cliente
        public ActionResult Create()
        {
            return View();
        }

        // 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MCategorias mCategorias)
        {
            try
            {
                _categoriasRepository.Add(mCategorias);

                TempData["message"] = "Dato guardado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                TempData["message"] = ex.Message;

                return View(mCategorias);
            }
        }

        [HttpGet]
        //Se muestra la vista editar del cliente
        public ActionResult Edit(int id)
        {
            var mCategorias = _categoriasRepository.GetById(id);

            if (mCategorias == null)
            {
                return NotFound();
            }

            return View(mCategorias);
        }

        // 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MCategorias mCategorias)
        {
            try
            {
                _categoriasRepository.Edit(mCategorias);

                TempData["message"] = "Datos editados correctamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(mCategorias);
            }
        }

        //Se muestra la vista eliminar del cliente
        public ActionResult Delete(int id)
        {
            var mCategorias = _categoriasRepository.GetById(id);

            if (mCategorias == null)
            {
                return NotFound();
            }

            return View(mCategorias);
        }

        // 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(MCategorias mCategorias)
        {
            try
            {
                _categoriasRepository.Delete(mCategorias.ID_Categoria);

                TempData["message"] = "Dato eliminado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["message"] = "Error al eliminar el cliente: " + ex.Message;
                ViewBag.errror = ex.Message;
                return View(mCategorias);
            }
        }
    }
}
