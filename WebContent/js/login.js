$(document).ready(function() {
	$("#onejo").click(function() {
		$("#onejoin2").hide();
		$("#onejoin").show();
	});
	$("#onejo2").click(function() {
		$("#onejoin").hide();
		$("#onejoin2").show();
		$("#onejoin2").css({ "opacity":"1"});
	});
});