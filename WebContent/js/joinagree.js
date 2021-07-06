$(document).ready(function(){
	$("#agbtn01").click(function(){
		if($(".check1").is(":checked") == false ){
			alert("에듀픽 이용약관 동의를 체크해주세요.");
		}else if($(".check2").is(":checked") == false){
			alert("개인정보 수집 및 이용 동의를 체크해주세요");
		}else {
			location.href="memberInput.do";
		}
	});
//	사업자
	$("#agbtn02").click(function(){
		if($(".check1").is(":checked") == false ){
			alert("에듀픽 이용약관 동의를 체크해주세요.");
		}else if($(".check2").is(":checked") == false){
			alert("개인정보 수집 및 이용 동의를 체크해주세요");
		}else {
			location.href="licenseeInput.do";
		}
	});
	
	$("#checko").change(function(){
		if($("#checko").is(":checked")){
			$(".check1").prop("checked",true);
			$(".check2").prop("checked",true);
			$(".check3").prop("checked",true);
			$(".check4").prop("checked",true);
		}else {
			$(".check1").prop("checked",false);
			$(".check2").prop("checked",false);
			$(".check3").prop("checked",false);
			$(".check4").prop("checked",false);
		}
	});
});