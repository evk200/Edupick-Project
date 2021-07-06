$(document).ready(function(){	
		$("#modipwd").blur(function(){
					var text = $("#modipwd").val();
					var num = text.search(/[0-9]/g);
					 var eng = text.search(/[a-z]/ig);
					 var spe = text.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
					
					 if(text != ""){
					    if (text.length < 6 || text.length > 16 ) {
							window.alert('비밀번호는 6글자 이상, 16글자 이하로만 입력해야 합니다.');
							$("#modipwd").val("");
							$("#modipwdcheck").val("");
							$("#same").text("");
					   
					    }else if(text.search(/\s/) != -1){
					    	window.alert('비밀번호는 공백없이 입력해주세요.');
					    	$("#modipwd").val("");
							$("#modipwdcheck").val("");
							$("#same").text("");
					  
					    }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
					    	  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
					    	  $("#modipwd").val("");
								$("#modipwdcheck").val("");
								$("#same").text("");
					    }else{
					    	console.log("완료");
					    }
					 }
				
				});
				
				$("#modipwdcheck").blur(function(){
					var text = $("#modipwdcheck").val();
					var text2 = $("#modipwd").val();
					if(text != "" && text2 != ""){
					    if (text == text2) {
							$("#same").text("비밀번호가 일치합니다.").css("color","blue");
					    }else{
					    	
					    	$("#same").text("비밀번호가 일치하지 않습니다.").css("color","red");
					    }
					}
			      
					
				});
			});
