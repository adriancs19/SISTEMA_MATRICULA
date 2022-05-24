//==============================================================================================
//  Menu
//==============================================================================================
function openNav()
{
    document.getElementById("mySidenav").style.width = "300px";
}



function closeNav() {
    document.getElementById("mySidenav").style.width = "0px";
}


function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
//==============================================================================================