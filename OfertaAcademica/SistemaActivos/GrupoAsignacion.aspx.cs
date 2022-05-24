using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class GrupoAsignacion : System.Web.UI.Page
    {

        public static string cupo = "";
        public static DataTable table = new DataTable();
        DataTable table1 = new DataTable();
       // BusinessLogic.CuposManuales cupos = new BusinessLogic.CuposManuales();
        DataBase.DataBase info = new DataBase.DataBase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datos_curso();
                if (table1.Rows.Count != 0)
                {
                    var uniqueRows = table1.AsEnumerable().Distinct(DataRowComparer.Default);
                    DataTable myUniqueData = uniqueRows.CopyToDataTable();

                    int j = table1.Rows.Count;
                    GV_LeerAulas.DataSource = myUniqueData;

                    GV_LeerAulas.DataBind();
                }
            }

        }


        protected void GV_LeerAulas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string j = GV_LeerAulas.Rows[e.RowIndex].Cells[7].Text;
            string g = cupo;

            if (Convert.ToInt32(GV_LeerAulas.Rows[e.RowIndex].Cells[7].Text) < Convert.ToInt32(cupo))
            {
                info.solicitud(table.Rows[0][0].ToString(), table.Rows[0][1].ToString(), table.Rows[0][2].ToString(), GV_LeerAulas.Rows[e.RowIndex].Cells[1].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[7].Text, table.Rows[0][4].ToString(), table.Rows[0][5].ToString(), table.Rows[0][6].ToString(), table.Rows[0][3].ToString());
                // ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Se agrejo una solicitud al director de carera porque el curso sobrepasa la capasidad');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
 "alert('Se agrejo una solicitud al director de carera porque el curso sobrepasa la capasidad'); window.location='" +
 Request.ApplicationPath + "Grupos.aspx';", true);
            }
            else
            {
                info.asignacionAula(table.Rows[0][0].ToString(), GV_LeerAulas.Rows[e.RowIndex].Cells[1].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[2].Text, table.Rows[0][5].ToString(), table.Rows[0][6].ToString(), table.Rows[0][3].ToString(), table.Rows[0][2].ToString());
                // ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('el curso al aula con exito');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
 "alert('El curso fue asignado con exito'); window.location='" +
 Request.ApplicationPath + "Grupos.aspx';", true);
            }
        }
        public void datos_curso()
        {
            string curso = Request.QueryString["numero"].ToString();
            string grupo = Request.QueryString["grupo"].ToString();
            table = info.consultaDataTable("select codigo,Materia,Grupo,Dia,Cupos,Inicio,Salida from OfertaAcademica where Codigo = '" + curso + "' and Grupo ='" + grupo + "'");
            txtcodigo.Text = table.Rows[0][0].ToString();
            txtmateria.Text = table.Rows[0][1].ToString();
            txtgrupo.Text = table.Rows[0][2].ToString();
            txtdia.Text = table.Rows[0][3].ToString();
            txtcupos.Text = table.Rows[0][4].ToString();
            txthorario.Text = "Hora de entrada: " + table.Rows[0][5].ToString() + " Hora de salida " + table.Rows[0][6].ToString();
            string dia = table.Rows[0][3].ToString();
            string inicio = table.Rows[0][5].ToString();
            cupo = table.Rows[0][4].ToString();
            table1.Clear();
            table1 = info.consultaDataTable("select c.* from OfertaAcademica a , HorariosAulas c where a.Dia = '"+dia+ "' and c.dia = '" + dia + "' and c.Hora_Inicio = '"+inicio+ "' and a.Inicio = '"+inicio+"' and c.estado = '0'");
           // table1 = cupos.CargaCupos(dia, inicio);


        }
    }
}