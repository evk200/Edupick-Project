<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원상세보기</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmemberdetail.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv" id="herdiv2">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv" id="logdiv_2"><%= loginname %></div>
				<div class="logdiv2" id="logodiv_2">
				<a href="<%= request.getContextPath() %>/Common/main.do">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >관리자 계정관리</div>
			<div>
				<div class="navuser">회원관리 ▼</div>
				<div class="navuser_1">
					<a href="<%= request.getContextPath() %>/Admin/adminMemberManage.do">회원목록</a><br>
					<a href="<%= request.getContextPath() %>/Admin/adminMemberManage.do">탈퇴회원</a><br>
					<a href="<%= request.getContextPath() %>/Admin/adminMemberManage.do">질문관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin/adminMemberManage.do">FAQ관리</a>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1" style="background:#FA5858;">회원관리</div>
				<div class="subnav" id="subnav2">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
			
			<div class="adminmenu3">
				<div class="subnav2" id="subnav2_1" style="background:#FA5858;">회원관리</div>
				<div class="subnav2" id="subnav2_2">상품관리</div>
				<div class="subnav2" id="subnav2_3">주문관리</div>
				<div class="subnav2" id="subnav2_4">게시판관리</div>
				<div class="subnav2" id="subnav2_5">페이지관리</div>
				<div class="subnav2" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="frmut">
					<table class="usertable">
						<tr>
							<th width=20%>아이디</th>
							<td><input type="text" size=10 value="real" disabled></td>
							<th >비밀번호</th>
							<td><input type="password" size=10 value="******"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" size=10 value="햄버거" disabled></td>
							<th>회원구분</th>
							<td><input type="text" size=10 value="일반회원" disabled></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" size=10 value="010-8282-9999"></td>
							<th>포인트</th>
							<td><input type="text" size=10 value="27630point" disabled></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td colspan=3><input type="text" value="imhungry@hambug.com" size=30></td>
						</tr>
						<tr>
							<th rowspan=2>주소</th>
							<td colspan=3><input type="text" size=5 disabled></td>
						</tr>
						<tr>
							<td colspan=3><input type="text" size=60 disabled></td>
						</tr>
					</table>
					<div>
						<button type="button" id="sec">저장</button>
						<button type="button" id="fro">목록</button>
					</div>
				</form>
			</article>
		</section>
	</body>
</html>