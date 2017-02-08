<?php
require 'db.php';
require 'connect.php';

if (isset($_REQUEST['name']) &&
	isset($_REQUEST['surname'])) {
		
	$name = trim($_REQUEST['name']);
	$surname = trim($_REQUEST['surname']);
	if (empty($name) || empty($surname)) {
		$wrongFields = true;
	} else {
		$saved = mysqli_query($con, "INSERT INTO gracze (imie, nazwisko, punkty) VALUES ('" . $_REQUEST['name'] . "', '" . $_REQUEST['surname'] . "', 1000)");
	}
}

require 'header.php';
?>

<div class="container">

<?php 
if (isset($saved) && $saved) echo '<div class="alert alert-success">Added player ' . $name . ' ' . $surname . ' with 1000 ranking points for a beginning.</div>';
if (isset($saved) && !$saved) echo '<div class="alert alert-warning">Player with last name ' . $surname . ' already exists. Provide different last name.</div>';
if (isset($wrongFields)) echo '<div class="alert alert-warning">Not saved, fill in all fields.</div>';
?>

<div class="jumbotron">
<form method="post">

	<h3>First name</h3>
	
	<div class="form-group">
		<input class="form-control" name="name">
	</div>
	
	<h3>Second name</h3>
	
	<div class="form-group">
		<input class="form-control" name="surname">
	</div>
	
	<button type="submit" class="btn btn-success">Add</button>

</form>
</div>

</div>

<script>$("#nav3").addClass('active');</script>
