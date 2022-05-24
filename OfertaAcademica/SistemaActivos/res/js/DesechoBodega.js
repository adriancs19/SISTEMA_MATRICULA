
function FormDesechos_Click()
{
    document.getElementById("FormularioDesecho").style.display = "block";
    document.getElementById("FormularioBodega").style.display = "none";

    document.getElementById("LNK_Desecho").style.borderBottom = "5px solid grey";
    document.getElementById("LNK_Bodega").style.borderBottom = "none";
}

function FormBodega_Click()
{
    document.getElementById("FormularioBodega").style.display = "block";
    document.getElementById("FormularioDesecho").style.display = "none";

    document.getElementById("LNK_Bodega").style.borderBottom = "5px solid grey";
    document.getElementById("LNK_Desecho").style.borderBottom = "none";
}

document.getElementById("LNK_Desecho").onmouseover = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "5px solid lightgrey";
    }
}

document.getElementById("LNK_Desecho").onmouseout = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "none";
    }
}


document.getElementById("LNK_Bodega").onmouseover = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "5px solid lightgrey";
    }
}

document.getElementById("LNK_Bodega").onmouseout = function() 
{
    if(this.style.borderBottom != "5px solid grey")
    {
        this.style.borderBottom = "none";
    }
}




