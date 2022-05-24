using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class EdificioLeer : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        BusinessLogic.Edificio edificios = new BusinessLogic.Edificio();

        protected void Page_Load(object sender, EventArgs e)
        {
            table = edificios.VerEdificios();
            TargetasEdificios.DataSource = table;
            TargetasEdificios.DataBind();
        }

        public System.Drawing.Image RedimensionarImagen(System.Drawing.Image ImagenOriginal, int Alto)
        {
            var Radio = (double)Alto / ImagenOriginal.Height;
            var NuevoAncho = (int)(ImagenOriginal.Width * Radio);
            var NuevoAlto = (int)(ImagenOriginal.Height * Radio);
            var NuevaImagenRedimensionada = new Bitmap(NuevoAncho, NuevoAlto);
            var g = Graphics.FromImage(NuevaImagenRedimensionada);
            g.DrawImage(ImagenOriginal, 0, 0, NuevoAncho, NuevoAlto);

            return NuevaImagenRedimensionada;
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EdificioEditar.aspx");
        }
    }
}