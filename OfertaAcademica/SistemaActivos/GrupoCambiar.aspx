<%@ Page Title="" Language="C#" MasterPageFile="~/MasterDistribucion.Master" AutoEventWireup="true" CodeBehind="GrupoCambiar.aspx.cs" Inherits="SistemaActivos.GrupoCambiar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
      <div class="Centrar" style="background-color:#bdbdbd">
        <div id="LNK_Edificios" class="item"> <a href="Grupos.aspx" style="color:black"> <h4>  Cargar grupos individuales  </h4></a></div>
        <div id="LNK_Aulas" class="item"> <a href="GrupoCambiar.aspx" style="color:black"><h4>  Cambiar grupos de aula  </h4></a> </div> 
         <div id="LN_Aulas" class="item"> <a href="GrupoEliminar.aspx" style="color:black"><h4>  Eliminar grupo de aula  </h4></a> </div>
    </div>
    
    <h4 style="text-align:center;background-color:#303F9F;color:white;">
        <br> 
         Cambiar grupos de aula   -   Colegio Universitario de Cartago 
        <pre>
        </pre>
    </h4>
    <br>
    
        

        <div class="container">
            <h2 class="form-titulo">CAMBIAR GRUPOS DE AULA</h2>
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
