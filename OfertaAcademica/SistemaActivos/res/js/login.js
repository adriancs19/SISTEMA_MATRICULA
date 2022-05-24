$(document).ready(function() {
    document.getElementById("form_pass").style.display = "none";
    document.getElementById("form_registro").style.display = "none";
});
function mostrarF_Contraseña()
{
    document.getElementById("form_pass").style.display = "block";
    document.getElementById("form_registro").style.display = "none";
}

function mostrarF_Registro()
{
    document.getElementById("form_pass").style.display = "none";
    document.getElementById("form_registro").style.display = "block";
}

function Registro_click()
{
    document.getElementById("form_pass").style.display = "none";
    document.getElementById("form_registro").style.display = "none";
    alertify.success('Solicitud Enviada');
}

function Contrasena_click()
{
    document.getElementById("form_pass").style.display = "none";
    document.getElementById("form_registro").style.display = "none";
    alertify.success('Correo Enviado');
}

function Cancelar_click()
{
    document.getElementById("form_pass").style.display = "none";
    document.getElementById("form_registro").style.display = "none";
    alertify.error('Cancelar');
}

function btnIngresar_Click()
{
    var correo = document.getElementById("TXT_Correo").value;
    var pass = document.getElementById("TXT_Pass").value;
    if(correo == ""|| pass == "")
    {
        alertify.error('¡Debe llenar todos los campos!');
    }
    else
    {
        alertify.success('¡Correcto!');
    }
}