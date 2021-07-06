
$(document).ready(function(){
		
		$("input[name=lId]").blur(function(){
			
			var text = $("#lId").val();
			var idReg = /^[a-z]+[a-z0-9]{5,15}$/g;
			var idReg2 = /[0-9]/g;
			var id2 = text.search(/\s/);
			
			var test = idReg.test(text);
			var test2 = idReg2.test(text);
			if(test==true && test2 == true){
				$("#isid").text("옳은 아이디입니다.").css("color","blue");
			}else{
				if(id2 != -1 ){
					$("#isid").text("아이디는 공백없이 입력해주세요.").css("color","red");
					$("#lId").val("");
				}else{ 
					$("#isid").text("아이디는 영문과 숫자를 조합하여 6글자 이상, 15글자 이하로만 입력해야합니다.").css("color","red");
					$("#lId").val("");
				}
			}

		});
	});


