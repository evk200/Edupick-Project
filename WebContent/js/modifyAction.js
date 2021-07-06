function inputCheck02(){

   if (document.regFrm02.modipwd.value == "") {
        alert("비밀번호를 입력해 주세요.");
        document.regFrm02.modipwd.focus();
        return;
    }
 
    if (document.regFrm02.modipwdcheck.value == "") {
        alert("비밀번호를 확인해 주세요.");
        document.regFrm02.modipwdcheck.focus();
        return;
    }
 
    if (document.regFrm02.modipwdcheck.value != document.regFrm02.modipwdcheck.value) // 입력한 비밀번호와
                                                                    // 확인 비밀번호가
                                                                    // 맞지 않으면 경고
                                                                    // 메시지 출력
    {
        alert("비밀번호가 일치하지 않습니다.");
        document.regFrm02.modipwdcheck.value = "";
        document.regFrm02.modipwdcheck.focus();
        return;
    }
    
    if(document.regFrm02.sample4_postcode.value =="" || document.regFrm02.sample4_detailAddress.value ==""){
       alert("주소를 입력해주세요.");
       document.regFrm02.sample4_postcode.focus();
       
    }
    
    if(document.regFrm02.phone2.value =="" || document.regFrm02.phone3.value ==""){
       alert("핸드폰 번호를 입력해주세요.");
       document.regFrm02.sample4_postcode.focus();
       
    }
     
     document.regFrm02.method="post";   
     document.regFrm02.action = "/edupick/Licensee/licenseeModifyAction.do";
    document.regFrm02.submit();
    return;
}

function inputCheck01(){
   
   if (document.regFrm01.modipwd.value == "") {
        alert("비밀번호를 입력해 주세요.");
        document.regFrm01.modipwd.focus();
        return;
    }
 
    if (document.regFrm01.modipwdcheck.value == "") {
        alert("비밀번호를 확인해 주세요.");
        document.regFrm01.modipwdcheck.focus();
        return;
    }
 
    if (document.regFrm01.modipwdcheck.value != document.regFrm01.modipwdcheck.value) // 입력한 비밀번호와
                                                                    // 확인 비밀번호가
                                                                    // 맞지 않으면 경고
                                                                    // 메시지 출력
    {
        alert("비밀번호가 일치하지 않습니다.");
        document.regFrm01.modipwdcheck.value = "";
        document.regFrm01.modipwdcheck.focus();
        return;
    }
    
    if(document.regFrm01.sample4_postcode.value =="" || document.regFrm01.sample4_detailAddress.value ==""){
       alert("주소를 입력해주세요.");
       document.regFrm01.sample4_postcode.focus();
       
    }
    
    if(document.regFrm01.phone2.value =="" || document.regFrm01.phone3.value ==""){
       alert("핸드폰 번호를 입력해주세요.");
       document.regFrm01.sample4_postcode.focus();
       
    }
     
     document.regFrm01.method="post";   
     document.regFrm01.action = "/edupick/Member/memberModifyAction.do";
    document.regFrm01.submit();
    return;
}

   
   