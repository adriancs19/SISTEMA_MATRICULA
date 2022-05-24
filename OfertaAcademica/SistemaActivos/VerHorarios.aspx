<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="VerHorarios.aspx.cs" Inherits="SistemaActivos.VerHorarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetaEdificio.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

        <div class="Centrar" style="background-color:#bdbdbd">
            <div class="item"> <a href="VerHorarios.aspx" style="color:#FF0000"> <h5>Horarios</h5></a></div>
            <div class="item"> <a href="OfertaAcademica.aspx" style="color:black"><h5>  Oferta Académica  </h5></a> </div> 
            <div class="item"> <a href="OfertaAutomatica.aspx" style="color:black"> <h5>  Cargar Oferta de Manera Automática </h5></a></div>
            <div class="item"> <a href="OfertaMacro.aspx" style="color:black"><h5>  Ver Oferta de Manera Macro  </h5></a> </div>   
        </div>


     <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Horarios Disponibles   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>


    <div class="row">  
            
            <asp:Repeater ID="TargetasHorarios" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="contenedor">
		                <div class="contenedor_tarjeta">         
				                <figure id="tarjeta">
			                        <img class="frontal" src="Imagenes/Horario.jpg" />
					                <figcaption class="trasera">
						                <h3 class="titulo">Turno: <%# DataBinder.Eval(Container.DataItem,"Turno")%></h3>
						                <hr>
                                        <br />  
						                <p>Hora de Inicio: <%# DataBinder.Eval(Container.DataItem,"Hora_Inicio")%></p>
                                        <br />
                                        <p>Hora de Salida: <%# DataBinder.Eval(Container.DataItem,"Hora_Salida")%></p>

					                </figcaption>
				                </figure>
			                </a>
		                </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>

        </div>


</asp:Content>
