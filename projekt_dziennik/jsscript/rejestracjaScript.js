$(document).ready(function()
{
	$(":root").on("click","#anuluj",function(){
		window.location.href("index.php");
	});
	$(":root").on("click","#wyslij",function(){
		var moznaWyslac = true;
		$(".error").text("");
		
		if( $("input[name=login]").val()=="" )
		{
			$("input[name=login]").attr("class", "do_wypelnienia");
			$("#errorLogin").text("Podaj login.");
			moznaWyslac = false;
		}
		if( $("input[name=email]").val()=="" )
		{
			$("input[name=email]").attr("class", "do_wypelnienia");
			$("#errorEmail").text("Podaj email.");
			moznaWyslac = false;
		}
		
		if( $("#haslo").val()=="" )
		{
			$("#haslo").attr("class", "do_wypelnienia");
			$("#errorHaslo").text("Podaj haslo.");
			moznaWyslac = false;
		}
		else if( $("#powtorzoneHaslo").val()=="" )
		{
			$("#powtorzoneHaslo").attr("class", "do_wypelnienia");
			$("#errorPowtorzoneHaslo").text("Podaj haslo.");
			moznaWyslac = false;
		}
		else if( $("#haslo").val()!=$("#powtorzoneHaslo").val() )
		{
			$("#powtorzoneHaslo").val("");
			$("#haslo").val("");
			$("#errorHaslo").text("Hasła niezgodne");
			moznaWyslac = false;
		}
		
		if( moznaWyslac )
		{
			//$("#formularzRejestracji").submit();
		}
	});
});