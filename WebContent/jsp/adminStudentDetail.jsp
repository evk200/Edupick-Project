<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String loginname = (String)session.getAttribute("loginname");
%>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수강생 상세</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminstudentdetail.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv"><%=loginname %>(님)</div>
				<div class="logdiv2">
				<a href="에듀픽.html">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >관리자 계정관리</div>
			<div>
				<div class="navuser">상품관리 ▼</div>
				<div class="navuser_1">
					<a href="상품관리.html" id="navuser_1_1">학원관리</a><br>
					<a href="상품관리.html" id="navuser_1_2">강의관리</a><br>
					<a href="상품관리.html" id="navuser_1_3">수강생관리</a><br>
					<a href="상품관리.html" id="navuser_1_4">수강평관리</a><br>
					<a href="상품관리.html" id="navuser_1_5">커뮤니티 관리</a><br>
					<a href="상품관리.html" id="navuser_1_6">상담관리</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2" style="background:#FA5858;">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="clanfrm">
					<ul>
						<li>학원명</li>
						<li><input type="text" value="이젠IT" disabled></li>
						<li>수강명</li>
						<li><input type="text" value="벤치프레스하기" disabled></li>
					</ul>
					<ul>
						<li>학부모명</li>
						<li><input type="text" value="앵그리맘" disabled></li>
						<li>학부모 연락처</li>
						<li><input type="text" value="010-3692-8787" disabled></li>
					</ul>
					<ul>
						<li>수강생명</li>
						<li><input type="text" value="앵그리" disabled></li>
						<li>수강생 연락처</li>
						<li><input type="text" value="010-8282-4444" disabled></li>
					</ul>
					<ul>
						<li>주소</li>
						<li><input type="text" value="전북 전주시 하수구" disabled></li>
						<li>이메일</li>
						<li><input type="text" value="er532@gmail.com" disabled></li>
					</ul>
					<ul>
						<li>차량탑승여부</li>
						<li id="boxtext">
						<input type="radio" name="ride1" disabled> O
						<input type="radio" name="ride1" disabled> X
						</li>
						<li>탑승지 주소</li>
						<li><input type="text" value="전북 전주시 월드컵경기장" disabled></li>
					</ul>
					<ul>
						<li>수강 시작일</li>
						<li><input type="text" value="2021-02-22" disabled></li>
						<li>다음 결제일</li>
						<li><input type="text" value="2021-03-22" disabled></li>
					</ul>
					<ul>
						<li>수강 시간</li>
						<li><input type="text" value="11:00 ~ 15 : 30" disabled></li>
					</ul>
					<button type="button" id="listbtn1">목록</button>
					<button type="button" id="modibtn1">수정</button>
				</form>
			</article>
		</section>
	</body>
</html>