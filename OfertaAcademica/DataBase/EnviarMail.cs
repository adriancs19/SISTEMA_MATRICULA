using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace DataBase
{
    public class EnviarMail
    {
        public string EnviarCorreo(string mensaje , string emaildestino) {
            string info = "";

            try
            {
                string emailorigen = "adrian19calderon@gmail.com";
                string contra = "AJCS1999";

                string asunto = "Notificación del Sistema Colegio Universitario de Cartago (CUC)";
                string mjs = "Estimado(a): Usuario." +
                    "Por este medio se le indica que:." +
                    "<h1 style='text - align:center'>TOKEN: " + mensaje + "</h1>" +


                        "<br><br>Este correo es de interés único del destinatario. Si usted lo recibió por error, elimínelo, por favor." +
                    "</ H3 > ";

                MailMessage oMailMessage = new MailMessage(emailorigen, emaildestino, asunto, mjs);

                oMailMessage.IsBodyHtml = true;

                SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
                oSmtpClient.EnableSsl = true;
                oSmtpClient.UseDefaultCredentials = false;
                oSmtpClient.Port = 587;
                oSmtpClient.Host = "smtp.gmail.com";
                oSmtpClient.Credentials = new System.Net.NetworkCredential(emailorigen, contra);

                oSmtpClient.Send(oMailMessage);

                oSmtpClient.Dispose();
                info = "Correo Enviado";
            }
            catch (Exception)
            {

                info = "Fallo al Enviar el correo";
            }
           

            return info;
        }
    }
}
