using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class CargarCupos : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.CargarCupos carga = new BusinessLogic.CargarCupos();
        BusinessLogic.Oferta email = new BusinessLogic.Oferta();
        DataBase.EnviarMail enviar = new DataBase.EnviarMail();

        string sentencia = "select Email from Usuarios_Sistema where Rol='Distribucion'";
        string mensaje = "El Proceso de Carga del archivo de Oferta Académica ha"+
            "sido Realizado, Prosiga con el proceso de Ditrbución de Aulas ";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string msj;
            string Envio = "";
            string fechaInicio = CalendarInicio.SelectedDate.ToShortDateString();
            string fechaFinal = CalendarFinal.SelectedDate.ToShortDateString();
            try
            {
                string ruta = Server.MapPath("~/archivos/" + "dsd.xlsx").ToString();
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/archivos/" + "dsd.xlsx"));
                msj = carga.cargarOferta(ruta, fechaInicio, fechaFinal);
                string email = ExtraerCorreo(sentencia);
                Envio = enviar.EnviarCorreo(mensaje,email);
            }
            catch (Exception)
            {
                Envio = "Hubo Error";
                msj ="El archivo selecionado no es valido";
            }

             
            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('" + msj + " "+Envio+"');", true);
        }

        public string ExtraerCorreo(string sentencia) {
            table = email.EmailDistribucion(sentencia);
            string correo = table.Rows[0][0].ToString();
            return correo;
        }
    }
}