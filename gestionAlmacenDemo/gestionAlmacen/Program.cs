using gestionAlmacen.Data;
using gestionAlmacen.Repositories.Clientes;
using gestionAlmacen.Repositories.DetalleVenta;
using gestionAlmacen.Repositories.Productos;
using gestionAlmacen.Repositories.Ventas;
using gestionAlmacen.Repositories.Categorias;
using gestionAlmacen.Repositories.Proveedores;
using Microsoft.AspNetCore.Identity.UI.Services;
using gestionAlmacen.Services.Email;

namespace gestionAlmacen
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddTransient <IEmailService, EmailService>();
            //
            builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
            //
            builder.Services.AddScoped<ICategoriasRepository, CategoriasRepository>();
            //
            builder.Services.AddScoped<IClientesRepository, ClientesRepository>();
            //
            builder.Services.AddScoped<IVentasRepository, VentasRepository>();
            //
            builder.Services.AddScoped<IDetalleVentasRepository, DetalleVentasRepository>();
            //
            builder.Services.AddScoped<IProductosRepository, ProductosRepository>();
            //
            builder.Services.AddScoped<IProveedoresRepository, ProveedoresRepository>();

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
