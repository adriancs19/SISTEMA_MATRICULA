<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="OfertaAutomatica.aspx.cs" Inherits="SistemaActivos.OfertaAutomatica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetaEdificio.css" rel="stylesheet" />

    <style>
        .btnProceso {
            width:500px;
            height:100px;
            background-color:#009688;
            color:aliceblue;
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
        <div class="Centrar" style="background-color:#bdbdbd">
            <div class="item"> <a href="VerHorarios.aspx" style="color:black"> <h5>Horarios</h5></a></div>
            <div class="item"> <a href="OfertaAcademica.aspx" style="color:black"><h5>  Oferta Académica  </h5></a> </div> 
            <div class="item"> <a href="OfertaAutomatica.aspx" style="color:#FF0000"> <h5>  Cargar Oferta de Manera Automática </h5></a></div>
            <div class="item"> <a href="OfertaMacro.aspx" style="color:black"><h5>  Ver Oferta de Manera Macro  </h5></a> </div>   
        </div>

     <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
         Proceso Automático de la Carga de Oferta Académica  -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>
    <pre>


    </pre>
    <div class="Centrar">
             <asp:Button class="btnProceso" ID="Button1" runat="server" Text="Realizar Proceso Automatico de Asiganción de Aulas" OnClick="ProcesoAutomatico_Click"> </asp:Button>
    </div>


</asp:Content>
