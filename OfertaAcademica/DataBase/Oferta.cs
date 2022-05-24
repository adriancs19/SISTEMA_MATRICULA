using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Documents;

namespace DataBase
{
    public class Oferta
    {
        public string Codigo { get; set; }

        public string Materia { get; set; }

        public string Grupo { get; set; }

        public string Carrera { get; set; }

        public string Inicio_Cuatrimestre { get; set; }

        public string Final_Cuatrimestre { get; set; }

        public string Horas { get; set; }

        public string Dia { get; set; }

        public string Cupos { get; set; }

        public string Matricula { get; set; }

        public string Inicio { get; set; }

        public string Salida { get; set; }

        public string Profesor { get; set; }

    }

}
