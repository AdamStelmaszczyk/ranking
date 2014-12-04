setExpectedResult();

$("#a").change(function() {	setExpectedResult(); });
$("#b").change(function() {	setExpectedResult(); });
$("#c").change(function() {	setExpectedResult(); });
$("#d").change(function() {	setExpectedResult(); });

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
