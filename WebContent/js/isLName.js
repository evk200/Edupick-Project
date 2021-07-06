//이름 정규식
$(document).ready(function(){
	
	$("input[name=lName]").blur(function(){
	
		var text = $("#name").val();
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var name = text.search(/\s/);
		var test = check.test(text);		
		
		if(text != null){
			if(name != -1 || test == false){
					$("#isname").text("공백없이 한글만 입력해주세요.").css("color","red");
					$("#name").val("");
			}else{
					$("#isname").text("ok").css("color","blue");
			}
		}
		});
	});
			
		
		
