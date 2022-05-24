using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class OfertaAutomatica : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.CargarCupos carga = new BusinessLogic.CargarCupos();
        BusinessLogic.Oferta email = new BusinessLogic.Oferta();
        DataBase.EnviarMail enviar = new DataBase.EnviarMail();

        string sentencia = "select Email from Usuarios_Sistema where Usuario='123456789'";
        string mensaje = "Se le informa que en sistema ya se encuentra sus cursos asignados  a las " +
            "diferentes aulas con sus repectivos horaios ";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ProcesoAutomatico_Click(object sender, EventArgs e)
        {
            try
            {
                DataBase.DataBase data = new DataBase.DataBase();
                data.asignacion();
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Proceso Automático Realizado con Éxito ');", true);
                string email = ExtraerCorreo(sentencia);
                string Envio = enviar.EnviarCorreo(mensaje, email);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Proceso Automático Fallido ');", true);
            }
        }

        public string ExtraerCorreo(string sentencia)
        {
            table = email.EmailDistribucion(sentencia);
            string correo = table.Rows[0][0].ToString();
            return correo;
        }
    }
}