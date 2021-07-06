
$(document).ready(function(){
	$("#tab2").click(function(){
		$("fieldset[name=dropuser]").css("display","block");
		$("fieldset[name=joinfed]").css("display","none");
		$("article").css("max-height","300px");
	});
	$("#tab1").click(function(){
		$("fieldset[name=dropuser]").css("display","none");
		$("fieldset[name=joinfed]").css("display","block");
		$("article").css("max-height","1500px");
	});
});