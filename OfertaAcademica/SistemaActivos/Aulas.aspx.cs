using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SistemaActivos
{
    public partial class Aulas : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        DataTable tableValidar = new DataTable();
        DataTable TableCantidad = new DataTable();
        DataTable TableAulas = new DataTable();
        DataTable TableEdificio = new DataTable();

        BusinessLogic.Aula aula = new BusinessLogic.Aula();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem i;
            i = new ListItem("Habilitada", "Habilitada");
            Dispo.Items.Add(i);
            i = new ListItem("Innabilitada", "Innabilitada");
            Dispo.Items.Add(i);

            ListItem b;
            b = new ListItem("Aula", "Aula");
            TipoAula.Items.Add(b);
            b = new ListItem("Laboratorio", "Laboratorio");
            TipoAula.Items.Add(b);

            string sentenciaEdificio = "select Nombre from Edificios";

            if (!IsPostBack) {
                table = aula.LlenarDatos(sentenciaEdificio);
                this.txtEdificio.DataSource = table;
                this.txtEdificio.DataValueField = "Nombre";
                this.txtEdificio.DataTextField = "Nombre";
                this.txtEdificio.DataBind();
            }

        }

        protected void GuardarAula_Click(object sender, EventArgs e)
        {

            int numero = Convert.ToInt32(name.Text);
            string edificio = txtEdificio.SelectedValue.ToString();
            string tipo = TipoAula.SelectedValue.ToString();
            int Capacidad = Convert.ToInt32(txtMaxima.Text);
            string estado = " ";

            string estadoEdificio = EstadoEdificio(edificio);
            if (estadoEdificio == "Innabilitado") {
                estado = "Innabilitada";
            }
            else
            {
                estado = Dispo.SelectedValue.ToString();

            }

            if(tipo == "Aula")
            {
                float AulasCantidad = CantidadAulas(edificio);
                float Aulas = ValidarAulas(edificio);
                if (Aulas== AulasCantidad) {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Edificio '"+edificio+"' Ya tiene la Capacidad total de Aulas Creadas);", true);
                }
                else
                {
                    if (numero.ToString().Equals(""))
                    {
                        ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Campo de Numero o Nombre de Aula está Vacío');", true);
                    }
                    else
                    {
                        tableValidar = aula.Buscar_Aula(new DataBase.Aula
                        { NumeroAula = numero.ToString() });
                    }
                    if (tableValidar.Rows.Count == 0)
                    {
                        try
                        {
                            aula.CrearAula(edificio, numero, tipo, Capacidad, estado);
                            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Aula Registrada');", true);
                            DataBase.DataBase data = new DataBase.DataBase();
                            data.HorariosCarga(Convert.ToString(numero), Capacidad.ToString());
                        }
                        catch (Exception)
                        {
                            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se registro el aula');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Ya hay un Aula Registrada con ese Numero o Nombre');", true);
                    }
                }
            }


            if (tipo == "Laboratorio")
            {
                float LaboratorioCantidad = CantidadLaboratorio(edificio);
                float Laboratorios = ValidarLaboratorio(edificio);
                if (Laboratorios == LaboratorioCantidad)
                {
                    ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Edificio '" + edificio + "' Ya tiene la Capacidad total de Laboratorios Creados);", true);
                }
                else
                {
                    if (numero.ToString().Equals(""))
                    {
                        ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('El Campo de Numero o Nombre de Aula está Vacío');", true);
                    }
                    else
                    {
                        tableValidar = aula.Buscar_Aula(new DataBase.Aula
                        { NumeroAula = numero.ToString() });
                    }
                    if (tableValidar.Rows.Count == 0)
                    {
                        try
                        {
                            aula.CrearAula(edificio, numero, tipo, Capacidad, estado);
                            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Aula Registrada');", true);
                            DataBase.DataBase data = new DataBase.DataBase();
                            data.HorariosCarga(Convert.ToString(numero), Capacidad.ToString());
                        }
                        catch (Exception)
                        {
                            ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('No se registro el aula');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.Page.GetType(), "myFuncionAlerta", "alert('Ya hay un Aula Registrada con ese Numero o Nombre');", true);
                    }
                }
            }


     

        }

        public float CantidadAulas(string edificio) {
            string sentencia = "SELECT NumeroAulas FROM Edificios WHERE Nombre='"+edificio+"'";

            TableCantidad = aula.LlenarDatos(sentencia);
            float CantidadAulas = float.Parse(TableCantidad.Rows[0][0].ToString());

            return CantidadAulas;
        }

        public float ValidarAulas(string edificio)
        {
            string sentencia = "SELECT NumeroAula FROM Aulas WHERE NombreEdificio = '"+edificio+ "' and Tipo = 'Aula'";

            TableAulas = aula.LlenarDatos(sentencia);
            float TotalAulas = TableAulas.Rows.Count;

            return TotalAulas;
        }

        public float CantidadLaboratorio(string edificio)
        {
            string sentencia = "SELECT NumeroLavoratorio FROM Edificios WHERE Nombre = '"+edificio+"'";

            TableCantidad = aula.LlenarDatos(sentencia);
            float CantidadLabs = float.Parse(TableCantidad.Rows[0][0].ToString());

            return CantidadLabs;
        }

        public float ValidarLaboratorio(string edificio)
        {
            string sentencia = "SELECT NumeroAula FROM Aulas WHERE NombreEdificio = '" + edificio + "' and Tipo = 'Laboratorio'";

            TableAulas = aula.LlenarDatos(sentencia);
            float TotalLabs = TableAulas.Rows.Count;

            return TotalLabs;
        }

        public string EstadoEdificio(string edificio)
        {
            string sentencia = "SELECT Disponibilidad FROM Edificios WHERE Nombre = '"+edificio+"'";

            TableEdificio = aula.LlenarDatos(sentencia);
            string EstadoEdificio = TableEdificio.Rows[0][0].ToString();
            return EstadoEdificio;
        }
    }
    
}