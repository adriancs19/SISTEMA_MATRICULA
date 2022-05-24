using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class CuposManuales
    {
        DataTable table = new DataTable();

        public Acceso.CuposManuales cupos;

        public CuposManuales()
        {
            this.cupos = new Acceso.CuposManuales();
            table.Columns.Add("Mensaje", typeof(string));
        }

        public DataTable CargaCupos(string dia, string inicio)
        {
            return cupos.CargaCupos(dia, inicio);
        }
    }
}
