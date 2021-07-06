<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Main_intro</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/intro.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/intro.js"></script>
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="overflow:auto; overflow-x:hidden; overflow-y:scroll;" onload="printClock()">
		<header>
			<div class="headerimg"> 
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<hr class="tophr"/>
		</header>	
		<section>
			<div id="clock">
			</div>
			<article name="intromain">
				<div class="mainimg1">
					<a href="<%= request.getContextPath() %>/Common/main.do">
						<img src="<%= request.getContextPath() %>/webimage/mainimg.jpg" title="클릭 시 메인 화면으로 이동합니다." alt="이미지 오류입니다.">
					</a>
				</div>
				<div class="maincheck"> <!--관련자료 : https://slreference.tistory.com/47-->
					<input type="checkbox"><small>오늘 하루 안보기</small>
				</div>
			</article>
		</section>
		<footer>
			<hr class="hr02">
				<div class="footerdiv">
					<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
				</div>
				<div class="fer01">	
					<ul>
						<li style="margin:3%;">
							<a href="#" class="fera"><h5>회사소개</h5></a>
						</li>	
						<li style="margin:3%;">	
							<a href="#" class="fera"><h5>개인정보처리방침</h5></a>
						</li>
						<li style="margin:3%;">	
							<a href="#" class="fera"><h5>사업자 정보 확인</h5></a>
						</li>
					</ul>
				</div>
				<div class="fer02">
					㈜ 에듀픽<br/>
					주소 : 전라북도 전주시<br/>
					대표이사 : 000 | 사업자등록번호 : 498-65-65421
				</div>
			<div class="ct01">
				고객센터 : 1577-8888<br/>
				<p/>
				근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>
				점심시간 : PM12 :00 ~ PM 1 : 00<br/>
				고객센터 : AM 10: 00 ~ PM6 : 00<br/>
			</div>
		</footer>
	</body>
</html>