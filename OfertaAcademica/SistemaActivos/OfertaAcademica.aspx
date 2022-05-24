<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="OfertaAcademica.aspx.cs" Inherits="SistemaActivos.OfertaAcademica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetaEdificio.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
        <div class="Centrar" style="background-color:#bdbdbd">
            <div class="item"> <a href="VerHorarios.aspx" style="color:black"> <h5>Horarios</h5></a></div>
            <div class="item"> <a href="OfertaAcademica.aspx" style="color:#FF0000"><h5>  Oferta Académica  </h5></a> </div> 
            <div class="item"> <a href="OfertaAutomatica.aspx" style="color:black"> <h5>  Cargar Oferta de Manera Automática </h5></a></div>
            <div class="item"> <a href="OfertaMacro.aspx" style="color:black"><h5>  Ver Oferta de Manera Macro  </h5></a> </div>   
        </div>


     <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Oferta Académica Registrada   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>

         <div class="container">
	    <h2 class="form-titulo">VER OFERTA ACADÉMICA</h2>
    </div>
            <div class="container">
                <div class="Centrar">
                    <div class="input-field col s12">
                        <i>Ordenar por: </i>
                        <asp:DropDownList ID="Ordenar" runat="server" class="input-48" style="height:50px"></asp:DropDownList>
                        <br />
                    </div>
                    <asp:Button Class="btn btn-primary" ID="btn_mostrar" runat="server" Text="Ordenar Registros" OnClick="btn_mostrar_Click"/>
                 </div>
            </div>
  
                    
                            <asp:GridView ID="GV_LeerOferta" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" 
                                 ShowHeaderWhenEmpty="true"
                                 GridLines="None"
                                 EmptyDataText="Sin registros"
                                 AutoGenerateColumns ="true"
                                 AllowPaging="true"
                                 PageSize="1000">
                             </asp:GridView>
   
</asp:Content>
 