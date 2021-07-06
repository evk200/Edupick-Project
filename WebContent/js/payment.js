$(document).ready(function(){
	$("#check").change(function(){
		if($("#check").is(":checked")){
			$("#checkagree").prop("checked",true);
			$("#checkagree2").prop("checked",true);
		}else {
			$("#checkagree").prop("checked",false);
			$("#checkagree2").prop("checked",false);
		}
	});
	
	$(".Wlsmain>div:not(.creditnum)").click(function(){
		$(".creditnum").css("display","block");
		$(".creditarticle").css("height","840");
	});
	
	$("#creditclose").click(function(){
		$(".creditnum").css("display","none");
	});
		
	
	
	$(".payment").click(function(){
		var iidx = $("#iidx").val();
		var cidx = $("#cidx").val();
		if($("#checkagree").is(":checked") == false){
			alert("개인정보 수집 및 이용안내를 동의해주세요.");
		}else if($("#checkagree2").is(":checked") == false){
			alert("개인정보 수집 및 위탁 안내를 동의해주세요.");
		}
		if($("input[name=cardnum]").val() == ""){ //
			alert("카드번호를 입력하세요.");
		}else if($("input[name=cardpwd]").val() == ""){
			alert("카드비번을 입력하세요.");
		}else if($("input[name=cardcvc]").val() == ""){
			alert("카드cvc를 입력하세요.");
		}else{
			$("#frm>input[name=cardNum]").val("카드번호");
			$("#frm>input[name=cardPass]").val("카드비번");
			$("#frm>input[name=cardCvc]").val("카드cvc");
			$("#frm").submit();
			window.open("paymentcomplete.do?iidx="+iidx+"&cidx="+cidx,"window","width=400 , height=400 left=800 top=300");
			/*$(location).attr("href","paymentcomplete.do?iidx="+iidx+"&cidx="+cidx);*/
		}
	});
});