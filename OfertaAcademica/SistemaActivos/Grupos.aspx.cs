using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class Grupos : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        DataBase.DataBase info = new DataBase.DataBase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GV_LeerAulas.DataSource = info.consultaDataTable("select A.Codigo, a.Materia, a.Grupo,a.Carrera,A.dia,a.cupos,a.Matricula,a.Inicio,a.Salida from OfertaAcademica A left join aulasAsignadas B on(A.Codigo = B.CodigoMateria) where B.CodigoMateria is null");
                GV_LeerAulas.DataBind();
            }


        }

        protected void GV_LeerAulas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Cod_Aula = GV_LeerAulas.Rows[e.RowIndex].Cells[1].Text;
            string grupo = GV_LeerAulas.Rows[e.RowIndex].Cells[3].Text;
            Response.Redirect("GrupoAsignacion.aspx?Numero=" + Cod_Aula + "&grupo=" + grupo);
        }
    }
}