using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class DirectorSolicitud : System.Web.UI.Page
    {
        DataTable table1 = new DataTable();
        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        DataBase.DataBase info = new DataBase.DataBase();
        protected void Page_Load(object sender, EventArgs e)
        {
            table1 = info.consultaDataTable("select * from solicitud");
            if (table1.Rows.Count != 0)
            {
                var uniqueRows = table1.AsEnumerable().Distinct(DataRowComparer.Default);
                DataTable myUniqueData = uniqueRows.CopyToDataTable();

                int j = table1.Rows.Count;
                GV_LeerAulas.DataSource = myUniqueData;

                GV_LeerAulas.DataBind();
            }


        }

        protected void GV_LeerAulas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            info.eliminarsolicitud(GV_LeerAulas.Rows[e.RowIndex].Cells[2].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[4].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[5].Text);
            try
            {

         
            info.asignacionAula(GV_LeerAulas.Rows[e.RowIndex].Cells[2].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[5].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[9].Text,
               GV_LeerAulas.Rows[e.RowIndex].Cells[9].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[10].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[8].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[4].Text);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('El grupo asignado aula con exito con exito'); window.location='" +
            Request.ApplicationPath + "DirectorSolicitud.aspx';", true);
            }
            catch (Exception)
            {

              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                "alert('El grupo ya esta asignado o el aula esta ocupada'); window.location='" +
                Request.ApplicationPath + "DirectorSolicitud.aspx';", true);
            }

        }



        protected void GV_LeerAulas_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GV_LeerAulas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            info.eliminarsolicitud(GV_LeerAulas.Rows[e.RowIndex].Cells[2].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[4].Text, GV_LeerAulas.Rows[e.RowIndex].Cells[5].Text);
            //ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El grupo asignado aula con exito con exito" +"');", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
"alert('La solicitud fue rechasada'); window.location='" +
Request.ApplicationPath + "DirectorSolicitud.aspx';", true);

        }

    }
}