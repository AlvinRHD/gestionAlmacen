using gestionAlmacen.Models; ///
using gestionAlmacen.Repositories.Clientes;
using Microsoft.AspNetCore.Mvc;

namespace gestionAlmacen.Controllers
{
    public class ClientesController : Controller
    {
        private readonly IClientesRepository _clientesRepository;

        public ClientesController(IClientesRepository clientesRepository)
        {
            _clientesRepository = clientesRepository;
        }

        //Se muestra la vista index del cliente
        public ActionResult Index()
        {
            return View(_clientesRepository.GetAll());
        }

        //
        public ActionResult Details(int id)
        {
            return View();
        }

        //Muestra la vista para agregar un nuevo cliente
        public ActionResult Create()
        {
            return View();
        }

        //Añade el cliente nuevo
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MClientes mClientes)
        {
            try
            {
                _clientesRepository.Add(mClientes);

                TempData["message"] = "Datos guardados exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;

                return View(mClientes);
            }
        }

        //Muestra la vista de editar Cliente
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var mClientes = _clientesRepository.GetById(id);

            if (mClientes == null)
            {
                return NotFound();
            }

            return View(mClientes);
        }

        //Se edita el cliente
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MClientes mClientes)
        {
            try
            {
                _clientesRepository.Edit(mClientes);

                TempData["message"] = "Datos editados correctamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(mClientes);
            }
        }

        //Muestra la vista de elminar
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var mClientes = _clientesRepository.GetById(id);

            if (mClientes == null)
            {
                return NotFound();
            }

            return View(mClientes);
        }

        //Se elimina el cliente
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                _clientesRepository.Delete(id);

                TempData["message"] = "Dato eliminado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["message"] = "Error al eliminar el cliente: " + ex.Message;
                return RedirectToAction(nameof(Delete), new { ID_Cliente = id, error = true });
            }
        }

    }
}
