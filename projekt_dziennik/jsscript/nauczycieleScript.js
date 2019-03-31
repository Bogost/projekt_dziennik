$(document).ready(function()
{
//załadowanie listy nauczycieli
	$("#main").load("nauczycieleAjax/nauczyciele.php");
//============================================================================================
//dodawanie nowego nauczyciela
	//utworzenie pola do dodania nowego nauczyciela
	$(":root").on("click","#buttonNowyNauczyciel",function(){
		$("#nowyNauczyciel").html(`
			<p>Imie:</p>
			<input type="text" id="nowyNauczycielImie">
			<p>Nazwisko:</p>
			<input type="text" id="nowyNauczycielNazwisko">
			<input type="button" value="zatwierdź" id="nowyNauczycielWstaw">
		`);
	});
	//dodanie nowej klasy
	$(":root").on("click","#nowyNauczycielWstaw",function(){
		$.post("nauczycieleAjax/wstaw_nauczyciela.php",
		{
			imie: $("#nowyNauczycielImie").val(),
			nazwisko: $("#nowyNauczycielNazwisko").val()
		},function(result)
		{
			$("#errorOutput").html(result);
		});
		location.reload();
	});
//============================================================================================
//edycja,usuwanie nauczyciela
});