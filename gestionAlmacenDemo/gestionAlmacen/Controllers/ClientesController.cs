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
        public ActionResult Details(int ID_Cliente)
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
        public ActionResult Edit(int ID_Cliente)
        {
            var mClientes = _clientesRepository.GetById(ID_Cliente);

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
        public ActionResult Delete(int ID_Cliente)
        {
            var mClientes = _clientesRepository.GetById(ID_Cliente);

            if (mClientes == null)
            {
                return NotFound();
            }

            return View(mClientes);
        }

        //Se elimina el cliente
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(MClientes mClientes)
        {
            try
            {
                _clientesRepository.Delete(mClientes.ID_Cliente);

                TempData["message"] = "Dato eliminado exitosamente";

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return View(mClientes);
            }
        }


    }
}
