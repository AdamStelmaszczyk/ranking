<?php
header("Content-type: text/json");

require 'math.php';
require 'db.php';
require 'connect.php';

$ranking = getRanking($con);

$step = 50;

$bins = array();
foreach ($ranking as $row) {
	$bin = $row['punkty'] / $step;
	$bins[$bin]++;
}

$response = array();
foreach ($bins as $key => $value) {
	$rank = $key * $step + $step / 2;
	$response[] = array("x" => $rank, "low" => 0, "high" => $value, "color" => getRankColor($rank));
}
$response = array_reverse($response);

echo json_encode($response);
