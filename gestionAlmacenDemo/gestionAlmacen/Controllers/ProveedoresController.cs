using gestionAlmacen.Models;
using gestionAlmacen.Repositories.Categorias;
using gestionAlmacen.Repositories.Proveedores;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace gestionAlmacen.Controllers
{
    public class ProveedoresController : Controller
    {
        private readonly IProveedoresRepository _proveedoresRepository;

        public ProveedoresController(IProveedoresRepository proveedoresRepository)
        {
            _proveedoresRepository = proveedoresRepository;

        }


        // GET: ProveedoresController
        public ActionResult Index()
        {
            return View(_proveedoresRepository.GetAll());
        }

        // GET: ProveedoresController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ProveedoresController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProveedoresController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MProveedores mProveedores)
        {
            try
            {
                _proveedoresRepository.Add(mProveedores);

                TempData["message"] = "Dato guardado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;

                return View(mProveedores);
            }
        }

        // GET: ProveedoresController/Edit/5
        public ActionResult Edit(int id)
        {
            var mProveedores = _proveedoresRepository.GetById(id);

            if (mProveedores == null)
            {
                return NotFound();
            }

            return View(mProveedores);
        }

        // POST: ProveedoresController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MProveedores mProveedores)
        {
            try
            {
                _proveedoresRepository.Edit(mProveedores);

                TempData["message"] = "Datos editados correctamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(mProveedores);
            }
        }

        // GET: ProveedoresController/Delete/5
        public ActionResult Delete(int id)
        {
            var mProveedores = _proveedoresRepository.GetById(id);

            if (mProveedores == null)
            {
                return NotFound();
            }

            return View(mProveedores);
        }

        // POST: ProveedoresController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(MProveedores mProveedores)
        {
            try
            {
                _proveedoresRepository.Delete(mProveedores.ID_Proveedor);

                TempData["message"] = "Dato eliminado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["message"] = "Error al eliminar el cliente: " + ex.Message;
                ViewBag.errror = ex.Message;
                return View(mProveedores);
            }
        }
    }
}
