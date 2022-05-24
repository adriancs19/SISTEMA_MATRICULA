using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class Edificios : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        DataTable tableValidar = new DataTable();
        BusinessLogic.Edificio edificios = new BusinessLogic.Edificio();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem i;
            i = new ListItem("Habilitado", "Habilitado");
            Dispo.Items.Add(i);
            i = new ListItem("Innabilitado", "Innabilitado");
            Dispo.Items.Add(i);
        }

        protected void GuardarEdificio_Click(object sender, EventArgs e)
        {
            try
            {
                int Tamanio = ImagenEdificio.PostedFile.ContentLength;

                byte[] ImagenOriginal = new byte[Tamanio];
                ImagenEdificio.PostedFile.InputStream.Read(ImagenOriginal, 0, Tamanio);
                Bitmap ImagenOriginalBinaria = new Bitmap(ImagenEdificio.PostedFile.InputStream);

                // crear imagen
                System.Drawing.Image imtThumbnail;
                int TamanioThumbnail = 200;
                imtThumbnail = RedimensionarImagen(ImagenOriginalBinaria, TamanioThumbnail);
                byte[] bImagenThumbnail = new byte[TamanioThumbnail];
                ImageConverter Convertidor = new ImageConverter();
                bImagenThumbnail = (byte[])Convertidor.ConvertTo(imtThumbnail, typeof(byte[]));
          
    

            string Nombre = name.Text;
            string Provincia = provincia.Text;
            string Aulas = aulas.Text;
            string Laboratorios = laboratorios.Text;
            string Disponibilidad = Dispo.SelectedValue.ToString();



            if (Nombre.Equals(""))
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Campo Nombre del Edificio está Vacío');", true);
            }
            else
            {
                tableValidar = edificios.Buscar_Edificio(new DataBase.Edificio
                { Nombre = Nombre });
            }
            if (tableValidar.Rows.Count == 0)
            {
                //Guardar img
                try
                {
                    edificios.CrearEdificio(Nombre, ImagenOriginal, Provincia, Aulas, Laboratorios, Disponibilidad);
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Edificio Registrado');", true);
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se pudo registrar el Edificio');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Ya hay un Edificio Registrado con ese Nombre');", true);
            }
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se ha Seleccionado una Imagen');", true);
            }

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
    }
}