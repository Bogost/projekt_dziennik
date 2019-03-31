<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$nazwa = mysqli_real_escape_string($conn, $_POST['nazwa']);
$id_wychowawcy = mysqli_real_escape_string($conn, $_POST['wychowawca']);
$sql = "INSERT INTO klasy (Nazwa, IDWychowawcy) VALUES ('$nazwa', $id_wychowawcy)";
$error = '';
if( !mysqli_query( $conn, $sql ) )
{
	$error = "Nie udało się wstawić klasy " . $nazwa;
}
echo $error;
?>