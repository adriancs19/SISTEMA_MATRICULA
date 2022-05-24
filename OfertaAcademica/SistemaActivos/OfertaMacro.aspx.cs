using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class OfertaMacro : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Oferta oferta = new BusinessLogic.Oferta();
        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        protected void Page_Load(object sender, EventArgs e)
        {

            string sentenciaEdificio = "select Nombre from Edificios";

            if (!IsPostBack)
            {
                table = aula.LlenarDatos(sentenciaEdificio);
                this.txtedificio.DataSource = table;
                this.txtedificio.DataValueField = "Nombre";
                this.txtedificio.DataTextField = "Nombre";
                this.txtedificio.DataBind();
            }
        }

        protected void btn_mostrar_Click(object sender, EventArgs e)
        {
            
            string Edificio = txtedificio.SelectedValue.ToString();
            table = oferta.OfertaMacro(Edificio);
            if (table.Rows.Count == 0)
            {
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Aún no hay Oferta Macro del Edificio Seleccionado');", true);
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Ha surgido un error');", true);
                }
            }
            else
            {
                TargetasAulas.DataSource = table;
                TargetasAulas.DataBind();
            }
        }
    }
}