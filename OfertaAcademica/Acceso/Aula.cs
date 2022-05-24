using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso
{
    public class Aula
    {
        public DataBase.DataBase data;

        public Aula()
        {
            this.data = new DataBase.DataBase();
        }

        public string CrearAula(string NombreEdificio, int NumeroAula, string Tipo, int Capacidad, string EstadoAula)
        {

                return data.ejecutarProcedimiento_Save("Oferta_Academica",
                new string[] { "option", "N_aula", "Nombre_Edificio", "Tipo ", "Capacidad", "Estado_Aula" },
                new string[] { "INSERT_AULA", NumeroAula.ToString(), NombreEdificio, Tipo, Capacidad.ToString(), EstadoAula }
                );

        }

        public DataTable VerAulas()
        {
            return data.ejecutarProcedimiento(
                "Oferta_Academica",
                new string[] { "option" },
                new string[] { "SELECT_AULA", }
                );
        }

        public DataTable BuscarAula(DataBase.Aula BuscarAula)
        {
            return data.ejecutarProcedimiento(
                "Oferta_Academica",
                new string[] { "option", "N_aula" },
                new string[] { "BUSCAR_AULA", BuscarAula.NumeroAula}

                );
        }

        public DataTable LlenarDatos(string Sentencia)
        {
            return data.LenarDatos(Sentencia);
        }

        public DataTable DatosAula(string sentencia)
        {
            return data.LenarDatos(sentencia);
        }

        public string Editar_Aula(string Numero, string Numero_Nuevo, string tipo, string Capacidad, string Estado)
        {
            return data.ejecutarProcedimiento_Save(
                 "Oferta_Academica",
                 new string[] { "option", "N_aula", "Numero_Nuevo", "Tipo", "Capacidad", "Estado_Aula" },
                 new string[] { "EDIT_AULA", Numero, Numero_Nuevo, tipo, Capacidad, Estado}
                 );
        }

    }

}

