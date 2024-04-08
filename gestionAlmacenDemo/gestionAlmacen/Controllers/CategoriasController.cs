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
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        //Se muestra la vista editar del cliente
        public ActionResult Edit(int id)
        {
            return View();
        }

        // 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        //Se muestra la vista eliminar del cliente
        public ActionResult Delete(int id)
        {
            return View();
        }

        // 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
