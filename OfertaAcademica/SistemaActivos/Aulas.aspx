<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="Aulas.aspx.cs" Inherits="SistemaActivos.Aulas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
        
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

    <div class="form-register">
	    <h2 class="form-titulo">CREAR NUEVA AULA</h2>
	    <div class="contenedor-inputs" style="background-color:#C5CAE9">

            <asp:Label Text="Seleccionar Edificio" runat="server" />
            <asp:DropDownList ID="txtEdificio" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br />  
            <pre> </pre>

            <asp:TextBox ID="name" runat="server" placeholder="Nombre o Número de Aula" class="input-100" required></asp:TextBox>

            <asp:Label Text="Tipo (Aula o Laboratorio)" runat="server" />
            <asp:DropDownList ID="TipoAula" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br />   
            <pre>
            </pre>
            <asp:TextBox ID="txtMaxima" runat="server" placeholder="Capacidad Máxima" class="input-100" required></asp:TextBox>

            <asp:Label Text="Seleccionar Disponibilidad de Aula" runat="server" />
            <asp:DropDownList ID="Dispo" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br /> 
            <pre>
            </pre>
	    </div>
    </div>
    <br />
    <div class="Centrar">
        <asp:LinkButton ID="GuardarAula" runat="server" OnClick="GuardarAula_Click"><img src="Imagenes/guardar.jpg" style="width:80px;height:80px" /></asp:LinkButton>
    </div>
    <pre>

    </pre>
</asp:Content>
