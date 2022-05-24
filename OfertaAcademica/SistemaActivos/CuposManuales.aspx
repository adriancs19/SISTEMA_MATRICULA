<%@ Page Title="" Language="C#" MasterPageFile="~/MarterPage.Master" AutoEventWireup="true" CodeBehind="CuposManuales.aspx.cs" Inherits="SistemaActivos.Cupos_Manuales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/General.css" rel="stylesheet" />
        <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
           <div style="background-color:white">   
    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Cargar de Cupos Manualmente   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>

           </div>

    <br>
     <div class="container">
    
	    <h2 class="form-titulo"><i>INFORMACION SOBRE EL CURSO</i></h2>
	    <div class="contenedor-inputs" style="background-color:#C5CAE9">

            <asp:Label Text="Codigo del curso" runat="server" />
            <asp:TextBox ID="txtcodigo" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

             <asp:Label Text="Materia" runat="server" />
            <asp:TextBox ID="txtmateria" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

            <asp:Label Text="Grupo" runat="server" />
            <asp:TextBox ID="txtgrupo" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

             <asp:Label Text="Carrera" runat="server" />
            <asp:TextBox ID="txtCarrera" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

             <asp:Label Text="Dia" runat="server" />
            <asp:TextBox ID="txtdia" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

             <asp:Label Text="Cupos" runat="server" />
            <asp:TextBox ID="txtcupos" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

                 <asp:Label Text="Matriculados" runat="server" />
            <asp:TextBox ID="txtMatriculados" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>

             <asp:Label Text="Profesor" runat="server" />
            <asp:TextBox ID="txtProfesor" runat="server" placeholder="Dirección" class="input-100"  ></asp:TextBox>
            
            
           
	    </div>
</asp:Content>
