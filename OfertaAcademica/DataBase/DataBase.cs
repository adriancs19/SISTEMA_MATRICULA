using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace DataBase
{
    public class DataBase
    {

            private string connString;
            private DataSet DataSet;

            public DataBase()
            {

            this.connString = "Server = ADRIANCS\\AJCSSERVER; database = Oferta_Academica; Trusted_Connection = true";

            this.DataSet = new DataSet();
            }

            public DataTable ejecutarProcedimiento(string procedureName, string[] paramNames, string[] valueNames)
            {
                DataSet.Tables.Clear();
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    try
                    {
                        SqlCommand sqlComm = new SqlCommand(procedureName, conn);
                        sqlComm.CommandType = CommandType.StoredProcedure;

                        for (int i = 0; i < paramNames.Length; i++)
                        {
                            sqlComm.Parameters.AddWithValue(paramNames[i], valueNames[i]);
                        }

                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = sqlComm;
                        da.Fill(DataSet);
                        return DataSet.Tables[0];

                    }
                    catch (Exception e)
                    {
                        string procedure = procedureName;
                        string[] param = paramNames;
                        string[] valueName = valueNames;
                        return null;
                    }
                }

            }

        public string ejecutarProcedimiento_Save(string procedureName, string[] paramNames, string[] valueNames)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                try
                {
                    SqlCommand sqlComm = new SqlCommand(procedureName, conn);
                    sqlComm.CommandType = CommandType.StoredProcedure;

                    for (int i = 0; i < paramNames.Length; i++)
                    {
                        sqlComm.Parameters.AddWithValue(paramNames[i], valueNames[i]);
                    }

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = sqlComm;
                    da.Fill(DataSet);
                    return "Se ha guardado";

                }
                catch (Exception e)
                {
                    string procedure = procedureName;
                    string[] param = paramNames;
                    string[] valueName = valueNames;
                    return null;
                }
            }

        }

        public void GuardarEdificio(string Nombre, byte[]Imagen,string Provincia, string Naulas, string Nlabs, string Dispo) {
            
            try
            {
                SqlConnection conexiosql = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "INSERT INTO Edificios(Nombre,Imagen,Provincia,NumeroAulas,NumeroLavoratorio,Disponibilidad) VALUES (@nombre,@imagen,@provincia,@numeroAulas,@numeroLavoratorio,@disponibilidad)";
                cmd.Parameters.Add("@nombre", SqlDbType.Text).Value = Nombre;
                cmd.Parameters.Add("@imagen", SqlDbType.Image).Value = Imagen;
                cmd.Parameters.Add("@provincia", SqlDbType.Text).Value = Provincia;
                cmd.Parameters.Add("@numeroAulas", SqlDbType.Int).Value = Convert.ToInt32(Naulas);
                cmd.Parameters.Add("@numeroLavoratorio", SqlDbType.Int).Value = Convert.ToInt32(Nlabs);
                cmd.Parameters.Add("@disponibilidad", SqlDbType.Text).Value = Dispo;

                cmd.CommandType = CommandType.Text;
                cmd.Connection = conexiosql;
                conexiosql.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                
            }

        }

        public DataTable ConsultarImagen()
        {
            SqlConnection conexionSQL = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * from Edificios";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conexionSQL;
            conexionSQL.Open();

            DataTable ImagenesBD = new DataTable();
            ImagenesBD.Load(cmd.ExecuteReader());
            conexionSQL.Close();

            return ImagenesBD;
        }

        public DataTable LenarDatos(string Sentencia)
        {

            DataTable dt = new DataTable();
            SqlConnection conexionSQL = new SqlConnection(connString);
            string query = Sentencia;

            SqlCommand cmd = new SqlCommand(query, conexionSQL);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        public string ofertadatabase(string ruta, string fechaInicio, string fechaFinal)
        {
            try
            {
                string filePath = ruta;
                System.Data.DataTable table1;
                using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
                {

                    using (var reader = ExcelReaderFactory.CreateReader(stream))
                    {

                        var result = reader.AsDataSet();

                        // Ejemplos de acceso a datos
                        table1 = result.Tables[0];
                        DataRow row = table1.Rows[0];
                        string gg = table1.Rows[1][1].ToString();

                        gg = table1.Rows[5][5].ToString();
                        string cell = row[0].ToString();
                    }
                }

                DataTable table = new DataTable();
                table.Columns.Add("codigo", typeof(string));
                table.Columns.Add("materia", typeof(string));
                table.Columns.Add("grupo", typeof(string));
                table.Columns.Add("correra", typeof(string));
                table.Columns.Add("inicio de ciclo", typeof(string));
                table.Columns.Add("fin de ciclo", typeof(string));
                table.Columns.Add("horas", typeof(string));
                table.Columns.Add("dia", typeof(string));
                table.Columns.Add("cupo", typeof(string));
                table.Columns.Add("matricula", typeof(string));

                table.Columns.Add("inico", typeof(string));
                table.Columns.Add("salida", typeof(string));
                table.Columns.Add("profesro", typeof(string));


                for (int i = 7; i < table1.Rows.Count; i++)
                {
                    try
                    {
                        if (Convert.ToInt32(table1.Rows[i][8].ToString()) - 1 <= 0 || Convert.ToInt32(table1.Rows[i][9].ToString()) - 1 <= 0)
                        {

                        }
                        else
                        {

                            table.Rows.Add(table1.Rows[i][1].ToString(), table1.Rows[i][3].ToString(), table1.Rows[i][4].ToString(), table1.Rows[2][1].ToString(), fechaInicio, fechaFinal, table1.Rows[i][7].ToString()
                                , Convert.ToInt32(table1.Rows[i][8].ToString()) - 1, Convert.ToInt32(table1.Rows[i][9].ToString()) - 1,
                                table1.Rows[i][10].ToString(), Convert.ToDateTime(table1.Rows[i][11].ToString()).ToString("HH:mm"), Convert.ToDateTime(table1.Rows[i][12].ToString()).ToString("HH:mm"), table1.Rows[i][13].ToString());
                        }
                    }
                    catch (Exception)
                    {


                    }


                }
                for (int i = 7; i < table.Rows.Count; i++)
                {
                    SqlConnection con = new SqlConnection(connString);
                    con.Open();

                    SqlCommand com = new SqlCommand();
                    com.Connection = con;
                    com.CommandType = CommandType.StoredProcedure;
                    com.CommandText = "Oferta_Academic";

                    com.Parameters.Add("@Codigo", SqlDbType.NVarChar).Value = table.Rows[i][0].ToString();
                    com.Parameters.Add("@Materia", SqlDbType.NVarChar).Value = table.Rows[i][1].ToString();
                    com.Parameters.Add("@Grupo", SqlDbType.NVarChar).Value = table.Rows[i][2].ToString();
                    com.Parameters.Add("@Carrera", SqlDbType.NVarChar).Value = table.Rows[i][3].ToString();
                    com.Parameters.Add("@Inicio_Cuatrimestre", SqlDbType.NVarChar).Value = table.Rows[i][4].ToString();
                    com.Parameters.Add("@Final_Cuatrimestre", SqlDbType.NVarChar).Value = table.Rows[i][5].ToString();

                    com.Parameters.Add("@Horas", SqlDbType.NVarChar).Value = table.Rows[i][6].ToString();
                    com.Parameters.Add("@Matricula", SqlDbType.NVarChar).Value = table.Rows[i][8].ToString();
                    com.Parameters.Add("@dia", SqlDbType.NVarChar).Value = table.Rows[i][9].ToString();
                    com.Parameters.Add("@Cupos", SqlDbType.NVarChar).Value = table.Rows[i][7].ToString();

                    com.Parameters.Add("@Inicio", SqlDbType.NVarChar).Value = table.Rows[i][10].ToString();
                    com.Parameters.Add("@Salida", SqlDbType.NVarChar).Value = table.Rows[i][11].ToString();
                    com.Parameters.Add("@Profesor", SqlDbType.NVarChar).Value = table.Rows[i][12].ToString();

                    com.ExecuteNonQuery();
                    con.Close();

                }
                return "Se agrego con Éxito";
            }
            catch (Exception)
            {

                return "El archivo selcecionado no tiene el formato correcto";
            }

        }

        public void HorariosCarga(string idAula, string capasida)
        {
            DataTable horarios = new DataTable();
            horarios = consultaDataTable("select * from Horarios");
            DataTable dias = new DataTable();
            dias = consultaDataTable("select Key_Dia from Dias");

            for (int i = 0; i < dias.Rows.Count; i++)
            {
                for (int j = 0; j < horarios.Rows.Count; j++)
                {
                    SqlConnection conexionSQL = new SqlConnection(connString);
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "insert HorariosAulas values('" + idAula + "','" + horarios.Rows[j][0] + "','" + horarios.Rows[j][1] + "','" + horarios.Rows[j][2] + "','" + dias.Rows[i][0] + "','0'," + capasida + ")";
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexionSQL;
                    conexionSQL.Open();

                    cmd.ExecuteNonQuery();
                    conexionSQL.Close();

                }
            }

            return;

        }

        public String asignacion()
        {
            DataTable cursos = new DataTable();
            cursos = consultaDataTable("select Codigo,dia,Inicio,Salida,Grupo,Matricula  from OfertaAcademica");
            DataTable horariosaulas = new DataTable();
            horariosaulas = consultaDataTable("select * from HorariosAulas");

            for (int i = 0; i < cursos.Rows.Count; i++)
            {
                string gg5 = cursos.Rows[i][0].ToString();
                Boolean valido = true;
                for (int j = 0; j < horariosaulas.Rows.Count; j++)
                {
                    DataTable registrado = new DataTable();

                    registrado = consultaDataTable("select * from aulasAsignadas where CodigoMateria = '" + cursos.Rows[i][0].ToString() + "' AND dia = '" + horariosaulas.Rows[j][4].ToString() +
                        "' and Hora_Inicio = '" + horariosaulas.Rows[j][2].ToString() + "'and grupo= '" + cursos.Rows[i][4].ToString() + "'");
                    if (registrado.Rows.Count == 1)
                    {
                        valido = false;
                    }

                }
                if (valido)
                {
                    for (int k = 0; k < horariosaulas.Rows.Count; k++)
                    {
                        int j = k;
                        DataTable horarios = new DataTable();
                        horarios = consultaDataTable("select * from HorariosAulas");
                        if (cursos.Rows[i][1].ToString() == horarios.Rows[j][4].ToString() && cursos.Rows[i][2].ToString() == horarios.Rows[j][2].ToString() || cursos.Rows[i][2].ToString() == "14:00")
                        {

                            if (Convert.ToInt32(horarios.Rows[j][5].ToString()) == 0 && Convert.ToInt32(horarios.Rows[j][6].ToString()) >= Convert.ToInt32(cursos.Rows[i][5].ToString()))
                            {


                                SqlConnection con = new SqlConnection(connString);
                                string gg = horarios.Rows[j][5].ToString();

                                con.Open();

                                SqlCommand com = new SqlCommand();
                                com.Connection = con;
                                com.CommandType = CommandType.StoredProcedure;
                                com.CommandText = "asignacion";

                                com.Parameters.Add("@CodigoMateria", SqlDbType.NVarChar).Value = cursos.Rows[i][0].ToString();
                                com.Parameters.Add("@NumeroAula", SqlDbType.NVarChar).Value = horarios.Rows[j][0].ToString();
                                com.Parameters.Add("@horario", SqlDbType.NVarChar).Value = horarios.Rows[j][1].ToString();
                                com.Parameters.Add("@Hora_Inicio", SqlDbType.NVarChar).Value = horarios.Rows[j][2].ToString();
                                com.Parameters.Add("@Hora_Salida", SqlDbType.NVarChar).Value = horarios.Rows[j][3].ToString();
                                com.Parameters.Add("@dia", SqlDbType.NVarChar).Value = horarios.Rows[j][4].ToString();
                                com.Parameters.Add("@grupo", SqlDbType.NVarChar).Value = cursos.Rows[i][4].ToString();
                                com.ExecuteNonQuery();
                                con.Close();
                                break;

                            }
                        }
                        string g1 = horarios.Rows[j][2].ToString();
                        string g2 = cursos.Rows[i][1].ToString();
                        string g3 = horarios.Rows[j][4].ToString();
                        string g = cursos.Rows[i][2].ToString();
                    }
                }
            }

            return "d";
        }

        public DataTable consultaDataTable(String consulta)
        {
            SqlConnection conexionSQL = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = consulta;
            //
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conexionSQL;
            conexionSQL.Open();

            DataTable ImagenesBD = new DataTable();
            ImagenesBD.Load(cmd.ExecuteReader());
            conexionSQL.Close();

            return ImagenesBD;
        }


        public void asignacionAula(string codigo, string numeroaula, string horario, string horain, string horaf, string dia, string grupo)
        {
            SqlConnection con = new SqlConnection(connString);

            try
            {
                con.Open();

                SqlCommand com = new SqlCommand();
                com.Connection = con;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "asignacion";

                com.Parameters.Add("@CodigoMateria", SqlDbType.NVarChar).Value = codigo;
                com.Parameters.Add("@NumeroAula", SqlDbType.NVarChar).Value = numeroaula;
                com.Parameters.Add("@horario", SqlDbType.NVarChar).Value = horario;
                com.Parameters.Add("@Hora_Inicio", SqlDbType.NVarChar).Value = horain;
                com.Parameters.Add("@Hora_Salida", SqlDbType.NVarChar).Value = horaf;
                com.Parameters.Add("@dia", SqlDbType.NVarChar).Value = dia;
                com.Parameters.Add("@grupo", SqlDbType.NVarChar).Value = grupo;
                com.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
 
        }

        public void solicitud(string codigo, string nombre, string grupo, string numeroaula, string CapasidadAula, string cupos, string entra, string sali, string dia)
        {
            SqlConnection conexiosql = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO solicitud VALUES ('" + codigo + "','" + nombre + "','" + grupo + "','" + numeroaula + "','" + CapasidadAula + "','" + cupos + "','" + dia + "','" + entra + "','" + sali + "')";


            cmd.CommandType = CommandType.Text;
            cmd.Connection = conexiosql;
            conexiosql.Open();
            cmd.ExecuteNonQuery();
        }

        public void eliminar1(string codigo, string aula, string hora, string dia, string grupo)
        {


            SqlConnection con = new SqlConnection(connString);


            con.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "eliminar";

            com.Parameters.Add("@CodigoMateria", SqlDbType.NVarChar).Value = codigo;
            com.Parameters.Add("@NumeroAula", SqlDbType.NVarChar).Value = aula;
            com.Parameters.Add("@Hora_Inicio", SqlDbType.NVarChar).Value = hora;
            com.Parameters.Add("@dia", SqlDbType.NVarChar).Value = dia;
            com.Parameters.Add("@grupo", SqlDbType.NVarChar).Value = grupo;
            com.ExecuteNonQuery();
            con.Close();
        }

        public void eliminarsolicitud(string codigo, string grupo, string aula)
        {


            SqlConnection con = new SqlConnection(connString);


            con.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "Eliminarsolicitud";

            com.Parameters.Add("@codigo ", SqlDbType.NVarChar).Value = codigo;
            com.Parameters.Add("@aula", SqlDbType.NVarChar).Value = aula;
            com.Parameters.Add("@grupos", SqlDbType.NVarChar).Value = grupo;
            com.ExecuteNonQuery();
            con.Close();
        }

    }
}