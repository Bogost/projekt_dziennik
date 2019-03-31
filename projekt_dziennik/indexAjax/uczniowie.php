<?php
include '../config.ini';
include '../arrows.php';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$id_klasy = $_POST["klasa"];
?>
<tr class="uczniowie">
	<th colspan="2">Uczniowie</th>
</tr>
<tr class="uczniowie">
	<th>Imie</th>
	<th>Nazwisko</th>
</tr>
<?php
$sql = "SELECT IDUcznia, Imie, Nazwisko FROM uczniowie 
WHERE IDKlasy=$id_klasy";
$wynik = mysqli_query( $conn, $sql );
while( $rzad = mysqli_fetch_assoc( $wynik ) )
{
	echo '<tr class="uczenKlasy_' . $id_klasy . ' uczniowie">
	<td class="imieUcznia id="uczen_'.$rzad['IDUcznia'].'">'
		.$rzad['Imie'].
	'</td>
	<td class="nazwiskoUcznia" >'.$rzad['Nazwisko'].'</td>
	</tr>';
}
echo
'<tr class="uczenKlasy_' . $id_klasy . ' uczniowie">
	<td colspan="2" id="wierszDodajUcznia">
		<input type="button" class="dodajUcznia" id="dodajUczniaZKlasy_' . $id_klasy . '" value="dodaj ucznia">
	</td>
</tr>';
?>