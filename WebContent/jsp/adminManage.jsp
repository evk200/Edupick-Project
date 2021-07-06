<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
	String loginname = (String)session.getAttribute("loginname");
	String lId = (String)session.getAttribute("lId");
	String logintel = (String)session.getAttribute("loginltel");
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 계정관리</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminpage.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv"><%= loginname %></div>
				<div class="logdiv2">
				<a href="<%= request.getContextPath() %>/Common/main.do">Home</a>
				<a href="#">로그아웃</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" style="background:#FA5858">관리자 계정관리</div>
		</nav>
		<nav>
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
					<div class="maincontent">
						<div><h1>관리자 정보</h1></div>
						<div class="infomain">
							<div class="info1">
								<div class="infoo">아이디</div>
								<div class="infocontent" id="named"><%= lId  %></div>
							</div>
							<div class="info">
								<div class="infoo">비밀번호</div>
								<div class="infocontent" id="modibt0">******&nbsp<button type="button" id="modibt0_1">변경</button></div>
							</div>
							<div class="info">
								<div class="infoo">이름</div>
								<div class="infocontent" id="modibt"><%= loginname %>&nbsp</div>
							</div>
							<div class="info">
								<div class="infoo">관리자 등급</div>
								<div class="infocontent" id="grade">A(운영자)</div>
							</div>
						</div>
					</div>
					<div class="myservice">
						<div><h3>내 정보 변경</h3></div>
						<div>이름 <input type="text" size=9></div>
						<div>연락처 <input type="text" size=2 maxlength=3> - <input type="text" size=3 maxlength=4> - <input type="text" size=3 maxlength=4></div>
						<button type="button" id="close">닫기</button>
						<button type="button" id="save">저장</button>
					</div>
					<div class="myservice2">
						<div><h3>비밀번호 변경</h3></div>
						<div style="margin-left:38px;">비밀번호 <input type="password" size=14 maxlength=15></div>
						<div>비밀번호 확인 <input type="password" size=14 maxlength=15></div>
						<button type="button" id="close2">닫기</button>
						<button type="button" id="save2">저장</button>
					</div>
				</div>
			</article>
		</section>
	</body>
</html>