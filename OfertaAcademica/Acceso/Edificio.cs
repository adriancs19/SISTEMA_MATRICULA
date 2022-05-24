using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso
{
    public class Edificio
    {

        public DataBase.DataBase data;

        public Edificio()
        {
            this.data = new DataBase.DataBase();
        }
        public void CrearEdificio(string Nombre, byte[]imagen, string Provincia, string Aulas, string Labo, string Dispo)
        {
            data.GuardarEdificio(Nombre,imagen,Provincia,Aulas,Labo,Dispo);
        }

        public DataTable VerEdificios()
        {
            return data.ConsultarImagen();
        }

        public DataTable BuscarEdificio(DataBase.Edificio BuscarEdificio)
        {
            return data.ejecutarProcedimiento(
                "Oferta_Academica",
                new string[] { "option", "Nombre" },
                new string[] { "BUSCAR_EDIFICIO", BuscarEdificio.Nombre }

                );
        }

        public DataTable DatosEdificio(string sentencia)
        {
            return data.LenarDatos(sentencia);
        }

        public string Editar_Edificio(string Nombre, string Nombre_Nuevo, string Provincia, string Aulas, string Labo, string Dispo)
        {
           return data.ejecutarProcedimiento_Save(
                "Oferta_Academica",
                new string[] { "option", "Nombre", "Nombre_Nuevo", "Provincia", "N_aulas", "N_laboratorios", "Disponibilidad" },
                new string[] { "EDIT_EDIFICIO",Nombre,Nombre_Nuevo,Provincia,Aulas,Labo,Dispo}
                );
        }

    }
}
