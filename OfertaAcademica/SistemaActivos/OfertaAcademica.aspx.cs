using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class OfertaAcademica : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Oferta oferta = new BusinessLogic.Oferta();
        string Sentencia = "SELECT * FROM OfertaAcademica";
        string SentenciaHorario = "SELECT * FROM OfertaAcademica ORDER BY Inicio";
        string SentenciaCodigo = "SELECT * FROM OfertaAcademica ORDER BY Codigo";
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem i;
            i = new ListItem("Codigo", "Codigo");
            Ordenar.Items.Add(i);
            i = new ListItem("Horario", "Horario");
            Ordenar.Items.Add(i);


            GV_LeerOferta.DataSource = oferta.OfertaAcademica(Sentencia);
            GV_LeerOferta.DataBind();


        }

 
        protected void btn_mostrar_Click(object sender, EventArgs e)
        {
            try
            {
                string orden = Ordenar.SelectedValue.ToString();
                if (orden == "Codigo")
                {
                    GV_LeerOferta.DataSource = oferta.OfertaAcademica(SentenciaCodigo);
                    GV_LeerOferta.DataBind();
                }
                else if (orden == "Horario")
                {
                    GV_LeerOferta.DataSource = oferta.OfertaAcademica(SentenciaHorario);
                    GV_LeerOferta.DataBind();
                }
               
            }
            catch (Exception)
            { 
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Error al Mostrar la Oferta Académica');", true);
            }
            
        }

   
    }
}