using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso
{
    public class Usuario
    {
        public DataBase.DataBase data;

        public Usuario()
        {
            this.data = new DataBase.DataBase();
        }
        public DataTable BuscarUser(DataBase.Usuarios BuscarUsuario)
        {
            return data.ejecutarProcedimiento(
                "UsuariosValidar",
                new string[] { "option", "Usuario" },
                new string[] { "BUSCAR_USUARIO", BuscarUsuario.Usuario }

                );
        }

        public DataTable ContraUser(string user)
        {
            return data.ejecutarProcedimiento(
                "UsuariosValidar",
                new string[] { "option", "Usuario" },
                new string[] { "SELECT_CONTRASEÑA", user }
                );
        }

        public DataTable RolUser(string user, string contraseña)
        {
            return data.ejecutarProcedimiento(
                "UsuariosValidar",
                new string[] { "option", "Usuario", "Contraseña" },
                new string[] { "SELECT_ROL", user, contraseña }
                );
        }

        public DataTable NombreUser(string user)
        {
            return data.ejecutarProcedimiento(
                "UsuariosValidar",
                new string[] { "option", "Usuario" },
                new string[] { "SELECT_PROFESOR", user }
                );
        }
    }
}
