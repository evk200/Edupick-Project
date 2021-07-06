<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>EduPick 학원검색 | 학원찾기</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<script src="<%= request.getContextPath() %>/js/licenseejoin.js"></script>
		<script src="<%= request.getContextPath() %>/js/isSames.js"></script>
		<script src="<%= request.getContextPath() %>/js/islId.js"></script>
		<script src="<%= request.getContextPath() %>/js/isLName.js"></script>
		<link href="<%= request.getContextPath() %>/css/join.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />	
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      	<script src="<%= request.getContextPath() %>/js/address.js"></script>
      	<link href="<%= request.getContextPath() %>/css/error.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="overflow-x:hidden;"> 
		<header>
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<div id="topmenumain">
				<ul>
					<li>
						<a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua">학원찾기</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua">공지사항</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Eduinformation/eduinformation.do" class="menua">교육정보</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Customerservice/customerservice.do" class="menua">고객센터</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua">My 서비스</a>
					</li>
				</ul>
			</div>
		</header>
		<section>
			<article name="joinate">
				<fieldset name="joinfed">
					<form name="regFrm">
						<table>
							<tr>
                                <td width="19%;"><span>*</span>아이디</td>
                                <td><input name="lId" size="15" id="lId"> <input
                                    type="button" value="ID중복확인"
                                    onClick="checkid()"></td>
                                <!-- onClick로 입력한 아이디가 중복된 값인지 확인 -->
                          		<p/>
								<span id="isid"></span>
                            </tr>
							<tr>
								<td>
									<span>*</span>비밀번호
								</td>
								<td>
									<input type="password" id="pwd" name="lPwd" size="20">
								</td>
							</tr>
							<tr>
								<td>
									<span>*</span>비밀번호 확인
								</td>
								<td>
									<input type="password" id="pwdCheck" name="lPwd2" size="20"><span id="same"></span>
								</td>
							</tr>
							<tr>
								<td>
									<span>*</span>이름
								</td>
								<td>
									<input id="name" name="lName" size="15"><span id="isname"></span>
								</td>
							</tr>
							<tr>
								<td>
									<span>*</span>주민등록번호
								</td>
								<td>
									<input name="lJumin0" size="8" maxlength="6"> - <input type="password" name="lJumin1" size="8" maxlength="7">
								</td>
							</tr>
							<tr>
								<td>
									이메일
								</td>
								<td>
									<input name="lEmail1" size="20"> @	
									<select name="lEmail2">
										<option selected >naver.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									이메일 수신동의
								</td>
								<td>
									<input type="radio" name="emailch"> 동의
									<input type="radio" name="emailch"> 동의거부
								</td>
							</tr>
							<tr>
								<td>
									<span>*</span>우편번호
								</td>
                                <td>
									<input type="text" id="sample4_postcode" name="sample4_postcode"  readonly placeholder="우편번호">
                         			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                         			<input type="text" id="sample4_roadAddress" name="sample4_roadAddress" readonly placeholder="도로명주소">
                          			<input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" readonly placeholder="지번주소"><br>
                          			<span id="guide" name="guide" style="color:#999;display:none"></span>
                          			<input type="text" id="sample4_detailAddress" name="sample4_detailAddress" placeholder="상세주소">
                           			<input type="text" id="sample4_extraAddress" name="sample4_extraAddress" placeholder="참고항목">									
                                </td>
							</tr>
							<tr>
								<td>
									<span>*</span>휴대폰 번호
								</td>							
								<td>
									<select name="lTel0">
										<option selected>010</option>
									</select> -
									<input name="lTel1" size="5" maxlength="4"> - <input name="lTel2" size="5" maxlength="4">
								</td>
							</tr>
							<tr>
								<td>
									<span>*</span>업체명
								</td>
								<td>
									<input name="lComName" size="15">
								</td>
							</tr>
							<tr>
								<td>
									<span>*</span>사업자번호
								</td>
								<td>
									<input name="lNumber1" size="4" maxlength="3"> - <input name="lNumber2" size="4" maxlength="2"> - <input name="lNumber3" size="4" maxlength="4">
								</td>
							</tr>
							<tr>
                                <td id="jointd" colspan="3"><input type="button"
                                    value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp; <input
                                    type="reset" value="다시쓰기">
								</td>
                            </tr>
						</table>	
					</form>	
				</fieldset>
			</article>
		</section>
		<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
		<button onclick="topFunction()" id="scrollTopBtnMob" title="Go to top">▲Top</button>
		<footer style="overflow:hidden;">
			<hr class="hr02">
				<div class="footerdiv">
					<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
				</div>
				<div class="fer01">	
					<ul>
						<li style="margin:3%;">
							<a href="#"><h5>회사소개</h5></a>
						</li>	
						<li style="margin:3%;">	
							<a href="#"><h5>개인정보처리방침</h5></a>
						</li>
						<li style="margin:3%;">	
							<a href="#"><h5>사업자 정보 확인</h5></a>
						</li>
					</ul>
				</div>
				<div class="fer02">
					㈜ 에듀픽<br/>
					주소 : 전라북도 전주시<br/>
					대표조장 : 김학림 | 사업자등록번호 : 498-65-65421
				</div>
			<div class="ct01">
				고객센터 : 1577-8888<br/>
				<p/>
				근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>
				점심시간 : PM12 :00 ~ PM 1 : 00<br/>
				고객센터 : AM 10: 00 ~ PM6 : 00<br/>
			</div>
		</footer>