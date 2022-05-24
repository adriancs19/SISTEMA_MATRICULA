using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class AulaLeer : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        DataTable TableCantidad = new DataTable();
        BusinessLogic.Aula aulas = new BusinessLogic.Aula();
        protected void Page_Load(object sender, EventArgs e)
        {
            float CantidadAulas = ValidarCantidad();

            if (CantidadAulas>=15)
            {
                GV_LeerAulas.DataSource = aulas.VerAulas();
                GV_LeerAulas.DataBind();
            }
            else
            {
                table = aulas.VerAulas();
                TargetasAulas.DataSource = table;
                TargetasAulas.DataBind();
            }

        }

        protected void BtnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            
            string cod = txtaula.Text;

            if (cod.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Campo de Numero de Aula está Vacío');", true);
            }
            else
            {
                table = aulas.Buscar_Aula(new DataBase.Aula
                { NumeroAula = cod });
            }
            if (table.Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se Encontraron Registros del Aula Buscada');", true);
            }
            else
            {
                GV_LeerAulas.DataSource = table;
                GV_LeerAulas.DataBind();
            }
        }

        protected void btn_mostrar_Click(object sender, EventArgs e)
        {
            GV_LeerAulas.DataSource = aulas.VerAulas();
            GV_LeerAulas.DataBind();
        }

        protected void GV_LeerAulas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Cod_Aula = GV_LeerAulas.Rows[e.RowIndex].Cells[1].Text;
            Response.Redirect("AulaEditar.aspx?Numero="+Cod_Aula);    
        }

        public float ValidarCantidad()
        {
            string sentencia = "SELECT NumeroAula FROM Aulas";

            TableCantidad = aulas.LlenarDatos(sentencia);
            float TotalLabs = TableCantidad.Rows.Count;

            return TotalLabs;
        }
    }

    
}