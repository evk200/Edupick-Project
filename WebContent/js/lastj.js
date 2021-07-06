$(document).ready(function(){
	$(".noticelist_1").click(function(){
		$(location).attr('href','/edupick/Notice/notice.do');
	});
	$(".noticelist_2").click(function(){
		$(location).attr('href','/edupick/Eduinformation/eduinformation.do');
	});
});