using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class GrupoCambiar : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        DataBase.DataBase info = new DataBase.DataBase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GV_LeerAulas.DataSource = info.consultaDataTable("select b.CodigoMateria, a.Carrera, b.grupo, b.NumeroAula, b.horario, b.dia, b.Hora_Inicio, b.Hora_Salida from OfertaAcademica A inner" +
                " join aulasAsignadas B on (A.Codigo = B.CodigoMateria and a.Grupo = b.grupo)where B.CodigoMateria = A.Codigo");
                GV_LeerAulas.DataBind();
            }
        }

        protected void GV_LeerAulas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
            string grupo = GV_LeerAulas.Rows[e.RowIndex].Cells[1].Text;
            string codigo = GV_LeerAulas.Rows[e.RowIndex].Cells[3].Text;
            Response.Redirect("GrupoCambiarConfirmacion.aspx?numero=" + grupo + "&grupo=" + codigo+"&aula=" + GV_LeerAulas.Rows[e.RowIndex].Cells[4].Text);

        }
    }
}