<?php
require 'math.php';
require 'db.php';
require 'connect.php';

$ranking = getRanking($con);
$surnames = getSortedSurnames($ranking);

$noOneTen = false;

if (isset($_REQUEST['a']) && 
	isset($_REQUEST['b']) && 
	isset($_REQUEST['c']) && 
	isset($_REQUEST['d']) && 
	isset($_REQUEST['ab']) && 
	isset($_REQUEST['cd'])) {
		
	if ((($_REQUEST['ab'] == 10) ^ ($_REQUEST['cd'] == 10)) != 1) {
		$noOneTen = true;
	} else {
		
		if ($_REQUEST['a'] == "null" || $_REQUEST['c'] == "null" 
		 || $_REQUEST['a'] == $_REQUEST['c'] || $_REQUEST['a'] == $_REQUEST['d']
		 || $_REQUEST['b'] == $_REQUEST['c'] || ($_REQUEST['b'] != 'null' && $_REQUEST['b'] == $_REQUEST['d'])) {
			$badTeams = true;
		} else {

			$a = $_REQUEST['a'];
			$b = $_REQUEST['b'];
			$c = $_REQUEST['c'];
			$d = $_REQUEST['d'];
			$ab = $_REQUEST['ab'];
			$cd = $_REQUEST['cd'];

			// put a & b as winners, c & d as losers
			if ($_REQUEST['cd'] == 10) {
				$a = $_REQUEST['c'];
				$b = $_REQUEST['d'];
				$c = $_REQUEST['a'];
				$d = $_REQUEST['b'];
				$ab = $_REQUEST['cd'];
				$cd = $_REQUEST['ab'];
			}

			// if somebody chosen himself two times in one team that's valid, but we count him only as one player
			if ($a == $b) $b = 'null'; 
			if ($c == $d) $d = 'null';

			// ensure alphabetical order of names in a team
			if ($b != 'null' && $b < $a) { $temp = $a; $a = $b; $b = $temp; } 
			if ($d != 'null' && $d < $c) { $temp = $c; $c = $d; $d = $temp; }

			$ra = getPoints($ranking, $a);
			$rb = ($b !== 'null') ? getPoints($ranking, $b) : $ra;
			$rc = getPoints($ranking, $c);
			$rd = ($d !== 'null') ? getPoints($ranking, $d) : $rc;

			$actualScore = actualScore($ab, $cd);
			
			$expectedScore = expectedScore($ra, $rb, $rc, $rd);
			
			$ratingChange = ratingChange($actualScore, $expectedScore); // ratingChange is delta

			$ra_prim = $ra + $ratingChange;
			$rb_prim = $rb + $ratingChange;
			$rc_prim = $rc - $ratingChange;
			$rd_prim = $rd - $ratingChange;

			// 1 vs 2 case
			if ($b === 'null' && $d !== 'null') {
				$ra_prim = $ra + $ratingChange; // single player won, he wins additional delta
			}
			if ($d === 'null' && $b !== 'null') {
				$rc_prim = $rc - $ratingChange; // single player lost, he loses additional delta
			}

			mysqli_query($con, "UPDATE gracze SET punkty = " . $ra_prim . ", meczy = meczy + 1, wygranych = wygranych + 1 WHERE nazwisko = '". $a . "'");
			if ($b !== 'null') {
				mysqli_query($con, "UPDATE gracze SET punkty = " . $rb_prim . ", meczy = meczy + 1, wygranych = wygranych + 1 WHERE nazwisko = '". $b . "'");
			}
			mysqli_query($con, "UPDATE gracze SET punkty = " . $rc_prim . ", meczy = meczy + 1 WHERE nazwisko = '". $c . "'");
			if ($d !== 'null') {
				mysqli_query($con, "UPDATE gracze SET punkty = " . $rd_prim . ", meczy = meczy + 1 WHERE nazwisko = '". $d . "'");
			}
			
			$cd = ($_REQUEST['ab'] == 10) ? $_REQUEST['cd'] : $_REQUEST['ab'];
			$delta = abs($ratingChange);
			$a = "'$a'";
			if ($b !== 'null') $b = "'$b'";
			$c = "'$c'";
			if ($d !== 'null') $d = "'$d'";
			mysqli_query($con, "INSERT INTO mecze (a, b, c, d, cd, delta) VALUES ($a, $b, $c, $d, $cd, $delta)");
			
			$ranking = getRanking($con);
			$saved = true;
		}
	}
}
require 'header.php';
?>

<div class="container">

<?php if (isset($saved)) echo '<div class="alert alert-success">Added :)</div>' ?>
<?php if (isset($badTeams)) echo '<div class="alert alert-warning">Not added, invalid teams.</div>' ?>

<div class="jumbotron">
<form method="post" >
	<h3>Teams</h3>
	<div class="row form-group">
		<div class="col-xs-6 <?php if (isset($ratingChange) && ($_REQUEST['ab'] == 10)) echo "has-success"; ?> has-feedback">
			<?php if (isset($ratingChange)) { ?>
				<label class="control-label" for="a">
				<?php echo ($_REQUEST['ab'] == 10) ? sprintf("%+d", $ratingChange) : sprintf("%d", -$ratingChange) ?>
				</label>
			<?php } ?>
			<select class="form-control" name="a" id="a">
				<option value="null"></option>
				<?php
					foreach ($surnames as $surname) {
						$selected = ($surname === $_REQUEST['a']) ? "selected" : "";
						echo '<option ' . $selected . ' value="' . $surname . '">'. $surname . '</option>';
					}
				?>
			</select>
			<select class="form-control" name="b" id="b">
				<option value="null"></option>
				<?php
					foreach ($surnames as $surname) {
						$selected = ($surname === $_REQUEST['b']) ? "selected" : "";
						echo '<option ' . $selected . ' value="' . $surname. '">'. $surname . '</option>';
					}
				?>
			</select>
		</div>
		<div class="col-xs-6 <?php if (isset($ratingChange) && ($_REQUEST['cd'] == 10)) echo "has-success"; ?> has-feedback">
			<?php if (isset($ratingChange)) { ?>
				<label class="control-label" for="a">
				<?php echo ($_REQUEST['cd'] == 10) ? sprintf("%+d", $ratingChange) : sprintf("%d", -$ratingChange) ?>
				</label>
			<?php } ?>
			<select class="form-control" name="c" id="c">
				<option value="null"></option>
				<?php
					foreach ($surnames as $surname) {
						$selected = ($surname === $_REQUEST['c']) ? "selected" : "";
						echo '<option ' . $selected . ' value="' . $surname . '">'. $surname . '</option>';
					}
				?>
			</select>
			<select class="form-control" name="d" id="d">
				<option value="null"></option>
				<?php
					foreach ($surnames as $surname) {
						$selected = ($surname === $_REQUEST['d']) ? "selected" : "";
						echo '<option ' . $selected . ' value="' . $surname . '">'. $surname . '</option>';
					}
				?>
			</select>
		</div>
	</div>
	<h3>Score</h3>
	<h6><span id="expected">&nbsp;</span></h6>
	<div class="row form-group <?php if ($noOneTen) echo 'has-error'; ?>">
		<div class="col-xs-6">
			<?php if ($noOneTen) echo '<label class="control-label" for="ab">One of the team should have 10 goals</label>'; ?>
			<select class="form-control" name="ab" id="ab">
			<?php
				if (!isset($_REQUEST['ab'])) $_REQUEST['ab'] = 10;
				for ($i = 0; $i <= 10; $i++) {
					$selected = ($i == $_REQUEST['ab']) ? 'selected' : '';
					echo '<option ' . $selected . ' value="' . $i . '">' . $i . '</option>';
				}
			?>
			</select>
		</div>
		<div class="col-xs-6">
			<?php if ($noOneTen) echo '<label class="control-label" for="cd">One of the team should have 10 goals</label>'; ?>
			<select class="form-control" name="cd" id="cd">
			<?php
				if (!isset($_REQUEST['cd'])) $_REQUEST['cd'] = 8;
				for ($i = 0; $i <= 10; $i++) {
					$selected = ($i == $_REQUEST['cd']) ? 'selected' : '';
					echo '<option ' . $selected . ' value="' . $i . '">' . $i . '</option>';
				}
			?>
			</select>
		</div>
	</div>
	
	<button type="submit" class="btn btn-success">Add</button>
</form>
</div>

</div>

<script>
$("#nav2").addClass('active');

setExpectedResult();

$("#a").change(function() { setExpectedResult(); });
$("#b").change(function() { setExpectedResult(); });
$("#c").change(function() { setExpectedResult(); });
$("#d").change(function() { setExpectedResult(); });

$("#ab").change(function() { if ($(this).val() != 10) $("#cd").val(10); });
$("#cd").change(function() { if ($(this).val() != 10) $("#ab").val(10); });

function setExpectedResult() {
	if ($("#a").val() != "null" && $("#c").val() != "null") {
		$.ajax({
			url: "expectedResult.php",
			data: {
				a: $("#a").val(),
				b: $("#b").val(),
				c: $("#c").val(),
				d: $("#d").val()
			},
			success: function(data) {
				$("#expected").html('(expected ' + data + ')');
			}
		});
	}
}
</script>
