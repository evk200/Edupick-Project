<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
	<html>
		<head>
			<title>질문답변</title>
			<!-- title 아이콘 -->
			<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
			<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
			<link href="<%= request.getContextPath() %>/css/adminanswer.css" rel="stylesheet" type="text/css" />
			<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
			<script src="<%= request.getContextPath() %>/js/admin.js"></script>
			<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		</head>
		<body>
			<header>
				<div class="herdiv">
					<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
					<div class="logdiv"><%= loginname %></div>
					<div class="logdiv2">
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
					<form class="questfrm">
						<table class="questtable">
							<tr>
								<th width="100px" height="68px">제목</th>
								<td height="68px"><input type="text" value="테스트중" disabled></td>
								<th width="100px" height="68px">작성자</th>
								<td height="68px"><input type="text" value="테스트중" disabled></td>
							</tr>
							<tr>
								<th height="68px">분류</th>
								<td><input type="text" value="테스트중" disabled></td>
								<th height="68px">작성일</th>
								<td><input type="text" value="테스트중" disabled></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan=3><textarea disabled>테스트입니다.</textarea></td>
							</tr>
						</table>
						<table class="questtable2">
							<tr>
								<th height=90%>답변리스트</th>
								<td colspan=2>버거킹 : 배구파</td>
							</tr>
							<tr>
								<th>답변</th>
								<td width="500px"><input type="text" id="textbox2"></td>
								<td width="120px;" style="border-top:1px solid white;"><button type="button" id="submit">등록</button></td>
							</tr>
						</table>
						<button type="button" id="fro1">목록</button>
					</form>
				</article>
			</section>
		</body>
	</html>