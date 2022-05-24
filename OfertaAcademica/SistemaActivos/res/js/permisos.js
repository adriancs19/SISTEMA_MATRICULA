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