<?php
require 'math.php';
require 'db.php';
require 'connect.php';

if (isset($_REQUEST['pass'])) {
	if ($_REQUEST['pass'] === "lol") {
		undoLastMatch($con);
		$undo = true;
	} else {
		$wrongPassword = true;
	}
}

$allPlayers = false;
if (isset($_REQUEST['allPlayers'])) {
    $allPlayers = ($_REQUEST['allPlayers'] === "true")?true:false;
    $ranking = ($_REQUEST['allPlayers'] === "true")?getRanking($con):getRankingForActivePlayers($con);    
} else {
    $ranking = getRankingForActivePlayers($con);    
}
 
$matches = getMatches($con);
$total_matches = getTotalMatches($con);

require 'header.php';
?>

<script src="js/highcharts.js"></script>
<script src="js/highcharts-more.js"></script>

<script src="js/bootstrap.min.js"></script>

<script src="js/jquery-ui.min.js"></script>

<div class="container">

<?php if (isset($undo)) echo '<div class="alert alert-success">Done.</div>' ?>
<?php if (isset($wrongPassword)) echo '<div class="alert alert-warning">Bad password.</div>' ?>

<div class="jumbotron">

	<h3>Last games</h3>
	
	<h6>(<a href="#" id="undo" title="Delete last game. You can't undo this operation.">Undo last game</a>)</h6>
	
	<div id="password">
		<form method="post">
			<h3>Password</h3>
			<div class="form-group">
				<input type="password" class="form-control" name="pass">
			</div>
			<button type="submit" class="btn btn-success" style="margin-bottom: 20px">Undo</button>
		</form>
	</div>
	
	<div class="table-responsive text-left">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Points</th>
					<th>Team</th>
					<th>Score</th>
					<th>Team</th>
					<th>Points</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<?php
					foreach ($matches as $row) {
						echo '<tr>';
						$delta = $row['delta'];
						if (!isset($row['b']) && isset($row['d'])) $delta = 2 * $row['delta'];
						echo '<td class="col-md-1">' . (($delta >= 0) ? "+$delta" : "$delta") . '</td>';
						echo '<td class="col-md-4"><strong><a class="scroll" style="color:' . getNameColor($ranking, $row['a']) . '">' . $row['a'] .'</a> <a class="scroll" style="color:' . getNameColor($ranking, $row['b']) . '">' . $row['b'] . '</a></strong></td>';
						echo '<td class="col-md-1">10:'.$row['cd'].'</td>';
						echo '<td class="col-md-4"><strong><a class="scroll" style="color:' . getNameColor($ranking, $row['c']) . '">' . $row['c'] .'</span> <a class="scroll" style="color:' . getNameColor($ranking, $row['d']) . '">' . $row['d'] . '</a></strong></td>';
						$delta = $row['delta'];
						if (!isset($row['d']) && isset($row['b'])) $delta = 2 * $row['delta'];
						echo '<td class="col-md-1">' . (($delta >= 0) ? "-$delta" : "+" . (-$delta)) . '</td>';
						echo '</tr>';
					}
				?>
			</tbody>
		</table>
	</div>

</div>

<div class="jumbotron">
	<h3>Ranking </h3>
        <h6>(<?php
            if (!$allPlayers) {
            	echo '<a href="index.php?allPlayers=true" title="Active players played a game in the last month. Click, to switch.">active</a>';
            } else {
            	echo '<a href="index.php?allPlayers=false" title="Active players played a game in the last month. Click, to switch.">all</a>';
            }
            ?>
            players based on <?php echo $total_matches; ?> games)</h6>
	
	<table class="table table-striped text-left">
		<thead>
			<tr>
				<th>Place</th>
				<th>Player</th>
				<th>% wins</th>
				<th>Points</th>
			</tr>
		</thead>
		<tbody>
			<?php
				$placeToRender = $place = 1;
				$lastPoints = 0;
				$lastPercent = 0;
				foreach ($ranking as $row) {
					$percent = ($row['meczy'] == 0) ? 'n/a' : round(100 * $row['wygranych'] / $row['meczy']);
					if ($lastPoints != $row['punkty'] || $lastPercent != $percent) {
						$placeToRender = $place;
					}
					echo '<tr>';
					echo '<td class="col-md-1">' . $placeToRender . '</td>';
					echo '<td  id="' . $row['nazwisko'] . '" class="col-md-1"><strong><a style="color:' . getRankColor($row['punkty']) . '" data-toggle="popover" class="name" id="' . $row['nazwisko']. '">' . $row['imie'] . ' ' . $row['nazwisko'] . '</a></strong></td>';
					echo '<td class="col-md-1">' . $percent . '</td>';
					echo '<td class="col-md-1">' . $row['punkty'] . '</td>';
					echo '</tr>';
					$lastPoints = $row['punkty'];
					$lastPercent = $percent;
					$place++;
				}
			?>
		</tbody>
	</table>
</div>

<div id="container" style="height: 200px"></div>

</div>

<div style="text-align: center; padding: 10px">
	<a href="https://github.com/AdamStelmaszczyk/ranking">Would you like to have such ranking? Or maybe you have some remarks? See the GitHub repo.</a>
</div>

<script>
$("#password").hide();
$("#undo").click(function() {
	$("#password").toggle("fast");
});

$("#nav1").addClass('active');

$('.name').popover({ 
	placement: 'top',
	html: true,
	trigger: 'click focus',
	title: 'Points over time',
	content: function() { 
		return getContent($.now(), $(this).attr('id')); 
	}
});

// closing popover on click outside
$('body').on('click', function (e) {
    $('[data-toggle="popover"]').each(function () {
        //the 'is' for buttons that trigger popups
        //the 'has' for icons within a button that triggers a popup
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});

function getContent(divId, name) {
	$.ajax({
		url: "rank.php",
		data: { "name": name },
		success: function(json) {
			$('#' + divId).highcharts({
				legend: {
					enabled: false
				},
				title: {
					text: null
				},
				yAxis: {
					title: {
						text: null
					},
				},
				xAxis: {
					labels: {
						enabled: false
					},
					tickLength: 0
				},        
				tooltip: {
					formatter: function () {
						return this.y;
					}
				},
				plotOptions: {
					series: {
						marker: {
							enabled: false
						}
					}
				},
				series: [{
					data: json,
				}]
			});
        }
    });
	return '<div style="width: 250px; height: 250px; background:url(img/spinner.gif) no-repeat center center" id="' + divId + '"></div>';
}

function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}

$.ajax({
	url: "histogram.php",
	data: { allPlayers: getUrlParameter('allPlayers') },
	success: function(json) {
		$('#container').highcharts({
			chart: {
				renderTo: 'container',
				type: 'columnrange'
			},
			legend: {
				enabled: false
			},
			title: {
				text: null
			},
			xAxis: {
				title: {
					text: 'Points'
				},
				floor: 0,
				minPadding: 0.1,
				maxPadding: 0.1
			},
			yAxis: {
				title: {
					text: 'Number of players'
				},
				tickInterval: 2,
				min: 0
			},
			tooltip: {
				enabled: false
			},
			series: [{
				data: json,
			}]
		});
	}
});

$('.scroll').each(function () {
	$(this).click(function() {
		
		var target = $('#' + $(this).text());
		$('body').animate(
			{ scrollTop: target.offset().top - $(window).height() / 2 }, 
			200, 
			function() {  target.effect('highlight'); }
		);
	});
});
</script>
