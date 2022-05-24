<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="OfertaMacro.aspx.cs" Inherits="SistemaActivos.OfertaMacro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetaEdificio.css" rel="stylesheet" />
    <link href="res/css/Edificios/TargetasAulas.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
        <div class="Centrar" style="background-color:#bdbdbd">
            <div class="item"> <a href="VerHorarios.aspx" style="color:black"> <h5>Horarios</h5></a></div>
            <div class="item"> <a href="OfertaAcademica.aspx" style="color:black"><h5>  Oferta Académica  </h5></a> </div> 
            <div class="item"> <a href="OfertaAutomatica.aspx" style="color:black"> <h5>  Cargar Oferta de Manera Automática </h5></a></div>
            <div class="item"> <a href="OfertaMacro.aspx" style="color:#FF0000"><h5>  Ver Oferta de Manera Macro  </h5></a> </div>   
        </div>


     <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Oferta Académica de Forma Macro por Edificio  -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>
             <div class="container">
	    <h2 class="form-titulo">OFERTA ACADÉMICA ASIGNADA POR EDIFICIO</h2>
    </div>
            <div class="container">
                <div class="Centrar">
                    <div class="input-field col s12">
                        <i>Seleccionar Edificio: </i>
                        <asp:DropDownList ID="txtedificio" runat="server" class="input-48" style="height:50px"></asp:DropDownList>
                        <br />
                    </div>
                    <asp:Button Class="btn btn-primary" ID="btn_mostrar" runat="server" Text="Ver Registros por Edificio" OnClick="btn_mostrar_Click" Style="width:300px;height:50px"/>
                 </div>
            </div>
  


        <div class="row">  
            
            <asp:Repeater ID="TargetasAulas" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="my-2 mx-auto p-relative bg-white shadow-1 blue-hover" style="width: 360px; overflow: hidden; border-radius: 1px;">
                            <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[]) DataBinder.Eval(Container.DataItem,"Imagen")) %>" alt="Man with backpack"    
                                class="d-block w-full">

                        <div class="px-2 py-2">
                        <p class="mb-0 small font-weight-medium text-uppercase mb-1 text-muted lts-2px">
                            Colegio Universitario de Cartago 
                        </p>

                        <h1 class="ff-serif font-weight-normal text-black card-heading mt-0 mb-1" style="line-height: 1.25;">
                            Nombre de Aula: <%# DataBinder.Eval(Container.DataItem,"NumeroAula")%>
                        </h1>
                        <p class="mb-1"> Codigo de Curso <%# DataBinder.Eval(Container.DataItem,"CodigoMateria")%></p>
                        <p class="mb-1"> Nombre de edificio: <%# DataBinder.Eval(Container.DataItem,"NombreEdificio")%></p>
                        <p class="mb-1"> Horario: <%# DataBinder.Eval(Container.DataItem,"horario")%></p>
                        <p class="mb-1"> Hora de Inicio:  <%# DataBinder.Eval(Container.DataItem,"Hora_Inicio")%> </p>
                        <p class="mb-1"> Hora de Salida:  <%# DataBinder.Eval(Container.DataItem,"Hora_Salida")%> </p>
                        <p class="mb-1"> Día:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>

</asp:Content>
