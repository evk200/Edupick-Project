<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입완료</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/joinok.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
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
			<article name="joincoac">
				<form name="joincp">
					<div class="h1_1">
						<h1 id="h1_1">회원가입 완료</h1>
					</div>
					<p/>
					<div class="hrber">
						<div class="mainne">
							<h4>회원가입이 완료되었습니다.</h4>
							<h3>지금 바로 로그인 하시겠습니까?</h3>
						</div>
					</div>
					<div class="joindiv">
						<a href="<%= request.getContextPath() %>/Common/login.do" class="btn login" id="loginbtn">예</a>
						<a href="<%= request.getContextPath() %>/Common/main.do" class="btn home" style="margin-left:1%;">Home</a>
					</div>
				</form>
			</article>
		</section>
		<footer style="overflow:hidden;">
			<hr class="hr02">
				<div class="footerdiv">
					<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
				</div>
				<div class="fer01 coac">	
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
				<div class="fer02 coac2">
					㈜ 에듀픽<br/>
					주소 : 전라북도 전주시<br/>
					대표조장 : 김학림 | 사업자등록번호 : 498-65-65421
				</div>
			<div class="ct01 coac3">
				고객센터 : 1577-8888<br/>
				<p/>
				근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>
				점심시간 : PM12 :00 ~ PM 1 : 00<br/>
				고객센터 : AM 10: 00 ~ PM6 : 00<br/>
			</div>
		</footer>
	</body>
</html>		




