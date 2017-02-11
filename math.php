<?php 

function actualScore($ab, $cd) {
	if ($ab == 10) {
		return 10 / (10 + $cd);
	}
	if ($cd == 10) {
		return 1 - 10 / (10 + $ab);
	}
	throw new Exception('Illegal argument, one team must have 10 goals.');
}

function expectedScore($ra, $rb, $rc, $rd) {
	$rab = ($ra + $rb) / 2;
	$rcd = ($rc + $rd) / 2;
	return 1 / (1 + pow(10, ($rcd - $rab) / 500));
}

function ratingChange($actualScore, $expectedScore) {
	return round(100 * ($actualScore - $expectedScore));
}

function actualScoreToResult($actualScore) {
	if ($actualScore >= 0.5) {
		$cd = round(10 / $actualScore - 10);
		if ($cd == 10) $cd = 9;
		return "10:$cd";
	} 
	$ab = round(10 * $actualScore / (1 - $actualScore));
	if ($ab == 10) $ab = 9;
	return "$ab:10";
}

function getRankColor($rank) {
	if ($rank < 800) return "#808080";
	if ($rank < 900) return "#008000";
	if ($rank < 1000) return "#428bca";
	if ($rank < 1100) return "#8b27c1";
	if ($rank < 1200) return "#C49F27";
	return "#cc0000";
}

function getNameColor($ranking, $name) {
	if ($name == '') return "black";
	return getRankColor(getPoints($ranking, $name));
}
