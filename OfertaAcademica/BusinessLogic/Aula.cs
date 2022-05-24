using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Aula
    {
        DataTable table = new DataTable();

        public Acceso.Aula aula;

        public Aula()
        {
            this.aula = new Acceso.Aula();
            table.Columns.Add("Mensaje", typeof(string));
        }

        public string CrearAula( string edificio, int numero, string tipo, int Capacidad, string estado) {
            return aula.CrearAula(edificio, numero,tipo, Capacidad, estado);           
        }

        public DataTable VerAulas()
        {
            return aula.VerAulas();
        }

        public DataTable Buscar_Aula(DataBase.Aula BuscarAula)
        {

            if (BuscarAula.NumeroAula.Equals(' '))
            {
                table.Rows.Add("Vacío");
                return table;
            }
            else
            {
                return aula.BuscarAula(BuscarAula);
            }
        }

        public DataTable LlenarDatos(string sentencia)
        {
            return aula.LlenarDatos(sentencia);
        }

        public DataTable DatosAula(string sentencia)
        {
            return aula.DatosAula(sentencia);
        }

        public string Editar_Aula(string Numero, string Nombre_Nuevo, string tipo, string Capacidad, string Estado)
        {
            return aula.Editar_Aula(Numero, Nombre_Nuevo, tipo, Capacidad, Estado);
        }

    }
}
