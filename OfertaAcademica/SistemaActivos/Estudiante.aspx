<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="SistemaActivos.Estudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Vue.js/VueTargetas.css" rel="stylesheet" />
    <link href="res/css/Edificios/Edificios.css" rel="stylesheet" />
    <link href="res/css/General.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="res/css/Edificios/TargetaEdificio.css" rel="stylesheet" />
    <link href="res/css/Edificios/TargetasAulas.css" rel="stylesheet" />
    <link href="res/css/Edificios/Insertar.css" rel="stylesheet" />
    <link href="res/css/Menu/Menu.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <form id="form1" runat="server">

                <div>
	        <nav>
		        <input type="checkbox" id="check"/>
		        <label for="check" class="checkbtn" style="margin-top:20px">
			        <i class="fas fa-bars"></i>
		        </label>
	        <label class="logo" style="color:#45e1fb"> <img style="width:80px;height:80px; background-color:antiquewhite; margin-bottom:10px; margin-top:20px; margin-right:10px" src="Imagenes/logo_cuc.png" />Estudiante</label>
		        <ul style="margin-top:20px">
			        <li><a class="active" href="InicioLogin.aspx">Salir</a></li>
		        </ul>
	        </nav>
        </div>

         <div class="container">
	    <h2 class="form-titulo">Cursos del Estudiante</h2>
    </div>

  

        <div class="row">  
            
            <asp:Repeater ID="TargetasCursos" runat="server">
                <ItemTemplate>
                    <br />
                    <div class="my-2 mx-auto p-relative bg-white shadow-1 blue-hover" style="width: 360px; overflow: hidden; border-radius: 1px;">
                            <img src="Imagenes/Cuc_Prinsipal.jpg" alt="Man with backpack"    
                                class="d-block w-full">
                        <img src="Imagenes/Cuc_Prinsipal.jpg" />
                        <div class="px-2 py-2">
                        <p class="mb-0 small font-weight-medium text-uppercase mb-1 text-muted lts-2px">
                            Colegio Universitario de Cartago 
                        </p>

                        <h1 class="ff-serif font-weight-normal text-black card-heading mt-0 mb-1" style="line-height: 1.25;">
                            Materia: <%# DataBinder.Eval(Container.DataItem,"Materia")%>
                        </h1>
                        <p class="mb-1"> Codigo de Curso <%# DataBinder.Eval(Container.DataItem,"CodigoMateria")%></p>
                        <p class="mb-1"> Horario: <%# DataBinder.Eval(Container.DataItem,"horario")%></p>
                        <p class="mb-1"> Numero de Aula:  <%# DataBinder.Eval(Container.DataItem,"NumeroAula")%> </p>
                        <p class="mb-1"> Grupo:  <%# DataBinder.Eval(Container.DataItem,"Grupo")%> </p>
                        <p class="mb-1"> Materia:  <%# DataBinder.Eval(Container.DataItem,"Dia")%></p>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>

    </form>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>


</html>
