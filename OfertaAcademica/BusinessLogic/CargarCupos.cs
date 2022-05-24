using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class CargarCupos
    {
        public DataBase.DataBase data;


        public CargarCupos()
        {
            this.data = new DataBase.DataBase();
        }
        public string cargarOferta(string ruta, String inicio, string final)
        {

            return data.ofertadatabase(ruta, inicio, final);
        }
    }
}
