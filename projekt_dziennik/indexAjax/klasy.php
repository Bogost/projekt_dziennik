<?php
include '../config.ini';
include '../arrows.php';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
?>
<tr>
	<th>klasa</th>
	<th>wychowawca</th>
</tr>
<?php
$sql = 'SELECT IDKlasy, Nazwa, Imie, Nazwisko FROM klasy AS k
JOIN nauczyciele AS n ON k.IDWychowawcy=n.IDNauczyciela
WHERE IDKlasy=1';
$wynik = mysqli_query( $conn, $sql );
while( $rzad = mysqli_fetch_assoc( $wynik ) )
{
	echo '<tr>
	<td class="nazwaKlasy">'
	.'<input type="button" id="klasa_'.$rzad['IDKlasy'].'" value="' . $right_arrow . '" class="rozwinKlase">'
	.$rzad['Nazwa'].'</td>
	<td class="imieWychowawcy" >'.$rzad['Imie'].' '.$rzad['Nazwisko'].'</td>
	</tr>';
}

$sql = 'SELECT IDKlasy, Nazwa, Imie, Nazwisko FROM klasy AS k
JOIN nauczyciele AS n ON k.IDWychowawcy=n.IDNauczyciela
WHERE IDKlasy<>1
ORDER BY Nazwa';
$wynik = mysqli_query( $conn, $sql );
while( $rzad = mysqli_fetch_assoc( $wynik ) )
{
	echo '<tr>
	<td class="nazwaKlasy" id="nazwaKlasy_'.$rzad['IDKlasy'].'">'.
		'<input type="button" id="klasa_'.$rzad['IDKlasy'].'" value="' . $right_arrow . '" class="rozwinKlase">'.
		'<input type="button" id="edytujKlase_'.$rzad['IDKlasy'].'" value="edytuj" class="edytujKlase">'.
		'<input type="button" id="usunKlase_'.$rzad['IDKlasy'].'" value="usuń" class="usunKlase">'.
		'<span id="nazwa_'.$rzad['IDKlasy'].'">'.$rzad['Nazwa'].'</span>'.
	'</td>
	<td class="imieWychowawcy" id="imieWychowawcy_'.$rzad['IDKlasy'].'">'.$rzad['Imie'].' '.$rzad['Nazwisko'].'</td>
	</tr>';
}
?>