
    document.getElementById("Tablaroles").style.display = "block";

    document.getElementById("LNK_Asignar").style.borderBottom = "5px solid grey";


function MostrarFormEliminar_click()
{
    document.getElementById("FormularioEliminar").style.display = "block";
    document.getElementById("Tablaroles").style.display = "none";
    document.getElementById("FormularioAgregar").style.display = "none";
    document.getElementById("FormularioEditar").style.display = "none";
    

    document.getElementById("LNK_Eliminar").style.borderBottom = "5px solid grey";
    document.getElementById("LNK_Asignar").style.borderBottom = "none";
    document.getElementById("LNK_Agregar").style.borderBottom = "none";
}

function MostrarFormAsignar_Click()
{
    document.getElementById("Tablaroles").style.display = "block";
    document.getElementById("FormularioEliminar").style.display = "none";
    document.getElementById("FormularioAgregar").style.display = "none";
    document.getElementById("FormularioEditar").style.display = "none";

    document.getElementById("LNK_Asignar").style.borderBottom = "5px solid grey";
    document.getElementById("LNK_Eliminar").style.borderBottom = "none";
    document.getElementById("LNK_Agregar").style.borderBottom = "none";
}

function MostrarFormAgregar_Click()
{
    document.getElementById("FormularioAgregar").style.display = "block";
    document.getElementById("FormularioEliminar").style.display = "none";
    document.getElementById("Tablaroles").style.display = "none";
    document.getElementById("FormularioEditar").style.display = "none";

    document.getElementById("LNK_Agregar").style.borderBottom = "5px solid grey";
    document.getElementById("LNK_Eliminar").style.borderBottom = "none";
    document.getElementById("LNK_Asignar").style.borderBottom = "none";
}


$(document).on("click",".editar_Click",function()
{
    /*fila = $(this).closest("tr");
    id = parseInt(fila.find("td:eq(0)").text());
    alert(id);*/
    var valores="";
    var i = 0;
    $(this).parents("tr").find("td").each(function(){
        var str = $(this).html();
        if(!str.includes("<a"))
        {
            valores=$(this).html();
            if(i == 1)
            {
                document.getElementById("TXT_Nombre1").value = valores;
            }
            else if(i == 2)
            {
                document.getElementById("TXT_Descripcion1").value = valores;
            }
        }
        i++;
    });
    //alert(valores);

    document.getElementById("FormularioEditar").style.display = "block";
    document.getElementById("FormularioEliminar").style.display = "none"; 
});

$(document).on("click",".eliminar_Click",function()
{
    fila = $(this).closest("tr");
    id = parseInt(fila.find("td:eq(0)").text());
    alert(id);
});



function btnEditar_Click()
{
    var nombre = document.getElementById("TXT_Nombre1").value;
    var descripcion = document.getElementById("TXT_Descripcion1").value;
    if(nombre == ""|| descripcion == "")
    {
        alertify.error('¡Debe llenar todos los campos!');
    }
    else
    {
        alertify.success('¡Editado con exito!');
        document.getElementById("TXT_Nombre1").value = "";
        descripcion = document.getElementById("TXT_Descripcion1").value = "";
        document.getElementById("FormularioEliminar").style.display = "block";
        document.getElementById("FormularioEditar").style.display = "none";
    }
}


function btnAgregar_Click()
{
    var nombre = document.getElementById("TXT_Nombre").value;
    var descripcion = document.getElementById("TXT_Descripcion").value;
    if(nombre == ""|| descripcion == "")
    {
        alertify.error('¡Debe llenar todos los campos!');
    }
    else
    {
        alertify.success('¡Agregado con exito!');
        document.getElementById("TXT_Nombre").value = "";
        descripcion = document.getElementById("TXT_Descripcion").value = "";
    }
}


document.getElementById("LNK_Agregar").onmouseover = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "5px solid lightgrey";
    }
}

document.getElementById("LNK_Agregar").onmouseout = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "none";
    }
}


document.getElementById("LNK_Asignar").onmouseover = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "5px solid lightgrey";
    }
}

document.getElementById("LNK_Asignar").onmouseout = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "none";
    }
}

document.getElementById("LNK_Eliminar").onmouseover = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "5px solid lightgrey";
    }
}

document.getElementById("LNK_Eliminar").onmouseout = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "none";
    }
}




$(document).on("click",".btn_Add",function()
{
	fila = $(this).closest("tr");
    id = parseInt(fila.find("td:eq(0)").text());
    alert(id);
});

$(document).on("click",".btn_delete",function()
{
	fila = $(this).closest("tr");
    id = parseInt(fila.find("td:eq(1)").text());
    alert(id);
});
