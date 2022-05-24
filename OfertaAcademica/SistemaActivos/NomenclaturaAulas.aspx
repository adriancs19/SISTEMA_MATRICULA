<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="NomenclaturaAulas.aspx.cs" Inherits="SistemaActivos.NomenclaturaAulas" %>
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
            <div class="item"> <a href="#" style="color:black"> <h5>Eliminar Grupo de Aula</h5></a></div>
            <div class="item"> <a href="#" style="color:black"><h5> Cambiar Grupos de Aula  </h5></a> </div> 
            <div class="item"> <a href="#" style="color:black"> <h5> Cargar Grupos Individuales </h5></a></div>
            <div class="item"> <a href="NomenclaturaAulas.aspx" style="color:#FF0000"><h5>  Estado de Aula por Edificio  </h5></a> </div>   
        </div>


     <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Visualizar Estado de Aula por Edificio  -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>
             <div class="container">
	    <h2 class="form-titulo">NOMENCLATURA DE AULAS POR EDIFICIO</h2>
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
            <div class="Centrar">
                <asp:TextBox ID="rojo" runat="server" Text="Sobrepasa Capacidad" Style="background-color:red;width:300px;height:50px; color:white;text-align:center" ReadOnly></asp:TextBox>
                 <asp:TextBox ID="azul" runat="server" Text="Disponible" Style="background-color:blue;width:300px;height:50px; color:white;text-align:center" ReadOnly></asp:TextBox>
                 <asp:TextBox ID="verde" runat="server" Text="Utilizada" Style="background-color:green;width:300px;height:50px; color:white;text-align:center" ReadOnly></asp:TextBox>
            </div>



    <div class="row">  
            
            <asp:Repeater ID="TargetasRojo" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="my-2 mx-auto p-relative bg-white shadow-1 blue-hover" style="width: 360px; overflow: hidden; border-radius: 1px;background-color:red">
                        <div class="px-2 py-2">
                        <p class="mb-0 small font-weight-medium text-uppercase mb-1 text-muted lts-2px">
                            Colegio Universitario de Cartago 
                        </p>

                        <h1 class="ff-serif font-weight-normal text-black card-heading mt-0 mb-1" style="line-height: 1.25;">
                            Nombre de Aula: <%# DataBinder.Eval(Container.DataItem,"NumeroAula")%>
                        </h1>
                        <p class="mb-1"> Codigo de Curso <%# DataBinder.Eval(Container.DataItem,"CodigoMateria")%></p>
                        <p class="mb-1"> Horario: <%# DataBinder.Eval(Container.DataItem,"horario")%></p>
                        <p class="mb-1"> Día:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>
                        <p class="mb-1"> Grupo:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>
                        <p class="mb-1"> Capacidad:  <%# DataBinder.Eval(Container.DataItem,"Hora_Salida")%> </p>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    <div class="row">  
            
            <asp:Repeater ID="TargetasAzul" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="my-2 mx-auto p-relative bg-white shadow-1 blue-hover" style="width: 360px; overflow: hidden; border-radius: 1px;;background-color:blue">
                        <div class="px-2 py-2">
                        <p class="mb-0 small font-weight-medium text-uppercase mb-1 text-muted lts-2px">
                            Colegio Universitario de Cartago 
                        </p>

                        <h1 class="ff-serif font-weight-normal text-black card-heading mt-0 mb-1" style="line-height: 1.25;">
                            Nombre de Aula: <%# DataBinder.Eval(Container.DataItem,"NumeroAula")%>
                        </h1>
                        <p class="mb-1"> Horario: <%# DataBinder.Eval(Container.DataItem,"horario")%></p>
                        <p class="mb-1"> Día:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>
                        <p class="mb-1"> Capacidad:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        <div class="row">  
            
            <asp:Repeater ID="TargetasVerde" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="my-2 mx-auto p-relative bg-white shadow-1 blue-hover" style="width: 360px; overflow: hidden; border-radius: 1px;;background-color:green">
    
                        <div class="px-2 py-2">
                        <p class="mb-0 small font-weight-medium text-uppercase mb-1 text-muted lts-2px">
                            Colegio Universitario de Cartago 
                        </p>

                        <h1 class="ff-serif font-weight-normal text-black card-heading mt-0 mb-1" style="line-height: 1.25;">
                            Nombre de Aula: <%# DataBinder.Eval(Container.DataItem,"NumeroAula")%>
                        </h1>
                        <p class="mb-1"> Codigo de Curso <%# DataBinder.Eval(Container.DataItem,"CodigoMateria")%></p>
                        <p class="mb-1"> Horario: <%# DataBinder.Eval(Container.DataItem,"horario")%></p>
                        <p class="mb-1"> Día:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>
                        <p class="mb-1"> Grupo:  <%# DataBinder.Eval(Container.DataItem,"dia")%></p>
                        <p class="mb-1"> Capacidad:  <%# DataBinder.Eval(Container.DataItem,"Hora_Salida")%> </p>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>


        </div>

</asp:Content>
