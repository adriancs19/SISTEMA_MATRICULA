using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SistemaActivos
{
    public partial class Pruebas : System.Web.UI.Page
    {
        string con = "Server = ADRIANCS\\AJCSSERVER; database = PruebaImg; Trusted_Connection = true";
        protected void Page_Load(object sender, EventArgs e)
        {


            ConsultarImagen();
        }

        protected void btnsubir_Click(object sender, EventArgs e)
        {
            

            //Obtener img
            int Tamanio = fileimg.PostedFile.ContentLength;
            byte[] ImagenOriginal = new byte[Tamanio];
            fileimg.PostedFile.InputStream.Read(ImagenOriginal, 0, Tamanio);
            Bitmap ImagenOriginalBinaria = new Bitmap(fileimg.PostedFile.InputStream);

            // crear imagen
            System.Drawing.Image imtThumbnail;
            int TamanioThumbnail = 200;
            imtThumbnail = RedimensionarImagen(ImagenOriginalBinaria, TamanioThumbnail);
            byte[] bImagenThumbnail = new byte[TamanioThumbnail];
            ImageConverter Convertidor = new ImageConverter();
            bImagenThumbnail=(byte[])Convertidor.ConvertTo(imtThumbnail, typeof(byte[]));


            //Guardar img
            SqlConnection conexiosql = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO Imagenes(Imagen,Titulo) VALUES (@imagen, @titulo)";
            cmd.Parameters.Add("@imagen", SqlDbType.Image).Value = ImagenOriginal;
            cmd.Parameters.Add("@titulo", SqlDbType.Text).Value = txttitulo.Text;

            cmd.CommandType = CommandType.Text;
            cmd.Connection = conexiosql;
            conexiosql.Open();
            cmd.ExecuteNonQuery();

            string ImagenDataURL64 = "data:image/jpg;base64,"+Convert.ToBase64String(bImagenThumbnail);
            ImgPreview.ImageUrl = ImagenDataURL64;

            ConsultarImagen();

        }

        public System.Drawing.Image RedimensionarImagen(System.Drawing.Image ImagenOriginal, int Alto) {
            var Radio = (double)Alto / ImagenOriginal.Height;
            var NuevoAncho = (int)(ImagenOriginal.Width * Radio);
            var NuevoAlto = (int)(ImagenOriginal.Height * Radio);
            var NuevaImagenRedimensionada = new Bitmap(NuevoAncho, NuevoAlto);
            var g = Graphics.FromImage(NuevaImagenRedimensionada);
            g.DrawImage(ImagenOriginal, 0, 0, NuevoAncho, NuevoAlto);

            return NuevaImagenRedimensionada;
        }

        protected void ConsultarImagen() {
            SqlConnection conexionSQL = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Imagen,Titulo FROM Imagenes ORDER BY ID ASC";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conexionSQL;
            conexionSQL.Open();

            DataTable ImagenesBD = new DataTable();
            ImagenesBD.Load(cmd.ExecuteReader());

            TargetasEdificios.DataSource = ImagenesBD;
            TargetasEdificios.DataBind();
            conexionSQL.Close();
        }
    }
}