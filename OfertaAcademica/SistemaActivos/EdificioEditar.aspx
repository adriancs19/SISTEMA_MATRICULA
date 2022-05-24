<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="EdificioEditar.aspx.cs" Inherits="SistemaActivos.EdificioEditar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

    <div class="form-register">
	    <h2 class="form-titulo">EDITAR EDIFICIO</h2>
	    <div class="contenedor-inputs" style="background-color:#C5CAE9">
            <asp:TextBox ID="name" runat="server" placeholder="Nombre" class="input-100" required></asp:TextBox>

            <asp:TextBox ID="provincia" runat="server" placeholder="Dirección" class="input-100" required></asp:TextBox>

            <asp:TextBox ID="Naulas" runat="server" placeholder="Numero de Aulas" class="input-48" required></asp:TextBox>

            <asp:TextBox ID="Nlaboratorios" runat="server" placeholder="Numero de Laboratorios" class="input-48" required></asp:TextBox>
            
            <asp:Label Text="Disponibilidad de Edificio" runat="server"><asp:Label ID="info" runat="server" style="color:red"></asp:Label> </asp:Label>
            <asp:DropDownList ID="Dispo" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br />   
            <pre>
            </pre>
	    </div>
    </div>
    <br />
    <div class="Centrar">
        <asp:LinkButton ID="GuardarEdificio" runat="server" OnClick="GuardarEdificio_Click"><img src="Imagenes/guardar.jpg" style="width:80px;height:80px" /></asp:LinkButton>
        <a href="EdificioLeer.aspx"><img src="Imagenes/Cancelar.png" style="width:80px;height:80px" /></a>
    </div>
    <pre>

    </pre>


</asp:Content>
