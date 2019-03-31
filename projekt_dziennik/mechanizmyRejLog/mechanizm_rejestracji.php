<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
if(isset($_POST['login']) && !empty($_POST['login'])
	AND isset($_POST['email']) && !empty($_POST['email'])
	AND isset($_POST['haslo']) && !empty($_POST['haslo'])){
		
	if(!eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email)){
    // Return Error - Invalid Email
	}else{
		$login = mysql_real_escape_string($login);
		$email = mysql_real_escape_string($email);
		$haslo = mysql_real_escape_string($haslo);
		$hash = md5( rand(0,1000) );
		$password = md5( rand(1000,5000) );
		
		mysql_query("INSERT INTO uzytkownicy (Login, Haslo, Email, Hash) VALUES(
		'". mysql_escape_string($login) ."', 
		'". mysql_escape_string($haslo) ."', 
		'". mysql_escape_string($email) ."', 
		'". mysql_escape_string($hash) ."') ");
	}
}
?>