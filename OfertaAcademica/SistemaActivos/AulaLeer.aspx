<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="AulaLeer.aspx.cs" Inherits="SistemaActivos.AulaLeer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetasAulas.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
        <div style="color:black"> 
        
        <div class="Centrar" style="background-color:#bdbdbd">
            <div id="LNK_Edificios" class="item"> <a href="Edificios.aspx" style="color:black"> <h4>  Edificios </h4></a></div>
            <div id="LNK_Aulas" class="item"> <a href="Aulas.aspx" style="color:black"><h4>  Aulas  </h4></a> </div>    
        </div>
        
        <h4 style="text-align:center;background-color:#303F9F;color:white;">
            <br> 
            Control de Aulas   -   Colegio Universitario de Cartago 
            <pre>
            </pre>
        </h4>

    <div class="Centrar">   
        <div class="Centrar" style="background-color:#009688;width:900px;">
            <div class="item"> <a href="Aulas.aspx" style="color:white"> <h6>  Crear Aulas  </h6>  </a></div>
            <div class="item"> <a href="AulaLeer.aspx" style="color:white"> <h6>  Leer o Actualizar Aulas  </h6>  </a> </div> 
        </div>
    </div>

   
     <div class="container">
	    <h2 class="form-titulo">VER AULAS</h2>
    </div>
            <br />
            <div class="container">
                <div class="Centrar">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">event_available</i>
                        <asp:TextBox ID="txtaula" runat="server" placeholder="Numero de Aula" Style="height:45px;"></asp:TextBox>
                    </div>
                    <asp:ImageButton Width="80px" Height="70px" ID="BtnBuscar" runat="server" ImageUrl="Imagenes/lupa.jpg" OnClick="BtnBuscar_Click" Style="margin-right:10px"/>
                    <asp:Button Class="btn btn-primary" ID="btn_mostrar" runat="server" Text="Mostrar Todos" OnClick="btn_mostrar_Click"/>
                 </div>
            </div>

                <br />

            
                    <div class="container">
                            <asp:GridView ID="GV_LeerAulas" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" 
                                 ShowHeaderWhenEmpty="true"
                                 GridLines="None"
                                 EmptyDataText="Sin registros"
                                 AutoGenerateColumns ="true"
                                 AllowPaging="true"
                                 PageSize="10"
                                 OnRowUpdating="GV_LeerAulas_RowUpdating">

                                <Columns>
                                    <asp:TemplateField >
                                        <ItemTemplate>
                                            <asp:LinkButton  runat="server" CommandName="update"><span style="color:green"  class="material-icons">create</span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 </Columns>
                             </asp:GridView>
                    </div>

             <div class="row">  
            
            <asp:Repeater ID="TargetasAulas" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="my-2 mx-auto p-relative bg-white shadow-1 blue-hover" style="width: 360px; overflow: hidden; border-radius: 1px;">
                            <img src="Imagenes/Aulas.jpg" alt="Man with backpack"    
                                class="d-block w-full">

                        <div class="px-2 py-2">
                        <p class="mb-0 small font-weight-medium text-uppercase mb-1 text-muted lts-2px">
                            Colegio Universitario de Cartago 
                        </p>

                        <h1 class="ff-serif font-weight-normal text-black card-heading mt-0 mb-1" style="line-height: 1.25;">
                            Nombre de Aula: <%# DataBinder.Eval(Container.DataItem,"NumeroAula")%>
                        </h1>

                        <p class="mb-1"> Nombre de edificio: <%# DataBinder.Eval(Container.DataItem,"NombreEdificio")%></p>
                        <p class="mb-1"> Tipo:  <%# DataBinder.Eval(Container.DataItem,"Tipo")%> </p>
                        <p class="mb-1"> Capacidad:  <%# DataBinder.Eval(Container.DataItem,"Capacidad")%> </p>
                        <p class="mb-1"> Disponibilidad del Aula:  <%# DataBinder.Eval(Container.DataItem,"EstadoAula")%></p>

                        </div>

                        <a href="AulaEditar.aspx?Numero=<%# DataBinder.Eval(Container.DataItem,"NumeroAula")%>" class="text-uppercase d-inline-block font-weight-medium lts-2px ml-2 mb-2 text-center styled-link">
                        Editar Aula
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>


            <pre>   
            </pre>

</asp:Content>
