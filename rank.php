<?php
header("Content-type: text/json");

if (!isset($_REQUEST['name'])) {
	die("Bad name");
}
$name = $_REQUEST['name'];

require 'db.php';
require 'connect.php';

$response = array(1000);

$sql = "SELECT a, b, c, d, delta FROM `mecze` WHERE a='$name' OR b='$name' OR c='$name' OR d='$name' ORDER BY data";
$result = mysqli_query($con, $sql);
while ($row = mysqli_fetch_array($result)) {
	if ($name == $row['a'] || $name == $row['b']) {
		if (!isset($row['b']) && isset($row['d'])) {
			$response[] = end($response) + 2 * $row['delta'];
		} else {
			$response[] = end($response) + $row['delta'];
		}
	}
	else {
		if (!isset($row['d']) && isset($row['b'])) {
			$response[] = end($response) - 2 * $row['delta'];
		} else {
			$response[] = end($response) - $row['delta'];
		}
	}
}

echo json_encode($response); 
