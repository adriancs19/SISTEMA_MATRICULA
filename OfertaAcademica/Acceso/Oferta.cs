using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso
{
    public class Oferta
    {
        public DataBase.DataBase data;

        public Oferta()
        {
            this.data = new DataBase.DataBase();
        }

        public DataTable OfertaAcademica(string Sentencia) {
            return data.LenarDatos(Sentencia);
        }

        public DataTable OfertaMacro(string Edificio)
        {
            return data.ejecutarProcedimiento(
                "OfertaMacro",
                new string[] { "option", "Edificio" },
                new string[] { "OFERTA_MACRO", Edificio }
                );
        }

        public DataTable EmailDistribucion(string Sentencia)
        {
            return data.LenarDatos(Sentencia);
        }
    }

}
