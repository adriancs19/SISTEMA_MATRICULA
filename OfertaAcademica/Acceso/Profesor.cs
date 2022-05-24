using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso
{
    public class Profesor
    {
        DataTable table = new DataTable();
        public DataBase.DataBase data;

        public Profesor()
        {
            this.data = new DataBase.DataBase();
        }


        public DataTable VistaProfesor(string profe)
        {
            return data.ejecutarProcedimiento(
                "Profesor",
                new string[] { "option", "NombreProfe" },
                new string[] { "VER_PROFE", profe }

                );
        }

        public DataTable VistaEstudiante(string Estudiante)
        {
            return data.ejecutarProcedimiento(
                "Profesor",
                new string[] { "option", "NombreProfe" },
                new string[] { "VER_Estudiante", Estudiante }

                );
        }
    }
}
