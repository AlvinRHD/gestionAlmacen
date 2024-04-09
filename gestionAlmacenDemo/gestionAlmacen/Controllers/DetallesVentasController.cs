using gestionAlmacen.Models;
using gestionAlmacen.Repositories.DetalleVenta;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using NuGet.Protocol.Plugins;

namespace gestionAlmacen.Controllers
{
    public class DetallesVentasController : Controller
    {
        private readonly IDetalleVentasRepository _detatalleVentaRepository;
        private SelectList _productosList;

        //talvez
        //private SelectList _ventasList;

        public DetallesVentasController(IDetalleVentasRepository detatalleVentaRepository)
        {
            _detatalleVentaRepository = detatalleVentaRepository;
            _productosList = new SelectList(
                _detatalleVentaRepository.GetAllProductos(),
                nameof(MProductos.ID_Producto),
                nameof(MProductos.Nombre)
                );

            //// Cargar los ID_Venta para la vista
            //ViewBag.Ventas = new SelectList(
            //    _detatalleVentaRepository.GetAllVentas(),
            //    nameof(MVentas.ID_Venta),
            //    nameof(MVentas.ID_Venta)
            //);


        }

        public ActionResult Index()
        {
            return View(_detatalleVentaRepository.GetAll());
        }

        // GET: FacultyController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: FacultyController/Create
        public ActionResult Create()
        {
            ViewBag.Productos = _productosList;

            //Talvez
            //ViewBag.Ventas = _ventasList;

            return View();
        }

        // POST: FacultyController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Create(MDetalle_Venta detalle_Venta)
        {
            try
            {
                _detatalleVentaRepository.Add(detalle_Venta);
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ViewBag.Productos = _productosList;

                return View(detalle_Venta);
            }
        }

        // GET: FacultyController/Edit/5
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var detalle_Venta = _detatalleVentaRepository.GetById(id);

            _productosList = new SelectList(
                                _detatalleVentaRepository.GetAllProductos(),
                                nameof(MProductos.ID_Producto),
                                nameof(MProductos.Nombre),
                                // mProductos es del modelo el ultimo
                                detalle_Venta?.mProductos?.ID_Producto

                                   );

            ViewBag.Productos = _productosList;

            return View(detalle_Venta);
        }

        // POST: FacultyController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MDetalle_Venta detalle_Venta)
        {
            try
            {
                _detatalleVentaRepository.Edit(detalle_Venta);

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                ViewBag.Productos = _productosList;

                return View(detalle_Venta);
            }
        }

        // GET: FacultyController/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var detalleVenta = _detatalleVentaRepository.GetById(id);

            if (detalleVenta == null)
            {
                return NotFound();
            }

            return View(detalleVenta);
        }

        // POST: FacultyController/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                _detatalleVentaRepository.Delete(id);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return RedirectToAction(nameof(Delete), new { ID_Detalle = id, error = true });
            }
        }
    }
}
