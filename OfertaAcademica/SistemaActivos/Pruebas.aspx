<%@ Page Title="" Language="C#" MasterPageFile="~/MarterPage.Master" AutoEventWireup="true" CodeBehind="Pruebas.aspx.cs" Inherits="SistemaActivos.Pruebas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/Edificios/TargetaEdificio.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="form1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container">  
        <div class="row">   
            <div class="col-md-4 col-md-offset-4">   
                Imagen Agregada:

                <br />
                <asp:DropDownList ID="CBDisponibilidad" runat="server"></asp:DropDownList>
                <asp:Image ID="ImgPreview" Width="200" ImageUrl="Imagenes/logo_cuc.png" runat="server" />

                <br />  
                <br />

                <asp:FileUpload ID="fileimg" accept=".jpg" runat="server" CssClass="form-control" />
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                <br />  
                <br />
                Titulo de Imagen
                <asp:TextBox ID="txttitulo" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Button ID="btnsubir" runat="server" Text="Adjuntar Imagen" CssClass="btn btn-success" OnClick="btnsubir_Click" />

            </div>
        </div>
        
        <div class="row">  
            
            <asp:Repeater ID="TargetasEdificios" runat="server">
                <ItemTemplate>
                    <br />
                    <%--<div class="col-md-4"> 
                        <img width="100%" height="60%" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[]) DataBinder.Eval(Container.DataItem,"Imagen")) %>" />
                        <h6>Titulo de Imagen: </h6><%# DataBinder.Eval(Container.DataItem,"Titulo")%>
                    </div>--%>



                    <div class="contenedor">
		                <div class="contenedor_tarjeta">
				                <figure id="tarjeta">
					                <img class="frontal" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[]) DataBinder.Eval(Container.DataItem,"Imagen")) %>" />
					                <figcaption class="trasera">
						                <h2 class="titulo">Titulo de Imagen: <%# DataBinder.Eval(Container.DataItem,"Titulo")%></h2>
						                <hr>
						                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis cupiditate voluptates ipsum suscipit, aspernatur eum, amet nemo architecto nihil corrupti.</p>
					                </figcaption>
				                </figure>
			                </a>
		                </div>
                    </div>




                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
 

</asp:Content>