$(document).ready(function() {
	$("#idsh").click(function() {
		$(".idpwsh2").hide();
		$(".idpwsh").show();
		$("#idsh").css("color","red");
		$("#pwsh").css("color","black");
	});
	$("#pwsh").click(function() {
		$(".idpwsh").hide();
		$(".idpwsh2").show();
		$(".idpwsh2").css({ "opacity":"1"});
		$("#pwsh").css("color","red");
		$("#idsh").css("color","black");
	});
//	$("#btnsh").click(function(){
//		window.open('아이디찾기완료.html','window','width=580,height=300,left=750,top=400,resizable=no,scrollbars=no');
//	});
//	$("#btnsh2").click(function(){
//		window.open('비밀번호찾기완료.html','window','width=580,height=300,left=750,top=400,resizable=no,scrollbars=no');
//	});
//	
	$("#btnsh_close").click(function(){
		$(location).attr('href','/edupick/Common/main.do');
	});
	$("#btnsh_close2").click(function(){
		$(location).attr('href','/edupick/Common/main.do');
	});
});