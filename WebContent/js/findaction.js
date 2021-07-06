function findAction(){ 
	
	if(document.findFrm.idname.value==""){
		alert("이름을 입력해주세요.");
		document.findFrm.idname.focus();
		return;
	}
	else if(document.findFrm.idtel.value==""){
		alert("휴대폰 번호를 입력해주세요.");
		document.findFrm.idtel.focus();
		return;
	}
	else {
		document.findFrm.method="post";
		document.findFrm.action ="/edupick/Common/findIdAction.do";
		document.findFrm.submit();
		return;
	
	}
	
} 

function findAction2() {

	if(document.findFrm.pwdid.value==""){
			alert("아이디를 입력해주세요.");
			document.findFrm.pwdid.focus();
			return;
		}
		else if(document.findFrm.pwdname.value==""){
			alert("이름을 입력해주세요.");
			document.findFrm.pwdname.focus();
			return;
		}
		else if(document.findFrm.pwdjumin1.value==""){
			alert("주민번호 앞자리를 입력해주세요.");
			document.findFrm.pwdjumin1.focus();
			return;
		}
		else if(document.findFrm.pwdjumin2.value==""){
			alert("주민번호 뒷자리를 입력해주세요.");
			document.findFrm.pwdjumin2.focus();
			return;
		}
		else {
			document.findFrm.method="post";
			document.findFrm.action ="/edupick/Common/findPwdAction.do";
			document.findFrm.submit();
			return;
		
		}

}

	