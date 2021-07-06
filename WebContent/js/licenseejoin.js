function inputCheck() // 회원가입버튼을 누르면 호출되는 함수 입력하지 않은값이 있으면 경고창이 뜨고 정상적으로 입력하면
                        // 회원가입이 이루어진다.
{
    if (document.regFrm.lId.value == "") {
        alert("아이디를 입력해 주세요.");
        document.regFrm.lId.focus();
        return;
    }
 
    if (document.regFrm.lPwd.value == "") {
        alert("비밀번호를 입력해 주세요.");
        document.regFrm.lPwd.focus();
        return;
    }
 
    if (document.regFrm.lPwd2.value == "") {
        alert("비밀번호를 확인해 주세요.");
        document.regFrm.lPwd2.focus();
        return;
    }
 
    if (document.regFrm.lPwd.value != document.regFrm.lPwd2.value) // 입력한 비밀번호와
                                                                    // 확인 비밀번호가
                                                                    // 맞지 않으면 경고
                                                                    // 메시지 출력
    {
        alert("비밀번호가 일치하지 않습니다.");
        document.regFrm.lPwd2.value == "";
        document.regFrm.lPwd2.focus();
        return;
    }
 
    if (document.regFrm.lName.value == "") {
        alert("이름을 입력해 주세요");
        document.regFrm.lName.focus();s
        return;
    }
 
    if (document.regFrm.lJumin0.value == "") {
        alert("주민등록번호 앞자리를 입력해주세요.");
        document.regFrm.lJumin0.focus();
        return;
    }
	
	if (document.regFrm.lJumin1.value == "") {
        alert("주민등록번호 뒷자리를 입력해주세요.");
        document.regFrm.lJumin1.focus();
        return;
    }
 
	if (document.regFrm.sample4_postcode.value == "") {
        alert("우편번호를 검색해 주세요.");
        return;
    }
	
	if (document.regFrm.lTel1.value == "") {
        alert("핸드폰 번호를 입력해 주세요.");
		document.regFrm.lTel1.focus();
        return;
    }
	
	if (document.regFrm.lTel2.value == "") {
        alert("핸드폰 번호를 입력해 주세요.");
		document.regFrm.lTel2.focus();
        return;
    }
	
	if (document.regFrm.lComName.value == "") {
        alert("업체명을 입력해 주세요.");
		document.regFrm.lComName.focus();
        return;
    }
	
	if (document.regFrm.lNumber1.value == "") {
        alert("사업자 번호를 입력해 주세요.");
		document.regFrm.lNumber1.focus();
        return;
    }
	
	if (document.regFrm.lNumber2.value == "") {
        alert("사업자 번호를 입력해 주세요.");
		document.regFrm.lNumber2.focus();
        return;
    }
	
	if (document.regFrm.lNumber3.value == "") {
        alert("사업자 번호를 입력해 주세요.");
		document.regFrm.lNumber3.focus();
        return;
    }
 
	document.regFrm.action="licenseeInputAction.do";
	document.regFrm.method="get";
	document.regFrm.enctype="multipart/form-data";
    document.regFrm.submit();
}
function checkid() {
	if(regFrm.lId.value == "") {

		alert("아이디를 입력하세요.");

		regFrm.lId.focus();

	} else {

		url = "/edupick/Common/checkid.do?id=" + regFrm.lId.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(

		url, 

		"id check", "toolbar=no, width=350, height=150, top=150, left=150");

	}

}
function win_close() {
    self.close();
}