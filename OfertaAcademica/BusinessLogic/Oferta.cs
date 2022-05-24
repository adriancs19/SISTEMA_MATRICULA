using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Oferta
    {
        DataTable table = new DataTable();

        public Acceso.Oferta oferta;

        public Oferta()
        {
            this.oferta = new Acceso.Oferta();
            table.Columns.Add("Mensaje", typeof(string));
        }

        public DataTable OfertaAcademica(string Sentencia)
        {
            return oferta.OfertaAcademica(Sentencia);
        }

        public DataTable OfertaMacro(string Edificio)
        {
            return oferta.OfertaMacro(Edificio);
        }

        public DataTable EmailDistribucion(string Sentencia)
        {
            return oferta.EmailDistribucion(Sentencia);
        }
    }

}
