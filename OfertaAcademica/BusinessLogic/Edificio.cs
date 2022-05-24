using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class Edificio
    {
        DataTable table = new DataTable();

        public Acceso.Edificio edificio;

        public Edificio()
        {
            this.edificio = new Acceso.Edificio();
            table.Columns.Add("Mensaje", typeof(string));
        }

        public void CrearEdificio(string Nombre, byte[]imagen ,string Provincia, string Aulas, string Labo, string Dispo)
        {
           edificio.CrearEdificio(Nombre, imagen, Provincia, Aulas, Labo, Dispo);
        }

        public DataTable VerEdificios() {
            return edificio.VerEdificios();
        }

        public DataTable Buscar_Edificio(DataBase.Edificio BuscarEdificio)
        {

            if (BuscarEdificio.Nombre.Equals(' '))
            {
                table.Rows.Add("Vacío");
                return table;
            }
            else
            {
                return edificio.BuscarEdificio(BuscarEdificio);
            }
        }

        public DataTable DatosEdificio(string sentencia)
        {
            return edificio.DatosEdificio(sentencia);
        }

        public string Editar_Edificio(string Nombre, string Nombre_Nuevo, string Provincia, string Aulas, string Labo, string Dispo)
        {
            return edificio.Editar_Edificio(Nombre,Nombre_Nuevo,Provincia,Aulas,Labo,Dispo);
        }
    }
}
