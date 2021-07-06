function imsp() {
	if (document.frm.sname.value == "") {
        alert("이름을 입력해 주세요.");
        document.frm.sname.focus();
        return;
    }
	
	if (document.frm.sphone.value == "") {
        alert("연락처를 입력해 주세요.");
        document.frm.sphone.focus();
        return;
    }
	
	if (document.frm.saddr.value == "") {
        alert("탑승지역을 입력해 주세요.");
        document.frm.saddr.focus();
        return;
    }else {
		location.href="/edupick/Common/main.do";
		
	}
}

