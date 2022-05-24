using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class NomenclaturaAulas : System.Web.UI.Page
    {
        DataTable table = new DataTable();
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
            string capacidadAula = "";
            string NumAula = "";
        }
    }
}