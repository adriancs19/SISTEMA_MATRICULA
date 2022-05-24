<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="EdificioLeer.aspx.cs" Inherits="SistemaActivos.EdificioLeer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetasAulas.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
  <div class="Centrar" style="background-color:#bdbdbd">
        <div id="LNK_Edificios" class="item"> <a href="Edificios.aspx" style="color:black"> <h4>  Edificios </h4></a></div>
        <div id="LNK_Aulas" class="item"> <a href="Aulas.aspx" style="color:black"><h4>  Aulas  </h4></a> </div>    
    </div>

    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Control de Edificios   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>

    <div class="Centrar">   
        <div class="Centrar" style="background-color:#009688;width:900px;">
            <div class="item"> <a href="Edificios.aspx" style="color:white"> <h6>  Crear Edificios  </h6>  </a></div>
            <div class="item"> <a href="EdificioLeer.aspx" style="color:white"> <h6>  Leer o Actualizar Edificios  </h6>  </a> </div>    
        </div>
    </div>

    <div class="container">
	    <h2 class="form-titulo">VER EDIFICIOS</h2>
    </div>

    <div class="row">  
            
            <asp:Repeater ID="TargetasEdificios" runat="server">
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
                            Nombre de Edificio: <%# DataBinder.Eval(Container.DataItem,"Nombre")%>
                        </h1>

                        <p class="mb-1"> Provincia: <%# DataBinder.Eval(Container.DataItem,"Provincia")%> </p>
                        <p class="mb-1"> Numero de Aulas: <%# DataBinder.Eval(Container.DataItem,"NumeroAulas")%> </p>
                        <p class="mb-1"> Numero de Laboratorios: <%# DataBinder.Eval(Container.DataItem,"NumeroLavoratorio")%> </p>
                        <p class="mb-1"> Disponibilidad de Edificio: <%# DataBinder.Eval(Container.DataItem,"Disponibilidad")%> </p>

                        </div>

                        <a href="EdificioEditar.aspx?Nombre=<%# DataBinder.Eval(Container.DataItem,"Nombre")%>" class="text-uppercase d-inline-block font-weight-medium lts-2px ml-2 mb-2 text-center styled-link">
                        Editar Edificio
                        </a>
                    </div>

                </ItemTemplate>
            </asp:Repeater>

        </div>


</asp:Content>
