using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Profesor
    {
        DataTable table = new DataTable();

        public Acceso.Profesor Profe;

        public Profesor()
        {
            this.Profe = new Acceso.Profesor();
            table.Columns.Add("Mensaje", typeof(string));
        }


        public DataTable DatosProfe(string profesor)
        {
            return Profe.VistaProfesor(profesor);
        }

        public DataTable DatosEstudiante(string Estudiante)
        {
            return Profe.VistaEstudiante(Estudiante);
        }

    }
}
