var idPrzyciskuObecnieRozwinietejKlasy = null;

function zwijanieKlasy(idPrzycisku)
{
	$("#" + idPrzycisku).attr("class","rozwinKlase");
	$("#" + idPrzycisku).attr("value","🡆");//arrow right
	$(".uczniowie").remove();
	if( idPrzyciskuObecnieRozwinietejKlasy == idPrzycisku )
		idPrzyciskuObecnieRozwinietejKlasy = null;
	else
		idPrzyciskuObecnieRozwinietejKlasy = idPrzycisku;
}

function rozwijanieKlasy(idPrzycisku)
{
	//$(this).attr("id")
	var idKlasy = idPrzycisku;
	idKlasy = idKlasy.replace("klasa_","");
	if( idPrzyciskuObecnieRozwinietejKlasy !== null )
	{
		zwijanieKlasy( idPrzyciskuObecnieRozwinietejKlasy );
	}
	
	idPrzyciskuObecnieRozwinietejKlasy = idPrzycisku;
	$("#" + idPrzycisku).attr("class","activRozwinKlase");
	$("#" + idPrzycisku).attr("value","🡇");//arrow down
	var rzadPrzycisku = $("#" + idPrzycisku).parent().parent();
	$.post("indexAjax/uczniowie.php",
	{
		klasa: idKlasy
	},function(result)
	{
		rzadPrzycisku.after(result);
	});
	idObecnieRozwinietejKlasy = idPrzycisku;
}

$(document).ready(function()
{
//załadowanie listy klas
	$("#main").load("indexAjax/klasy.php");
//============================================================================================
//rozwijanie klasy o uczniów
	$(":root").on("click",".rozwinKlase",function(){
		var idPrzycisku = $(this).attr("id");
		rozwijanieKlasy(idPrzycisku);
	});
	//zwijanie
	$(":root").on("click",".activRozwinKlase",function(){
		var idPrzycisku = $(this).attr("id");
		zwijanieKlasy(idPrzycisku);
	});
//============================================================================================
//dodawanie nowych uczniów
	$(":root").on("click",".dodajUcznia",function(){
		$(this).parent().parent().before(`
			<tr class="wstawianieUcznia uczniowie">
				<td class="imieUcznia"><input type="text" id="inputImieUcznia"></td>
				<td class="nazwiskoUcznia"><input type="text" id="inputNazwiskoUcznia"></td>
			</tr>
		`);
		$(this).val("Zatwierdz");
		$(this).attr("class","zatwierdzDodanieUcznia");
	});
	$(":root").on("click",".zatwierdzDodanieUcznia",function(){
		var idKlasy = $(this).attr("id");
		idKlasy = idKlasy.replace("dodajUczniaZKlasy_","");
		$.post("indexAjax/wstaw_ucznia.php",
		{
			imie: $("#inputImieUcznia").val(),
			nazwisko: $("#inputNazwiskoUcznia").val(),
			klasa: idKlasy
		},function(result)
		{
			$("#errorOutput").html(result);
		});
		rozwijanieKlasy($(this).attr("id").replace("dodajUczniaZKlasy_","klasa_"));
	});
//============================================================================================
//dodawanie nowej klasy
	//utworzenie pola do dodania nowej klasy
	$(":root").on("click","#buttonNowaKlasa",function(){
		$("#nowaKlasa").html(`
			<p>Wprowadź nazwe nowej klasy:</p>
			<input type="text" id="nowaKlasaNazwa">
			<p>Wychowawca:</p>
			<select id="nowaKlasaWychowawca"></select>
		`);
		//select option ze wszystkimi wychowawcami
		$("#nowaKlasaWychowawca").load("indexAjax/select_wychowawcy.php");
		$("#nowaKlasa").append(`
			<input type="button" value="zatwierdź" id="nowaKlasaWstaw">
		`);
	});
	//dodanie nowej klasy
	$(":root").on("click","#nowaKlasaWstaw",function(){
		$.post("indexAjax/wstaw_klase.php",
		{
			nazwa: $("#nowaKlasaNazwa").val(),
			wychowawca: $("#nowaKlasaWychowawca").val()
		},function(result)
		{
			$("#errorOutput").html(result);
		});
		location.reload();
	});
//============================================================================================
//edycja,usuwanie klasy
	//usuwanie
	$(":root").on("click",".usunKlase",function(){
		var idKlasy = $(this).attr("id");
		idKlasy = idKlasy.replace("usunKlase_","");
		$.post("indexAjax/usun_klase.php",
		{
			klasa: idKlasy
		},function(result)
		{
			$("#errorOutput").html(result);
		});
		location.reload();
	});
	//uruchom zmienianie
	$(":root").on("click",".edytujKlase",function(){
		var idKlasy = $(this).attr("id");
		idKlasy = idKlasy.replace("edytujKlase_","");
		var nazwa = $('#nazwa_'+idKlasy).text();
		$('#nazwa_'+idKlasy).html(`
			<input type="text" id="inputNazwaKlasy_${idKlasy}" value="${nazwa}">
		`);
		$('#imieWychowawcy_'+idKlasy).html(`
			<select id="inputWychowawca_${idKlasy}"></select>
		`);
		$('#inputWychowawca_'+idKlasy).load("indexAjax/select_wychowawcy.php");
		$(this).val("Zatwierdz");
		$(this).attr("class","zatwierdzEdycjeKlasy");
	});
	//zatwierdz zmiany
	$(":root").on("click",".zatwierdzEdycjeKlasy",function(){
		var idKlasy = $(this).attr("id");
		idKlasy = idKlasy.replace("edytujKlase_","");
		$.post("indexAjax/edytuj_klase.php",
		{
			klasa: idKlasy,
			nazwa: $("#inputNazwaKlasy_"+idKlasy).val(),
			wychowawca: $("#inputWychowawca_"+idKlasy).val()
		},function(result)
		{
			$("#errorOutput").html(result);
		});
		location.reload();
	});
});