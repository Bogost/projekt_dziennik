<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$imie = mysqli_real_escape_string($conn, $_POST['imie']);
$nazwisko = mysqli_real_escape_string($conn, $_POST['nazwisko']);
$sql = "INSERT INTO nauczyciele (Imie, Nazwisko) VALUES ('$imie', '$nazwisko')";
$error = '';
if( !mysqli_query( $conn, $sql ) )
{
	$error = "Nie udało się wstawić nauczyciela";
}
echo $error;
?>