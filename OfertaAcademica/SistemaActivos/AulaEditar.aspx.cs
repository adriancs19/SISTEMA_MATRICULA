using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class AulaEditar : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem i;
            i = new ListItem("Habilitada", "Habilitada");
            Dispo.Items.Add(i);
            i = new ListItem("Innabilitada", "Innabilitada");
            Dispo.Items.Add(i);

            ListItem b;
            b = new ListItem("Aula", "Aula");
            TipoAula.Items.Add(b);
            b = new ListItem("Laboratorio", "Laboratorio");
            TipoAula.Items.Add(b);

            if (!IsPostBack)
            {
                Datos_Aula();
            }
        }

        protected void EdiarAula_Click(object sender, EventArgs e)
        {
            string Nom_Aula = Request.QueryString["numero"].ToString();
            string Nombre = name.Text;
            string tipo = TipoAula.SelectedValue.ToString();
            string capacidad = txtCapacidad.Text;
            string estado = Dispo.SelectedValue.ToString();


            try
            {
                string EditarAula = aula.Editar_Aula(Nom_Aula, Nombre, tipo, capacidad, estado);
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('La Aula ha sido Actualizada');", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se pudo Actualizar la Aula');", true);
            }
        }

        public void Datos_Aula()
        {
            string Cod_Aula = Request.QueryString["numero"].ToString();
            name.Text = Cod_Aula;

            string Sentencia = "SELECT * FROM Aulas WHERE NumeroAula ='"+Cod_Aula+"'";
            table = aula.DatosAula(Sentencia);

            string edificio = table.Rows[0][0].ToString();
            string tipo = table.Rows[0][2].ToString();
            string capacidad = table.Rows[0][3].ToString();
            string estado = table.Rows[0][4].ToString();

            txtEdificio.Text = edificio;
            name.Text = Cod_Aula;
            LbTipo.Text = "  -  Actual: " + tipo;
            txtCapacidad.Text = capacidad;
            LbEstado.Text = "  -  Actual: " + estado;
        }
    }
}