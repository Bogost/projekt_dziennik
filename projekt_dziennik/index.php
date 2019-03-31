<!DOCTYPE html>
<?php
	include 'config-strona.ini';
?>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="index-styl.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title><?php echo $nazwa_aplikacji ?></title>
	</head>
	<body>
		<section id="sekcja1">
			<div id="menu" >
				<ul id="menuList">
					<li class="menuItem"><a href="logowanie.php">Zaloguj się</a></li>
					<li class="menuItem"><a href="rejestracja.php">Zarejestruj</a></li>
				</ul>
			</div>
			<div id="main">
				<span id="nazwaStrony"><?php echo $nazwa_aplikacji ?></span>
			</div>
		</section>
	</body>
</html>