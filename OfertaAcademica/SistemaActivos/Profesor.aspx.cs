using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class Profesor : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Profesor profe = new BusinessLogic.Profesor();

        protected void Page_Load(object sender, EventArgs e)
        {
            string Profesor = Request.QueryString["nombre"].ToString();
            table = profe.DatosProfe(Profesor);
            if (table.Rows.Count == 0)
            {
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Aún no Tiene Registro de Cursos Asignados');", true);
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Ha surgido un error');", true);
                }
            }
            else
            {
                TargetasCursos.DataSource = table;
                TargetasCursos.DataBind();
            }
        }
    }
}