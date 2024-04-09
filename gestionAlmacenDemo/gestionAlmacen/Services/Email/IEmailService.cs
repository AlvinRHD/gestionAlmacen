namespace gestionAlmacen.Services.Email
{
    public interface IEmailService
    {
        void SendEmail(string emailTo, string recepientName, string subject, string body);
    }
}
