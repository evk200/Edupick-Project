$(document).ready(function(){
	$(".admin").click(function(){
		$(location).attr('href','/edupick/Admin/adminManage.do');
	});
	
	$(".logodiv").click(function(){
		$(location).attr('href','/edupick/Admin/admin.do');
	});
	$("#subnav1").click(function(){
		$(location).attr('href','/edupick/Admin/adminMemberManage.do');
	});
	$("#subnav2").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#subnav3").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOrderManage.do');
	});
	$("#subnav4").click(function(){
		alert("미사용 게시판입니다.");
	});
	$("#subnav5").click(function(){
		$(location).attr('href','/edupick/Admin2/adminPageManage.do');
	});
	$("#subnav6").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOther.do');
	});
	$("#subnav2_1").click(function(){
		$(location).attr('href','/edupick/Admin/adminMemberManage.do');
	});
	$("#subnav2_2").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#subnav2_3").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOrderManage.do');
	});
	$("#subnav2_4").click(function(){
		alert("미사용 게시판입니다.");
	});
	$("#subnav2_5").click(function(){
		$(location).attr('href','/edupick/Admin2/adminPageManage.do');
	});
	$("#subnav2_6").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOther.do');
	});
	$("#btbt").click(function(){
		$(location).attr('href','/edupick/Admin/adminMemberDetail.do');
	});
	$("#btbtn").click(function(){
		$(location).attr('href','/edupick/Admin/adminAnswer.do');
	});
	
	$("#sec").click(function(){
		$(location).attr('href','/edupick/Admin/adminMemberManage.do');
	});
	$("#fro").click(function(){
		$(location).attr('href','/edupick/Admin/adminMemberManage.do');
	});
	$("#fro1").click(function(){
		$(location).attr('href','/edupick/Admin/adminMemberManage.do');
	});	
	$("#cllist").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#clplus_1").click(function(){
		$(location).attr('href','/edupick/Admin2/adminInstituteAdd.do');
	});
	$("#clplus_2").click(function(){
		$(location).attr('href','/edupick/Admin2/adminBoardAdd.do');
	});

//	$("#clmodi").click(function(){
//		$(location).attr('href','/edupick/Admin2/adminInstituteModify.do');
//	});
//	var cidx = $("#cidx").val();
//	$("#btbt99").click(function(){
//		$(location).attr('href','/edupick/Admin2/adminCouresDetail.do?cidx='+cidx);
//	});
//	$("#modibtt").click(function(){
//		$(location).attr('href','/edupick/Admin2/adminCouresModify.do');
//	});
	$("#listbt").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#savebt").click(function(){
		$(location).attr('href','/edupick/Admin2/adminCouresDetail.do');
	});
	$("#btbt88").click(function(){
		$(location).attr('href','/edupick/Admin2/adminStudentDetail.do');
	});
	$("#listbtn1").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#modibtn1").click(function(){
		$(location).attr('href','/edupick/Admin2/adminStudentModify.do');
	});
	$("#modibtn2").click(function(){
		$(location).attr('href','/edupick/Admin2/adminStudentDetail.do');
	});
	$("#btbt77").click(function(){
		$(location).attr('href','/edupick/Admin2/adminReviewDetail.do');
	});
	$("#starbtn").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#btbt66").click(function(){
		$(location).attr('href','/edupick/Admin2/adminCommunityDetail.do');
	});
	$("#listbtn3").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	$("#btbt55").click(function(){
		$(location).attr('href','/edupick/Admin2/adminAdviceDetail.do');
	});
	$("#cmlist").click(function(){
		$(location).attr('href','/edupick/Admin2/adminProductManage.do');
	});
	
//	$("#btbt44").click(function(){
//		$(location).attr('href','/edupick/Admin2/adminPayDetail.do');
//	});
	$("#cdlist").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOrderManage.do');
	});
	$("#btbt33").click(function(){
		$(location).attr('href','/edupick/Admin2/adminVisitDetail.do');
	});
	$("#visitlist").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOrderManage.do');
	});
	$("#postbtn").click(function(){
		$(location).attr('href','/edupick/Admin2/adminBoardManage.do');
	});
	$("#postlist").click(function(){
		$(location).attr('href','/edupick/Admin2/adminBoardManage.do');
	});
	$("#btbtmf").click(function(){
		$(location).attr('href','/edupick/Admin2/adminBoardModify.do');
	});
	$("#btbt22").click(function(){
		$(location).attr('href','/edupick/Admin2/adminBoardDetail.do');
	});
	$("#btbt11").click(function(){
		$(location).attr('href','/edupick/Admin2/adminReviewDetail.do');
	});
	$("#commentlist").click(function(){
		$(location).attr('href','/edupick/Admin2/adminBoardManage.do');
	});
	$("#btbt00").click(function(){
		alert("현재 미결제 상태입니다.");
	});
	$("#clplus_4").click(function(){
		$(location).attr('href','/edupick/Admin/adminQuizAdd.do');
	});
	
	$("button[name=noticeplus]").click(function(){
		$(location).attr('href','/edupick/Admin2/adminPageNotice.do');
	});
	$("button[name=eduinformationplus]").click(function(){
		$(location).attr('href','/edupick/Admin2/adminPageEduInformation.do');
	});
	$("button[name=customerserviceplus]").click(function(){
		$(location).attr('href','/edupick/Admin2/adminPageCustomerService.do');
	});
	$("button[id=noticelist]").click(function(){
		$(location).attr('href','/edupick/Admin2/adminPageManage.do');
	});
	$("button[id=quizlist]").click(function(){
		$(location).attr('href','/edupick/Admin2/adminOther.do');
	});

	// -------------------------------------
	$("#modibt0_2").click(function(){
		if($(".myservice").css("display","none")) {		
			$(".myservice").css("display","block");
			$(".myservice2").css("display","none");
		}
	});
	$("#modibt0_1").click(function(){
		if($("myservice2").css("display","none")){
			$(".myservice2").css("display","block");
			$(".myservice").css("display","none");
		}
	});	
	$("#close").click(function(){
		$(".myservice").css("display","none");			
	});
	$("#close2").click(function(){
		$(".myservice2").css("display","none");			
	});
	
	$(".navuser").click(function(){
		$(".navuser_1").toggle();
	});
	
	$("#ul2").click(function(){
		$(".ftacontent").css("display","block");
	});
	
	$(".closeimg>img").click(function(){
		$(".ftacontent").css("display","none");
	});

	$("#ftaplusbtn").click(function(){
		$(".ftacontent2").toggle();
		$(".cathead").toggle();
	});
	
	$(".closeimg2>img").click(function(){
		$(".ftacontent2").css("display","none");
		$(".cathead").css("display","none");
	});
	
	$(".catgo>button").click(function(){
		alert("미구현입니다");
	});
	
	$("#quizs").click(function(){
		$(".quiz").css("display","block");
	});
	
	$(".quiz_close").click(function(){
		$(".quiz").css("display","none");
	});
	
	$("#customerserviceanswer").click(function(){
		$(".answertable").toggle();
		if($('.answertable').css("display","block")) {
			$('#customerservicemodify,#customerservicedel,#noticelist,#customerserviceanswer').css("position","relative");
			$('#customerservicemodify,#customerservicedel,#noticelist,#customerserviceanswer').css("bottom","130px");
		}
	});
	
//	-------------------------------------------------------------------------
	//포인트 퀴즈
	
	$("#joke1").click(function(){
		alert("틀렸습니다. 다시 풀어주세요");
	});
	$("#joke2").click(function(){
		alert("틀렸습니다. 다시 풀어주세요");
	});
	$("#joke3").click(function(){
		alert("그게 바로너야~~");
		$("#joke3").text("돼지는 당신입니다. 그만 먹어주세요.");
		$("#joke3").css("background","red");
		$("#joke3").css("font-size","25px");
		$("#joke3").css("font-weight","700");
	});
	$("#joke4").click(function(){
		alert("틀렸습니다. 다시 풀어주세요");
	});
	
	//--------------------------------------------------------------------------------
	
	$("#navuser_1_1").click(function(){
		$(".mainfrm").css("display","block");
		$(".mainfrm2").css("display","none");
		$(".mainfrm3").css("display","none");
		$(".mainfrm4").css("display","none");
		$(".mainfrm5").css("display","none");
		$(".mainfrm6").css("display","none");
		$(".usermainpage6").css("display","none");
		$(".usermainpage5").css("display","none");
		$(".usermainpage4").css("display","none");
		$(".usermainpage3").css("display","none");
		$(".usermainpage2").css("display","none");
		$(".usermainpage").css("display","block");
		$(".userup6").css("display","none");
		$(".userup5").css("display","none");
		$(".userup4").css("display","none");
		$(".userup3").css("display","none");
		$(".userup2").css("display","none");
		$(".userup").css("display","block");
		$(".ftaplus").css("display","none");
		$("#navuser_1_1").css("background","#FA5858");
		$("#navuser_1_2").css("background","white");
		$("#navuser_1_3").css("background","white");
		$("#navuser_1_4").css("background","white");
		$("#navuser_1_5").css("background","white");
		$("#navuser_1_6").css("background","white");
	});
	
	$("#navuser_1_2").click(function(){
		$(".mainfrm6").css("display","none");
		$(".mainfrm5").css("display","none");
		$(".mainfrm4").css("display","none");
		$(".mainfrm3").css("display","none");
		$(".mainfrm2").css("display","block");
		$(".mainfrm").css("display","none");
		$(".usermainpage").css("display","none");
		$(".usermainpage2").css("display","block");
		$(".usermainpage3").css("display","none");
		$(".usermainpage4").css("display","none");
		$(".usermainpage5").css("display","none");
		$(".usermainpage6").css("display","none");
		$(".userup").css("display","none");
		$(".userup2").css("display","block");
		$(".userup3").css("display","none");
		$(".userup4").css("display","none");
		$(".userup5").css("display","none");
		$(".userup6").css("display","none");
		$(".ftaplus").css("display","none");
		$("#navuser_1_2").css("background","#FA5858");
		$("#navuser_1_1").css("background","white");
		$("#navuser_1_3").css("background","white");
		$("#navuser_1_4").css("background","white");
		$("#navuser_1_5").css("background","white");
		$("#navuser_1_6").css("background","white");
	});
	
	$("#navuser_1_3").click(function(){
		$(".mainfrm").css("display","none");
		$(".mainfrm2").css("display","none");
		$(".mainfrm3").css("display","block");
		$(".mainfrm4").css("display","none");
		$(".mainfrm5").css("display","none");
		$(".mainfrm6").css("display","none");
		$(".usermainpage").css("display","none");
		$(".usermainpage2").css("display","none");
		$(".usermainpage3").css("display","block");
		$(".usermainpage4").css("display","none");
		$(".usermainpage5").css("display","none");
		$(".usermainpage6").css("display","none");
		$(".userup").css("display","none");
		$(".userup2").css("display","none");
		$(".userup3").css("display","block");
		$(".userup4").css("display","none");
		$(".userup5").css("display","none");
		$(".userup6").css("display","none");
		$(".ftaplus").css("display","none");
		$("#navuser_1_1").css("background","white");
		$("#navuser_1_2").css("background","white");
		$("#navuser_1_3").css("background","#FA5858");
		$("#navuser_1_4").css("background","white");
		$("#navuser_1_5").css("background","white");
		$("#navuser_1_6").css("background","white");
	});
	
	$("#navuser_1_4").click(function(){
		$(".mainfrm").css("display","none");
		$(".mainfrm2").css("display","none");
		$(".mainfrm3").css("display","none");
		$(".mainfrm4").css("display","block");
		$(".mainfrm5").css("display","none");
		$(".mainfrm6").css("display","none");
		$(".usermainpage").css("display","none");
		$(".usermainpage2").css("display","none");
		$(".usermainpage3").css("display","none");
		$(".usermainpage4").css("display","block");
		$(".usermainpage5").css("display","none");
		$(".usermainpage6").css("display","none");
		$(".userup").css("display","none");
		$(".userup2").css("display","none");
		$(".userup3").css("display","none");
		$(".userup4").css("display","block");
		$(".userup5").css("display","none");
		$(".userup6").css("display","none");
		$(".ftaplus").css("display","block");
		$("#navuser_1_1").css("background","white");
		$("#navuser_1_2").css("background","white");
		$("#navuser_1_3").css("background","white");
		$("#navuser_1_4").css("background","#FA5858");
		$("#navuser_1_5").css("background","white");
		$("#navuser_1_6").css("background","white");
	});
	
	$("#navuser_1_5").click(function(){
		$(".mainfrm").css("display","none");
		$(".mainfrm2").css("display","none");
		$(".mainfrm3").css("display","none");
		$(".mainfrm4").css("display","none");
		$(".mainfrm5").css("display","block");
		$(".mainfrm6").css("display","none");
		$(".usermainpage").css("display","none");
		$(".usermainpage2").css("display","none");
		$(".usermainpage3").css("display","none");
		$(".usermainpage4").css("display","none");
		$(".usermainpage5").css("display","block");
		$(".usermainpage6").css("display","none");
		$(".userup").css("display","none");
		$(".userup2").css("display","none");
		$(".userup3").css("display","none");
		$(".userup4").css("display","none");
		$(".userup5").css("display","block");
		$(".userup6").css("display","none");
		$(".ftaplus").css("display","none");
		$("#navuser_1_1").css("background","white");
		$("#navuser_1_2").css("background","white");
		$("#navuser_1_3").css("background","white");
		$("#navuser_1_4").css("background","white");
		$("#navuser_1_5").css("background","#FA5858");
		$("#navuser_1_6").css("background","white");
	});
	
	$("#navuser_1_6").click(function(){
		$(".mainfrm").css("display","none");
		$(".mainfrm2").css("display","none");
		$(".mainfrm3").css("display","none");
		$(".mainfrm4").css("display","none");
		$(".mainfrm5").css("display","none");
		$(".mainfrm6").css("display","block");
		$(".usermainpage").css("display","none");
		$(".usermainpage2").css("display","none");
		$(".usermainpage3").css("display","none");
		$(".usermainpage4").css("display","none");
		$(".usermainpage5").css("display","none");
		$(".usermainpage6").css("display","block");
		$(".userup").css("display","none");
		$(".userup2").css("display","none");
		$(".userup3").css("display","none");
		$(".userup4").css("display","none");
		$(".userup5").css("display","none");
		$(".userup6").css("display","block");
		$(".ftaplus").css("display","none");
		$("#navuser_1_1").css("background","white");
		$("#navuser_1_2").css("background","white");
		$("#navuser_1_3").css("background","white");
		$("#navuser_1_4").css("background","white");
		$("#navuser_1_5").css("background","white");
		$("#navuser_1_6").css("background","#FA5858");
	});
	// -------------------------------------
	
	$("#usercheck").change(function(){
		if($("#usercheck").is(":checked")){
			$("#usercheck_all1").prop("checked",true);
			$("#usercheck_all2").prop("checked",true);
			$("#usercheck_all3").prop("checked",true);
			$("#usercheck_all4").prop("checked",true);
			$("#usercheck_all5").prop("checked",true);
			$("#usercheck_all6").prop("checked",true);
			$("#usercheck_all7").prop("checked",true);
			$("#usercheck_all8").prop("checked",true);
			$("#usercheck_all9").prop("checked",true);
			$("#usercheck_all10").prop("checked",true);
			$("#usercheck_all11").prop("checked",true);
			$("#usercheck_all12").prop("checked",true);
			$("#usercheck_all13").prop("checked",true);
			$("#usercheck_all14").prop("checked",true);
			$("#usercheck_all15").prop("checked",true);
		}else {
			$("#usercheck_all1").prop("checked",false);
			$("#usercheck_all2").prop("checked",false);
			$("#usercheck_all3").prop("checked",false);
			$("#usercheck_all4").prop("checked",false);
			$("#usercheck_all5").prop("checked",false);
			$("#usercheck_all6").prop("checked",false);
			$("#usercheck_all7").prop("checked",false);
			$("#usercheck_all8").prop("checked",false);
			$("#usercheck_all9").prop("checked",false);
			$("#usercheck_all10").prop("checked",false);
			$("#usercheck_all11").prop("checked",false);
			$("#usercheck_all12").prop("checked",false);
			$("#usercheck_all13").prop("checked",false);
			$("#usercheck_all14").prop("checked",false);
			$("#usercheck_all15").prop("checked",false);
		}
	});
	
	// -------------------------------------------------
	
	
	
});