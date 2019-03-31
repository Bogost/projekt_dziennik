<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$sql =
'SELECT * FROM nauczyciele WHERE IDNauczyciela=1
UNION
SELECT * FROM nauczyciele ORDER BY Nazwisko';
$wynik = mysqli_query( $conn, $sql );
while( $rzad = mysqli_fetch_assoc( $wynik ) )
{
	echo '<option value="' . $rzad['IDNauczyciela'] . '">'.
	$rzad['Imie'] . ' ' . $rzad['Nazwisko']
	.'</option>';
}
?>