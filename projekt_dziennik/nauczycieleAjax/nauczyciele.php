<tr>
	<th colspan="2">nauczyciele</th>
</tr>
<tr>
	<th>Imie</th>
	<th>Nazwisko</th>
</tr>
<?php
include '../config.ini';
$conn = mysqli_connect( $serwer, $user, $haslo, $baza );
$conn->query("SET CHARSET utf8");
$sql =
'SELECT * FROM nauczyciele WHERE IDNauczyciela=1
UNION
SELECT * FROM nauczyciele ORDER BY Nazwisko';
$wynik = mysqli_query( $conn, $sql );
$i=0;
while( $rzad = mysqli_fetch_assoc( $wynik ) )
{
	echo '<option value="' . $rzad['IDNauczyciela'] . '">'.
	$rzad['Imie'] . ' ' . $rzad['Nazwisko']
	.'</option>';
	if( $i == 0 )
	{
		echo '<tr>
		<td class="imieNauczyciela" id="imieNauczyciela_'.$rzad['IDNauczyciela'].'">'.
			'<span id="imie_'.$rzad['IDNauczyciela'].'">'.$rzad['Imie'].'</span>'.
		'</td>
		<td class="nazwiskoNauczyciela" id="nazwiskoNauczyciela_'.$rzad['IDKlasy'].'">'.$rzad['Nazwisko'].'</td>
		</tr>';
	}
	else
	{
		echo '<tr>
		<td class="imieNauczyciela" id="imieNauczyciela_'.$rzad['IDNauczyciela'].'">'.
			'<input type="button" id="edytujKlase_'.$rzad['IDNauczyciela'].'" value="edytuj" class="edytujKlase">'.
			'<input type="button" id="usunKlase_'.$rzad['IDNauczyciela'].'" value="usuń" class="usunKlase">'.
			'<span id="imie_'.$rzad['IDNauczyciela'].'">'.$rzad['Imie'].'</span>'.
		'</td>
		<td class="nazwiskoNauczyciela" id="nazwiskoNauczyciela_'.$rzad['IDNauczyciela'].'">'.$rzad['Nazwisko'].'</td>
		</tr>';
	}
	$i++;
}
?>