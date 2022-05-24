using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso
{
    public class Horario
    {
        public DataBase.DataBase data;

        public Horario()
        {
            this.data = new DataBase.DataBase();
        }

        public DataTable VerHorarios(string sentencia)
        {
            return data.LenarDatos(sentencia);
        }

    }
}
