using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Horario
    {
        DataTable table = new DataTable();

        public Acceso.Horario horario;

        public Horario()
        {
            this.horario = new Acceso.Horario();
            table.Columns.Add("Mensaje", typeof(string));
        }

        public DataTable VerHorario(string sentencia)
        {
            return horario.VerHorarios(sentencia);
        }
    }
}
