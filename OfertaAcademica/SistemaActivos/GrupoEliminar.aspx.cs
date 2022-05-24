using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class GrupoEliminar : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        DataBase.DataBase info = new DataBase.DataBase();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
                GV_LeerAulas.DataSource = info.consultaDataTable("select b.CodigoMateria,a.Materia, b.grupo, b.NumeroAula, b.horario, b.dia, b.Hora_Inicio, b.Hora_Salida from OfertaAcademica A inner" +
                " join aulasAsignadas B on (A.Codigo = B.CodigoMateria and a.Grupo = b.grupo)where B.CodigoMateria = A.Codigo");
                GV_LeerAulas.DataBind();
            
        }

        protected void GV_LeerAulas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            table = info.consultaDataTable("select codigo,Materia,Grupo,Dia,Cupos,Inicio,Salida from OfertaAcademica where Codigo = '" + GV_LeerAulas.Rows[e.RowIndex].Cells[1].Text + "' and Grupo ='" + GV_LeerAulas.Rows[e.RowIndex].Cells[3].Text + "'");
            info.eliminar1(table.Rows[0][0].ToString(), GV_LeerAulas.Rows[e.RowIndex].Cells[4].Text, table.Rows[0][5].ToString(), table.Rows[0][3].ToString(), table.Rows[0][2].ToString());

         

            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El grupo fue Eliminado del aula con exito con exito" +
                "');", true);

            GV_LeerAulas.DataSource = info.consultaDataTable("select b.CodigoMateria,a.Materia, b.grupo, b.NumeroAula, b.horario, b.dia, b.Hora_Inicio, b.Hora_Salida from OfertaAcademica A inner" +
           " join aulasAsignadas B on (A.Codigo = B.CodigoMateria and a.Grupo = b.grupo)where B.CodigoMateria = A.Codigo");
            GV_LeerAulas.DataBind();

        }
    }
}