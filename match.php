<?php
require 'math.php';
require 'db.php';
require 'connect.php';

$ranking = getRanking($con);
$surnames = getSortedSurnames($ranking);

if (isset($_REQUEST['a']) && 
	isset($_REQUEST['b']) && 
	isset($_REQUEST['c']) && 
	isset($_REQUEST['d']) && 
	isset($_REQUEST['ab']) && 
	isset($_REQUEST['cd']) &&
	isset($_REQUEST['pass'])) {
		
	if ((($_REQUEST['ab'] == 10) ^ ($_REQUEST['cd'] == 10)) != 1) {
		$noTen = true;
	} else {
		
		if ($_REQUEST['a'] == "null" || $_REQUEST['c'] == "null" 
		 || $_REQUEST['a'] == $_REQUEST['c'] || $_REQUEST['a'] == $_REQUEST['d']
		 || $_REQUEST['b'] == $_REQUEST['c'] || ($_REQUEST['b'] != 'null' && $_REQUEST['b'] == $_REQUEST['d'])) {
			$badTeams = true;
		} else {
			$actualScore = actualScore($_REQUEST['ab'], $_REQUEST['cd']);
			
			if ($_REQUEST['b'] == $_REQUEST['a']) $_REQUEST['b'] = 'null';
			if ($_REQUEST['d'] == $_REQUEST['c']) $_REQUEST['d'] = 'null';
			
			$ra = getPoints($ranking, $_REQUEST['a']);
			$rb = ($_REQUEST['b'] !== 'null') ? getPoints($ranking, $_REQUEST['b']) : $ra;
			$rc = getPoints($ranking, $_REQUEST['c']);
			$rd = ($_REQUEST['d'] !== 'null') ? getPoints($ranking, $_REQUEST['d']) : $rc;
			
			$expectedScore = expectedScore($ra, $rb, $rc, $rd);
			
			$ratingChange = ratingChange($actualScore, $expectedScore);
			
			$ra_prim = $ra + $ratingChange;
			if ($_REQUEST['b'] === 'null' && $_REQUEST['d'] !== 'null') {
				$ra_prim += $ratingChange;
			} else {
				$rb_prim = $rb + $ratingChange;
			}
			$rc_prim = $rc - $ratingChange;
			if ($_REQUEST['d'] === 'null' && $_REQUEST['b'] !== 'null') {
				$rc_prim += $ratingChange;
			} else {
				$rd_prim = $rd - $ratingChange;
			}
			
			if (checkPassword($_REQUEST['pass'])) {
				
				mysqli_query($con, "UPDATE gracze SET punkty = " . $ra_prim . " WHERE nazwisko = '". $_REQUEST['a'] . "'");
				if ($_REQUEST['b'] !== 'null') {
					mysqli_query($con, "UPDATE gracze SET punkty = " . $rb_prim . " WHERE nazwisko = '". $_REQUEST['b'] . "'");
				}
				mysqli_query($con, "UPDATE gracze SET punkty = " . $rc_prim . " WHERE nazwisko = '". $_REQUEST['c'] . "'");
				if ($_REQUEST['d'] !== 'null') {
					mysqli_query($con, "UPDATE gracze SET punkty = " . $rd_prim . " WHERE nazwisko = '". $_REQUEST['d'] . "'");
				}
				
				$a = ($_REQUEST['ab'] == 10) ? $_REQUEST['a'] : $_REQUEST['c'];
				$b = ($_REQUEST['ab'] == 10) ? $_REQUEST['b'] : $_REQUEST['d'];
				if ($b != 'null' && $b < $a) { $temp = $a; $a = $b; $b = $temp; }
				$b = ($b == 'null') ? 'NULL' : "'$b'";
				
				$c = ($_REQUEST['ab'] == 10) ? $_REQUEST['c'] : $_REQUEST['a'];
				$d = ($_REQUEST['ab'] == 10) ? $_REQUEST['d'] : $_REQUEST['b'];
				if ($d != 'null' && $d < $c) { $temp = $c; $c = $d; $d = $temp; }
				$d = ($d == 'null') ? 'NULL' : "'$d'";
				
				$cd = ($_REQUEST['ab'] == 10) ? $_REQUEST['cd'] : $_REQUEST['ab'];
				$delta = abs($ratingChange);
				mysqli_query($con, "INSERT INTO mecze (a, b, c, d, cd, delta) VALUES ('$a', $b, '$c', $d, $cd, $delta)");
				
				$ranking = getRanking($con);
				
				$goodPassword = true;
			} else {
				$wrongPassword = true;
			}
		}
	}
}
require 'header.php';
?>

<div class="container">

<?php if (isset($goodPassword)) echo '<div class="alert alert-success">Zapisano :)</div>' ?>
<?php if (isset($wrongPassword)) echo '<div class="alert alert-warning">Nie zapisano. Złe hasło.</div>' ?>
<?php if (isset($badTeams)) echo '<div class="alert alert-warning">Nie zapisano. Błędne drużyny.</div>' ?>

<div class="jumbotron">
<form method="post" >
	<h3>Drużyny</h3>
	<div class="row form-group">
		<div class="col-xs-6 <?php if (isset($ratingChange) && ($ratingChange > 0)) echo "has-success"; ?> has-feedback">
			<?php if (isset($ratingChange)) { ?>
				<label class="control-label" for="a">
				<?php echo sprintf("%+d", $ratingChange) ?>
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
		<div class="col-xs-6 <?php if (isset($ratingChange) && (-$ratingChange > 0)) echo "has-success"; ?> has-feedback">
			<?php if (isset($ratingChange)) { ?>
				<label class="control-label" for="a">
				<?php echo sprintf("%+d", -$ratingChange) ?>
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
	<h3>Wynik</h3>
	<h6><span id="expected">&nbsp;</span></h6>
	<div class="row form-group <?php if ($noTen) echo 'has-error'; ?>">
		<div class="col-xs-6">
			<?php if ($noTen) echo '<label class="control-label" for="ab">Gramy do 10 bramek</label>'; ?>
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
			<?php if ($noTen) echo '<label class="control-label" for="cd">Gramy do 10 bramek</label>'; ?>
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
	
	<h3>Hasło</h3>
	<div class="form-group">
		<input type="password" class="form-control" name="pass">
	</div>
	
	<button type="submit" class="btn btn-success">Zapisz wynik</button>
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
				$("#expected").html('(oczekiwany ' + data + ')');
			}
		});
	}
}
</script>
