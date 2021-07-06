$(document).ready(function(){
	$("#content3_btn").click(function(){
		$("#rep_form").css("display","block");
	});
	
	$("#put2").click(function(){
		$("#rep_form").css("display","none");
	});
	
	$("#tbodyjoy > tr > .left").click(function(){
		$(location).attr('href','progresslecture.do');
	});
	
	$(".credit010").click(function(){
		$(location).attr('href','/edupick/Myservice/enrolment.do');
	});
	
/*	$("#img55").click(function(){
		window.open("/edupick/Myservice/seecart.do","window","width=400 , height=400 left=800 top=300");
	});*/
});