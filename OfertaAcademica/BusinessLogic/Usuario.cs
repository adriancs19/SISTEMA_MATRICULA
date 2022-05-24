using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Usuario
    {
        DataTable table = new DataTable();

        public Acceso.Usuario user;

        public Usuario()
        {
            this.user = new Acceso.Usuario();
            table.Columns.Add("Mensaje", typeof(string));
        }

        public DataTable Buscar_Usuario(DataBase.Usuarios BuscarUsuario)
        {

            if (BuscarUsuario.Usuario.Equals(' '))
            {
                table.Rows.Add("Vacío");
                return table;
            }
            else
            {
                return user.BuscarUser(BuscarUsuario);
            }
        }

        public DataTable ContraUsuario(string usuario)
        {
            return user.ContraUser(usuario);
        }

        public DataTable RolUsuario(string usuario, string contraseña)
        {
            return user.RolUser(usuario, contraseña);
        }

        public DataTable NombreUsuario(string usuario)
        {
            return user.NombreUser(usuario);
        }

    }
}
