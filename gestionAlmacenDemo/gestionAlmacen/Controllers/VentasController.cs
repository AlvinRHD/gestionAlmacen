using gestionAlmacen.Models;
using gestionAlmacen.Repositories.Ventas;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace gestionAlmacen.Controllers
{
    public class VentasController : Controller
    {
        private readonly IVentasRepository _ventasRepository;
        private SelectList _clientesList;

        public VentasController(IVentasRepository ventasRepository)
        {
            _ventasRepository = ventasRepository;
            //El SelectList solo acepta dos parametros
            _clientesList = new SelectList(
                                        _ventasRepository.GetAllClientes(),
                                        nameof(MClientes.ID_Cliente),
                                        nameof(MClientes.Nombre)
                                        //nameof(MClientes.Direccion),
                                        //nameof(MClientes.Telefono),                                      
                                        //nameof(MClientes.CorreoElectronico)
                                    );
        }

        // GET: VentasController
        public ActionResult Index()
        {
            return View(_ventasRepository.GetAll());
        }

        // GET: VentasController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: VentasController/Create
        
        public ActionResult Create()
        {
            //Es la carpeta de los repositorios
            ViewBag.Clientes = _clientesList;

            return View();
        }

        // POST: VentasController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MVentas mVentas)
        {
            try
            {
                _ventasRepository.Add(mVentas);
                return RedirectToAction(nameof(Index));
            }
            catch(Exception ex)
            {
                ViewBag.Clientes = _clientesList;
                return View(mVentas);
            }
        }

        // GET: VentasController/Edit/5
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var mVentas = _ventasRepository.GetById(id);

            _clientesList = new SelectList(
                                        _ventasRepository.GetAllClientes(),
                                        nameof(MClientes.ID_Cliente),
                                        nameof(MClientes.Nombre),
                                        mVentas?.MClientes?.ID_Cliente
                                    );

            ViewBag.Clientes = _clientesList;

            return View(mVentas);
        }

        // POST: VentasController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MVentas mVentas)
        {
            try
            {
                _ventasRepository.Edit(mVentas);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                ViewBag.Clientes = _clientesList;
                return View(mVentas);
            }
        }

        // GET: VentasController/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var mVentas = _ventasRepository.GetById(id);

            if (mVentas == null)
            {
                return NotFound();
            }

            return View(mVentas);
        }

        // POST: VentasController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                _ventasRepository.Delete(id);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return RedirectToAction(nameof(Delete), new { ID_Venta = id, error = true });

            }
        }
    }
}
