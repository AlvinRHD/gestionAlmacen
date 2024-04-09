using gestionAlmacen.Models;
using gestionAlmacen.Repositories.Productos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace gestionAlmacen.Controllers
{
    public class ProductosController : Controller
    {
        private readonly IProductosRepository _productosRepository;

        public ProductosController(IProductosRepository productosRepository)
        {
            _productosRepository = productosRepository;
        }

        // GET: ProductosController
        public ActionResult Index()
        {
            return View(_productosRepository.GetAll());
        }

        // GET: ProductosController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ProductosController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MProductos mProductos)
        {
            try
            {
                _productosRepository.Add(mProductos);

                TempData["message"] = "Datos guardados exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                TempData["message"] = ex.Message;

                return View(mProductos);
            }
        }

        // GET: ProductosController/Edit/5
        public ActionResult Edit(int id)
        {
            var mProductos = _productosRepository.GetById(id);

            if(mProductos == null)
            {
                return NotFound();
            }

            return View(mProductos);
        }

        // POST: ProductosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MProductos mProductos)
        {
            try
            {
                _productosRepository.Edit(mProductos);

                TempData["message"] = "Datos editados correctamente";

                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                return View(mProductos);
            }
        }


        // GET: ProductosController/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var mProductos = _productosRepository.GetById(id);

            if (mProductos == null)
            {
                return NotFound();
            }

            return View(mProductos);
        }

        // POST: ProductosController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(MProductos mProductos)
        {
            try
            {
                _productosRepository.Delete(mProductos.ID_Producto);

                TempData["message"] = "Dato eliminado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["message"] = "Error al eliminar el cliente: " + ex.Message;
                ViewBag.errror = ex.Message;
                return View(mProductos);
            }
        }

    }
}
