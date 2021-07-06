function inputCheck() // 회원가입버튼을 누르면 호출되는 함수 입력하지 않은값이 있으면 경고창이 뜨고 정상적으로 입력하면
                        // 회원가입이 이루어진다.
{
    if (document.regFrm.mId.value == "") {
        alert("아이디를 입력해 주세요.");
        document.regFrm.id.focus();
        return;
    }
    
  
    if (document.regFrm.mPwd.value == "") {
        alert("비밀번호를 입력해 주세요.");
        document.regFrm.pwd.focus();
        return;
    }
 
    if (document.regFrm.mPwd2.value == "") {
        alert("비밀번호를 확인해 주세요.");
        document.regFrm.repwd.focus();
        return;
    }
 
    if (document.regFrm.mPwd.value != document.regFrm.mPwd2.value) // 입력한 비밀번호와
                                                                    // 확인 비밀번호가
                                                                    // 맞지 않으면 경고
                                                                    // 메시지 출력
    {
        alert("비밀번호가 일치하지 않습니다.");
        document.regFrm.mPwd2.value = "";
        document.regFrm.mPwd2.focus();
        return;
    }
 
    if (document.regFrm.mName.value == "") {
        alert("이름을 입력해 주세요");
        document.regFrm.mName.focus();
        return;
    }
 
    if (document.regFrm.mJumin0.value == "") {
        alert("주민등록번호 앞자리를 입력해주세요.");
        document.regFrm.mJumin0.focus();
        return;
    }
	
	if (document.regFrm.mJumin1.value == "") {
        alert("주민등록번호 뒷자리를 입력해주세요.");
        document.regFrm.mJumin1.focus();
        return;
    }
 
    if (document.regFrm.sample4_postcode.value == "") {
        alert("우편번호를 검색해 주세요.");
        return;
    }
	
	
	if (document.regFrm.mTel1.value == "") {
        alert("핸드폰 번호를 입력해 주세요.");
		document.regFrm.mTel1.focus();
        return;
    }
	
	if (document.regFrm.mTel2.value == "") {
        alert("핸드폰 번호를 입력해 주세요.");
		document.regFrm.mTel2.focus();
        return;
    }


 
	document.regFrm.action="memberInputAction.do";
	document.regFrm.method="get";
	document.regFrm.enctype="multipart/form-data";
    document.regFrm.submit();
}

//regform id 중복확인

function checkid() {
	if(regFrm.mId.value == "") {

		alert("아이디를 입력하세요.");

		regFrm.mId.focus();

	} else {

		url = "/edupick/Common/checkid.do?id=" + regFrm.mId.value;
		// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
		window.open(

		url, 

		"id check", "toolbar=no, width=350, height=150, top=150, left=150");

	}

}
 
function win_close() {
    self.close();
}