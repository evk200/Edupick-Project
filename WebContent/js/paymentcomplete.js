/*$(document).ready(function(){
	var iidx = $("#iidx").val;
	var cidx = $("#cidx").val;
	$(".div2").click(function(){
		$(opener.location).attr("href","paymentAction.do?iidx="+iidx+"&cidx="+cidx);
		window.close();
	});
});*/

function page(){
var iidx = document.getElementById('iidx');
var cidx = document.getElementById('cidx');
opener.parent.location="paymentAction.do?iidx="+iidx+"&cidx="+cidx;
window.close();
}