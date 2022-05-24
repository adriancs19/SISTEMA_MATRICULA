<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="Edificios.aspx.cs" Inherits="SistemaActivos.Edificios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
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
   
        <div class="form-register">
	    <h2 class="form-titulo">CREAR NUEVO EDIFICIO</h2>
	    <div class="contenedor-inputs" style="background-color:#C5CAE9">
            <asp:TextBox ID="name" runat="server" placeholder="Nombre" class="input-100" required></asp:TextBox>

            <asp:Label Text="Seleccionar Imagen de Edificio (.JPG)" runat="server" />
            <asp:FileUpload ID="ImagenEdificio" runat="server" accept=".jpg" class="input-100" required style="background-color:white"/>

            <asp:TextBox ID="provincia" runat="server" placeholder="Dirección" class="input-100" required></asp:TextBox>

            <asp:TextBox ID="aulas" runat="server" placeholder="Numero de Aulas" class="input-48" required></asp:TextBox>

            <asp:TextBox ID="laboratorios" runat="server" placeholder="Numero de Laboratorios" class="input-48" required></asp:TextBox>

            <asp:Label Text="Seleccionar Disponibilidad de Edificio" runat="server" />
            <asp:DropDownList ID="Dispo" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br />    
	    </div>
    </div>
    <br />
    <div class="Centrar">
        <asp:LinkButton ID="GuardarEdificio" runat="server" OnClick="GuardarEdificio_Click"><img src="Imagenes/guardar.jpg" style="width:80px;height:80px" /></asp:LinkButton>
    </div>
    <pre>

    </pre>

</asp:Content>
