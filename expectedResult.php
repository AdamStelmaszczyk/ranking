<?php
require 'math.php';
require 'db.php';
require 'connect.php';

if (isset($_REQUEST['a']) &&
	isset($_REQUEST['b']) &&
	isset($_REQUEST['c']) &&
	isset($_REQUEST['d']) &&
	$_REQUEST['a'] != "null" &&
	$_REQUEST['c'] != "null") {

	$data = getRanking($con);
	
	$ra = getPoints($data, $_REQUEST['a']);
	$rb = ($_REQUEST['b'] !== 'null') ? getPoints($data, $_REQUEST['b']) : $ra;
	$rc = getPoints($data, $_REQUEST['c']);
	$rd = ($_REQUEST['d'] !== 'null') ? getPoints($data, $_REQUEST['d']) : $rc;
	
	$expectedScore = expectedScore($ra, $rb, $rc, $rd);
	$expectedResult = actualScoreToResult($expectedScore);
	echo $expectedResult;
	
} else {
	echo 'Bad arguments.';
}
