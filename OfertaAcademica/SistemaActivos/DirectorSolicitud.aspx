<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDirector.Master" AutoEventWireup="true" CodeBehind="DirectorSolicitud.aspx.cs" Inherits="SistemaActivos.DirectorSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
    <link href="\res\css\modoOscuro.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
         Solicitudes pendientes del director de carera   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>
    <br>
    
        

        <div class="container">
            <h2 class="form-titulo">SOLICITUDES PENDIENTES</h2>
            <asp:GridView ID="GV_LeerAulas" runat="server" CssClass="" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                ShowHeaderWhenEmpty="true"
                GridLines="None"
                EmptyDataText="Sin registros"
                AutoGenerateColumns="true"
                AllowPaging="true"
                PageSize="1000"
                OnRowUpdating="GV_LeerAulas_RowUpdating"
                OnRowDeleting="GV_LeerAulas_RowDeleting">
                <Columns >
                    <asp:TemplateField 
            HeaderText="Asignar Aula" SortExpression="Aceptar" >
                        <ItemTemplate >
                            <asp:LinkButton runat="server" CommandName="update"><span style="color:green"  class="material-icons">check</span></asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                                        <asp:TemplateField 
            HeaderText="Asignar Aula" SortExpression="Rechasar" >
                        <ItemTemplate >
                            <asp:LinkButton runat="server" CommandName="delete"><span style="color:red"  class="material-icons">close</span></asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
