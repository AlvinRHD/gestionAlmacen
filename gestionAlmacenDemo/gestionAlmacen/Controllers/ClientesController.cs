using gestionAlmacen.Models; 
///
using gestionAlmacen.Repositories.Clientes;
using gestionAlmacen.Services.Email;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

namespace gestionAlmacen.Controllers
{
    public class ClientesController : Controller
    {
        private readonly IClientesRepository _clientesRepository;
        private readonly IEmailService _emailService;

        public ClientesController(IClientesRepository clientesRepository, IEmailService emailService)
        {
            _clientesRepository = clientesRepository;
            _emailService = emailService;
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

                string email = "equipo4calculadora@gmail.com";
                string subject = "Bienvenido al sistema";
                string body = "Bienvenido al sistema de gestion de almacen " + mClientes.Nombre;

                _emailService.SendEmail(email, mClientes.Nombre, subject, body);

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
                TempData["message"] = "Error al eliminar el cliente: " + ex.Message;
                ViewBag.errror = ex.Message;
                return View(mClientes);
            }
        }
    }
}
