<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String loginname = (String)session.getAttribute("loginname");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자페이지</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminpage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv" id="herdiv">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv" id="logdiv"><%= loginname %></div>
				<div class="logdiv2" id="logodiv2">
				<a href="<%= request.getContextPath() %>/Common/main.do">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin">관리자 계정관리</div>
		</nav>
		<nav class="navadmin">
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
			
			<div class="adminmenu2">
				<div class="subnav2" id="subnav2_1">회원관리</div>
				<div class="subnav2" id="subnav2_2">상품관리</div>
				<div class="subnav2" id="subnav2_3">주문관리</div>
				<div class="subnav2" id="subnav2_4">게시판관리</div>
				<div class="subnav2" id="subnav2_5">페이지관리</div>
				<div class="subnav2" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<div class="imdif">
					<div class="mainuser">
						<div class="userimg"><img src="<%= request.getContextPath() %>/webimage/회원.png">&nbsp;회원수 : 2</div>
						<div class="todayjoin">오늘 가입 : 1</div>
						<div class="alluesr">총 회원수 : 5</div>
					</div>
					<div class="mainvisit">
						<div class="visitimg"><img src="<%= request.getContextPath() %>/webimage/방문자.png">&nbsp;방문자 수 : 38</div>
						<div class="todayvisit">오늘 방문자 : 3</div>
						<div class="allvisit">총 방문자 : 41</div>
					</div>
					<div class="question">
						<img src="<%= request.getContextPath() %>/webimage/질문.png">
						<a href="<%= request.getContextPath()%>/Customerservice/customerservice.do"><div class="question1">등록된 질문</div></a>
					</div>
					<div class="num1">
						<div><img src="<%= request.getContextPath()%>/webimage/banner1.jpg"></div>
					</div>
					<div class="num2">
						<div><img src="<%= request.getContextPath()%>/webimage/banner3.jpg"></div>
					</div>
				</div>
			</article>
		</section>
	</body>
</html>