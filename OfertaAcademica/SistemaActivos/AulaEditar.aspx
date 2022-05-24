<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="AulaEditar.aspx.cs" Inherits="SistemaActivos.AulaEditar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
            <div class="item"> <a href="AulaLeer.aspx" style="color:white"> <h6>  Leer Aulas  </h6>  </a> </div> 
            <div class="item"> <a href="AulaEditar.aspx" style="color:white"> <h6>  Actualizar Aulas  </h6>  </a> </div>   
        </div>
    </div>

    <div class="form-register">
	    <h2 class="form-titulo">EDITAR AULA</h2>
	    <div class="contenedor-inputs" style="background-color:#C5CAE9">

            <asp:Label Text="Edificio:" runat="server" />
            <asp:TextBox ID="txtEdificio" runat="server" ReadOnly class="input-100" required></asp:TextBox>

            <asp:Label Text="Nombre o Número de Aula:" runat="server"/>
            <asp:TextBox ID="name" runat="server" class="input-100" required></asp:TextBox>

            <asp:Label Text="Tipo de Aula" runat="server" ><asp:Label ID="LbTipo" runat="server" style="color:red"></asp:Label> </asp:Label>
            <asp:DropDownList ID="TipoAula" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br />   

            <asp:Label Text="Capacidad del Aula:" runat="server" />
            <asp:TextBox ID="txtCapacidad" runat="server" placeholder="Capacidad" class="input-100" required></asp:TextBox>

            <asp:Label Text="Disponibilidad de Aula" runat="server" ><asp:Label ID="LbEstado" runat="server" style="color:red"></asp:Label> </asp:Label>
            <asp:DropDownList ID="Dispo" runat="server" class="input-100" required></asp:DropDownList>
            <br />
            <br /> 
            <pre>
            </pre>
	    </div>
    </div>
    <br />
    <div class="Centrar">
        <asp:LinkButton ID="EdiarAula" runat="server" OnClick="EdiarAula_Click"><img src="Imagenes/guardar.jpg" style="width:80px;height:80px" /></asp:LinkButton>
        <a href="AulaLeer.aspx"><img src="Imagenes/Cancelar.png" style="width:80px;height:80px" /></a>
    </div>
    <pre>

    </pre>

    
</asp:Content>
