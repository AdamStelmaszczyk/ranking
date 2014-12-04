<?php

function checkPassword($pass) {
	return $pass === "lol";
}

function getRanking($con) {
	$result = mysqli_query($con, "SELECT imie, nazwisko, punkty FROM gracze ORDER BY punkty DESC");
	$ranking = array();
	while ($row = mysqli_fetch_array($result)) {
		$ranking[] = $row;
	}
	return $ranking;
}

function sort_m($a, $b){
	$search = array('ę','ó','ą','ś','Ś','ł','Ł','ż','Ż','ź','Ź','ń','Ń');
	$replace = array('ezz','ozz','azz','szz','Szz','lzz','Lzz','zz_','Zz_',
		'zzz','Zzz','nzz','Nzz');
	$a = str_replace($search, $replace, $a);
	$b = str_replace($search, $replace, $b);
	$arrTmp = array($a, $b);
	sort($arrTmp);
	return ($a == $arrTmp[0]) ? -1 : 1;
}


function getSortedSurnames($ranking) {
	$surnames = array();
	foreach ($ranking as $row)
		$surnames[] = $row['nazwisko'];
	usort($surnames, sort_m);
	return $surnames;
}

function getPoints($data, $surname) {
	foreach ($data as $row) {
		if ($row['nazwisko'] === $surname) {
			return $row['punkty'];
		}
	}		
	throw new Exception('No "' . $surname . '" in data.');
}

function getMatches($con) {
	$result = mysqli_query($con, "SELECT a, b, c, d, cd, delta FROM mecze ORDER BY data DESC LIMIT 5");
	$data = array();
	while ($row = mysqli_fetch_array($result)) {
		$data[] = $row;
	}
	return $data;
}

function getTotalMatches($con) {
	$result = mysqli_query($con, "SELECT count(*) as total FROM mecze");
	$data = mysqli_fetch_assoc($result);
	return $data['total'];
}

function undoLastMatch($con) {
	$result = mysqli_query($con, "SELECT id, a, b, c, d, delta FROM `mecze` ORDER BY `data` DESC LIMIT 1");
	$row = mysqli_fetch_array($result);
	
	$delta = $row['delta'];
	if ($row['b'] == null && $row['d'] != null) $delta = 2 * $row['delta'];
	mysqli_query($con, "UPDATE `gracze` SET `punkty` = `punkty` - " . $delta . " WHERE `nazwisko` = '" . $row['a'] . "'");
	mysqli_query($con, "UPDATE `gracze` SET `punkty` = `punkty` - " . $delta . " WHERE `nazwisko` = '" . $row['b'] . "'");
	
	$delta = $row['delta'];
	if ($row['b'] != null && $row['d'] == null) $delta = 2 * $row['delta'];
	mysqli_query($con, "UPDATE `gracze` SET `punkty` = `punkty` + " . $delta . " WHERE `nazwisko` = '" . $row['c'] . "'");
	mysqli_query($con, "UPDATE `gracze` SET `punkty` = `punkty` + " . $delta . " WHERE `nazwisko` = '" . $row['d'] . "'");
	mysqli_query($con, "DELETE FROM `mecze` WHERE `id` = " . $row['id']);
}
