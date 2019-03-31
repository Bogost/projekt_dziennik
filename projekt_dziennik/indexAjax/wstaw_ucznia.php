<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$imie = mysqli_real_escape_string($conn, $_POST['imie']);
$nazwisko = mysqli_real_escape_string($conn, $_POST['nazwisko']);
$id_klasy = mysqli_real_escape_string($conn, $_POST['klasa']);
$sql = "INSERT INTO uczniowie (Imie, Nazwisko, IDKlasy) VALUES ('$imie', '$nazwisko', $id_klasy)";
$error = '';
if( !mysqli_query( $conn, $sql ) )
{
	$error = "Nie udało się wstawić ucznia " . $imie . ' ' . $nazwisko . ' ' . $sql;
}
echo $error;
?>