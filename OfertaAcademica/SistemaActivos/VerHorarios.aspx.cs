using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class VerHorarios : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Horario horario = new BusinessLogic.Horario();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sentencia= "SELECT Turno,Hora_Inicio,Hora_Salida from Horarios";
            table = horario.VerHorario(sentencia);
            TargetasHorarios.DataSource = table;
            TargetasHorarios.DataBind();
        }
    }
}