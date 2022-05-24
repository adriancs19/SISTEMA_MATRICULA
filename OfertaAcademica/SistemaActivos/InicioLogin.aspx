<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioLogin.aspx.cs" Inherits="SistemaActivos.InicioLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Login</title>
    <link href="res/css/Menu/Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<img class="wave" src="Imagenes/wave.png">
	<div class="container">
		<div class="img">
            <img src="Imagenes/logo_cuc.png" alt=""/>
		</div>
		<div class="login-content">
            <form runat="server">

                                <img src="Imagenes/user.PNG" alt=""/>
				<h2 class="title">Bienvenido</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
                          <asp:TextBox ID="txtUsuario" runat="server" class="input" TextMode="Password"  placeholder="Usuario"></asp:TextBox>
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
                          <asp:TextBox ID="TxtContra" runat="server" Class="input" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            	   </div>
 
               
            	</div>
                <asp:Button ID="btnIniciar" runat="server" Text="Iniciar Sesion" class="btn btn-warning" OnClick="btnIniciar_Click" />
                            <a  href="Estadidtico.aspx">Iniciar Sesion</a>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
</body>
</html>