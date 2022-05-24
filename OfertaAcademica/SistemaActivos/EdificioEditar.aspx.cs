using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class EdificioEditar : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Edificio edificios = new BusinessLogic.Edificio();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Nombre.Text = Request.QueryString["nombre"].ToString();
            ListItem i;
            i = new ListItem("Habilitado", "Habilitado");
            Dispo.Items.Add(i);
            i = new ListItem("Innabilitado", "Innabilitado");
            Dispo.Items.Add(i);

            if (!IsPostBack)
            {
                Datos_Edificio();
            }

            
        }

        protected void GuardarEdificio_Click(object sender, EventArgs e)
        {
            string Nom_Edificio = Request.QueryString["nombre"].ToString();
            string Nombre=name.Text;
            string Direccion = provincia.Text;
            string Aulas = Naulas.Text;
            string Laboratorios = Nlaboratorios.Text;
            string Disponibilidad = Dispo.SelectedValue.ToString();

            try
            {
                string EditarEdificio = edificios.Editar_Edificio(Nom_Edificio,Nombre,Direccion,Aulas,Laboratorios,Disponibilidad);
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Edificio ha sido Actualizado');", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se pudo Actualizar el Edificio');", true);
            }
        }

        public void Datos_Edificio() {
            string edificio = Request.QueryString["nombre"].ToString();
            name.Text = edificio;

            string Sentencia = "SELECT Nombre,Provincia, NumeroAulas, NumeroLavoratorio,Disponibilidad FROM Edificios WHERE Nombre = '" + edificio+"'";
            table = edificios.DatosEdificio(Sentencia);

            string direccion = table.Rows[0][1].ToString();
            string aulas = table.Rows[0][2].ToString();
            string laboratorios = table.Rows[0][3].ToString();
            string dsiponibilidad = table.Rows[0][4].ToString();

            provincia.Text = direccion;
            Naulas.Text = aulas;
            Nlaboratorios.Text = laboratorios;
            info.Text = "  -  Actual: " + dsiponibilidad;
        }
    }
}