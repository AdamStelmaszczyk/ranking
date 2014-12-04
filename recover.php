<?php 

require 'db.php';
require 'connect.php';

$points = array();
$sql = "SELECT id, a, b, c, d, delta FROM `mecze` ORDER BY data";

$result = mysqli_query($con, $sql);
while ($row = mysqli_fetch_array($result)) {
	
	if (!isset($points[$row['a']])) $points[$row['a']] = 1000;
	$points[$row['a']] += $row['delta'];
	if (!isset($row['b']) && isset($row['d'])) {
		$points[$row['a']] += $row['delta'];
	} else {
		if (!isset($points[$row['b']])) $points[$row['b']] = 1000;
		$points[$row['b']] += $row['delta'];
	}
	
	if (!isset($points[$row['c']])) $points[$row['c']] = 1000;
	$points[$row['c']] -= $row['delta'];
	if (!isset($row['d']) && isset($row['b'])) {
		$points[$row['c']] -= $row['delta'];
	} else {
		if (!isset($points[$row['d']])) $points[$row['d']] = 1000;
		$points[$row['d']] -= $row['delta'];
	}
}

print_r($points);

$sum = 0;
foreach ($points as $key => $value) {
	$sum += $value;
}
print_r($sum);
