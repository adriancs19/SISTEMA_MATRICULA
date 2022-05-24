using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class DirectorOferta : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Oferta oferta = new BusinessLogic.Oferta();
        string Sentencia = "SELECT * FROM OfertaAcademica";

        protected void Page_Load(object sender, EventArgs e)
        {
            GV_LeerOferta.DataSource = oferta.OfertaAcademica(Sentencia);
            GV_LeerOferta.DataBind();
        }
    }
}