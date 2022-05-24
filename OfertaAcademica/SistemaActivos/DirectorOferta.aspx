<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDirector.Master" AutoEventWireup="true" CodeBehind="DirectorOferta.aspx.cs" Inherits="SistemaActivos.DirectorOferta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/Edificios/TargetasAulas.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">


    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Oferta Académica   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>


    <asp:GridView ID="GV_LeerOferta" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" 
                                 ShowHeaderWhenEmpty="true"
                                 GridLines="None"
                                 EmptyDataText="Sin registros"
                                 AutoGenerateColumns ="true"
                                 AllowPaging="true"
                                 PageSize="1000">
                             </asp:GridView>

</asp:Content>
