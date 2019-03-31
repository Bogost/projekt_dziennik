<!DOCTYPE html>
<?php
	include 'config-strona.ini';
?>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="rejlog-styl.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="jsscript/rejestracjaScript.js"></script>
		<title><?php echo $nazwa_aplikacji ?></title>
	</head>
	<body>
		<div id="formularz">
			<form method="post" action="mechanizmyRejLog/mechanizm_rejestracji.php" id="formularzRejestracji">
				<table>
					<th>
						<td colspan="3" id="tytul">Rejestracja</td>
					</th>
					<tr>
						<td>
							Login:
						</td>
						<td>
							<input type="text" name="login">
						</td>
						<td  id="errorLogin" class="error">
						</td>
					</tr>
					<tr>
						<td>
							Email:
						</td>
						<td>
							<input type="email" name="email">
						</td>
						<td  id="errorEmail" class="error">
						</td>
					</tr>
					<tr>
						<td>
							Hasło:
						</td>
						<td>
							<input type="password" name="haslo" id="haslo">
						</td>
						<td  id="errorHaslo" class="error">
						</td>
					</tr>
					<tr>
						<td>
							Powtórz hasło:
						</td>
						<td>
							<input type="password" id="powtorzoneHaslo">
						</td>
						<td  id="errorPowtorzoneHaslo" class="error">
						</td>
					</tr>
				</table>
				<div id="przyciski">
					<input type="button" value="anuluj" id="anuluj">
					<input type="button" value="wyślij" id="wyslij">
				</div>
			</form>
		</div>
	</body>
</html>