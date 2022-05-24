<%@ Page Title="" Language="C#" MasterPageFile="~/MarterPage.Master" AutoEventWireup="true" CodeBehind="CargarCupos.aspx.cs" Inherits="SistemaActivos.CargarCupos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/General.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server" >

    <div style="background-color:white">   
    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Cargar de Cupos   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>

    <div class="Centrar">

        <div style="margin-left:10px;margin-right:10px">
            <h5><asp:Label Text="Inicio del Periodo:" runat="server" Style="color:black"/></h5>
            <asp:Calendar ID="CalendarInicio" runat="server"></asp:Calendar>
            <br>
        </div>


        <div style="background-color:#BDBDBD;text-align:center">
            <pre>   </pre>
            <h7 style="text-align:center;color:black">Elija un Archivo Ecxel con al Carga Académica</h7>
            <pre>   
            </pre>
            <INPUT id="FileUpload1" type="file" runat="server" NAME="oFile" accept=".xlsx" style="margin-left:15px;margin-right:15px;background-color:#3F51B5;color:white;width:400px;height:30px;">
            <pre>  

            </pre>
            <asp:Button ID="Button1" runat="server" Text="Cargar Oferta Académica" Style="background-color:#3F51B5;color:white" OnClick="Button1_Click"/>
        </div>


        <div style="margin-left:10px;margin-right:10px">
            <h5><asp:Label Text="El Periodo Termina:" runat="server" Style="color:black"/></h5>
            <asp:Calendar ID="CalendarFinal" runat="server"></asp:Calendar>
            <br>
            
        </div>

    </div>

    </div>


</asp:Content>
