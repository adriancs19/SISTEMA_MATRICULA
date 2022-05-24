using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class InicioLogin : System.Web.UI.Page
    {
        DataTable tableUser = new DataTable();
        DataTable tableContra = new DataTable();
        DataTable tableRol= new DataTable();
        DataTable tableNombre= new DataTable();

        BusinessLogic.Usuario user = new BusinessLogic.Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            string Usuario = txtUsuario.Text;

            if (Usuario.ToString().Equals(""))
            {
                ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Campo de Usuario Vacío');", true);
            }
            else
            {
                tableUser = user.Buscar_Usuario(new DataBase.Usuarios
                { Usuario = Usuario.ToString() });
            }
            if (tableUser.Rows.Count == 0)
            {
                try
                {

                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No hay ningún Usuario Registrado con ese Nombre de Usuario');", true);

                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Surgio un Error');", true);
                }
            }
            else
            {
                string contratext = TxtContra.Text;
                string Contraseña = ValorContraseña(Usuario);
       
                if (contratext == Contraseña) {
                    string Rol = ValorRol(Usuario,contratext);
                    if (Rol== "Carga Oferta")
                    {
                        Response.Redirect("CargarCupos.aspx");
                    } 

                    if (Rol == "Distribucion") {
                        Response.Redirect("Edificios.aspx");
                    }

                    if(Rol == "Director"){
                        Response.Redirect("DirectorSolicitud.aspx");
                    }

                    if (Rol == "Estudiante")
                    {
                        string nombre = NombreUser(Usuario);
                        Response.Redirect("Estudiante.aspx?Usuario=" + Usuario);
                    }

                    if (Rol == "Profesor")
                    {
                        string nombre = NombreUser(Usuario);
                        Response.Redirect("Profesor.aspx?Nombre=" + nombre);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('La Contraseña NO Coincide con el Usuario');", true);
                }
                //ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Ya hay un Aula Registrada con ese Numero o Nombre');", true);
            }
        }

        public string ValorContraseña( string usuario) {
            tableContra = user.ContraUsuario(usuario);
            string contraseña = tableContra.Rows[0][0].ToString();
            return contraseña;
        }

        public string ValorRol(string usuario, string Contraseña)
        {
            tableRol = user.RolUsuario(usuario, Contraseña);
            string Rol = tableRol.Rows[0][0].ToString();
            return Rol;
        }

        public string NombreUser(string usuario)
        {
            tableNombre = user.NombreUsuario(usuario);
            string Nombre = tableNombre.Rows[0][0].ToString();
            return Nombre;
        }
    }
}