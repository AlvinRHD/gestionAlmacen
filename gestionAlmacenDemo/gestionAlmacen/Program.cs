using gestionAlmacen.Data;
using gestionAlmacen.Repositories.Clientes;

namespace gestionAlmacen
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            //
            builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
            //
            builder.Services.AddScoped<IClientesRepository, ClientesRepository>();

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
