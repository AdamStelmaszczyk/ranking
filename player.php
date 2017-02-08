<?php
require 'db.php';
require 'connect.php';

if (isset($_REQUEST['name']) &&
	isset($_REQUEST['surname']) &&
	isset($_REQUEST['pass'])) {
		
	$name = trim($_REQUEST['name']);
	$surname = trim($_REQUEST['surname']);
	if (empty($name) || empty($surname)) {
		$wrongFields = true;
	} else {
		if (checkPassword($_REQUEST['pass'])) {
			$saved = mysqli_query($con, "INSERT INTO gracze (imie, nazwisko, punkty) VALUES ('" . $_REQUEST['name'] . "', '" . $_REQUEST['surname'] . "', 1000)");
		} else {
			$wrongPassword = true;
		}
	}
}

require 'header.php';
?>

<div class="container">

<?php 
if (isset($saved) && $saved) echo '<div class="alert alert-success">Dodano zawodnika ' . $name . ' ' . $surname . ' z 1000 punktów rankingowych na początek.</div>';
if (isset($saved) && !$saved) echo '<div class="alert alert-warning">Zawodnik o nazwisku ' . $surname . ' już istnieje. Podaj inne nazwisko.</div>';
if (isset($wrongPassword)) echo '<div class="alert alert-warning">Nie zapisano. Podane złe hasło.</div>' ;
if (isset($wrongFields)) echo '<div class="alert alert-warning">Nie zapisano. Wypełnij wszystkie pola.</div>';
?>

<div class="jumbotron">
<form method="post">

	<h3>Imię</h3>
	
	<div class="form-group">
		<input class="form-control" name="name">
	</div>
	
	<h3>Nazwisko</h3>
	
	<div class="form-group">
		<input class="form-control" name="surname">
	</div>
	
	<h3>Hasło</h3>
	<div class="form-group">
		<input type="password" class="form-control" name="pass">
	</div>
	
	<button type="submit" class="btn btn-success">Dodaj</button>

</form>
</div>

</div>

<script>$("#nav3").addClass('active');</script>
