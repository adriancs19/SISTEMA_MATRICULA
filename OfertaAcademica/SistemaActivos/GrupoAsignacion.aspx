<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="GrupoAsignacion.aspx.cs" Inherits="SistemaActivos.GrupoAsignacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
    
    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
        Asignar Aula   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>
    <br>
     <div class="container">
    
	    <h2 class="form-titulo"><i>INFORMACION SOBRE EL CURSO</i></h2>
	    <div class="contenedor-inputs" style="background-color:#C5CAE9">

            <asp:Label Text="Codigo del curso" runat="server" />
            <asp:TextBox ID="txtcodigo" runat="server" placeholder="Dirección" class="input-100" ReadOnly ></asp:TextBox>

             <asp:Label Text="Materia" runat="server" />
            <asp:TextBox ID="txtmateria" runat="server" placeholder="Dirección" class="input-100" ReadOnly ></asp:TextBox>

            <asp:Label Text="Grupo" runat="server" />
            <asp:TextBox ID="txtgrupo" runat="server" placeholder="Dirección" class="input-100" ReadOnly ></asp:TextBox>

             <asp:Label Text="Dia" runat="server" />
            <asp:TextBox ID="txtdia" runat="server" placeholder="Dirección" class="input-100" ReadOnly ></asp:TextBox>

             <asp:Label Text="Cupos" runat="server" />
            <asp:TextBox ID="txtcupos" runat="server" placeholder="Dirección" class="input-100" ReadOnly ></asp:TextBox>

             <asp:Label Text="Horario" runat="server" />
            <asp:TextBox ID="txthorario" runat="server" placeholder="Dirección" class="input-100" ReadOnly ></asp:TextBox>
            
            
           
	    </div>
    
    
        
          <br />
            <br />    
       
            <h2 class="form-titulo">AULAS DISPONIBLES PARA EL CURSO</h2>
            <asp:GridView ID="GV_LeerAulas" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                ShowHeaderWhenEmpty="true"
                GridLines="None"
                EmptyDataText="Sin registros"
                AutoGenerateColumns="true"
                AllowPaging="true"
                PageSize="1000"
                OnRowUpdating="GV_LeerAulas_RowUpdating">
                <Columns >
                    <asp:TemplateField 
            HeaderText="Asignar Aula" SortExpression="Asignar Aula" >
                        <ItemTemplate >
                            <asp:LinkButton runat="server" CommandName="update"><span style="color:green"  class="material-icons">note_add</span></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

</asp:Content>
