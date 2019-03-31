<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$id_klasy = mysqli_real_escape_string($conn, $_POST['klasa']);
$nazwa = mysqli_real_escape_string($conn, $_POST['nazwa']);
$id_wychowawcy = mysqli_real_escape_string($conn, $_POST['wychowawca']);
$sql = "UPDATE klasy
SET Nazwa='$nazwa', IDWychowawcy=$id_wychowawcy
WHERE IDKlasy=$id_klasy";
$error = '';
if( !mysqli_query( $conn, $sql ) )
{
	$error = "Nie udało się usunąć klasy";
}
echo $error . $sql;
?>