function deleteAction()
{

	
	if (document.regFrm2.dpwd.value == ""){
		
		alert("비밀번호를 입력해주세요.");
		document.regFrm2.dpwd.focus();
		return;		
	}
	
	document.regFrm2.action = "/edupick/Common/deleteAction.do";
	document.regFrm2.method ="post";
	document.regFrm2.submit();
	return;

}