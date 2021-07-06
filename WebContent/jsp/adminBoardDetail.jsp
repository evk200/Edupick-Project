<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판보기</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/css/adminboardadd.css" rel="stylesheet" type="text/css" />
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
				<div class="navuser">게시판관리 ▼</div>
				<div class="navuser_1">
					<a href="<%= request.getContextPath() %>/Admin2/adminBoardManage.do" id="navuser_1_1">게시판 관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminBoardManage.do" id="navuser_1_2">코멘트 관리</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4" style="background:#FA5858;">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
			
			<div class="adminmenu4" id="senagogo2">
				<div class="subnav4" id="subnav2_1">회원관리</div>
				<div class="subnav4" id="subnav2_2">상품관리</div>
				<div class="subnav4" id="subnav2_3">주문관리</div>
				<div class="subnav4" id="subnav2_4" style="background:#FA5858;">게시판관리</div>
				<div class="subnav4" id="subnav2_5">페이지관리</div>
				<div class="subnav4" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="jusicfrm">
					<ul>
						<li>게시판 명</li>
						<li><input value="자유게시판" disabled></li>
						<li>카테고리</li>
						<li style="width:100px;">
							<select disabled>
								<option selected>카테고리</option>
							</select>
						</li>
						<li><button type="button">그룹관리</button></li>
						<li>게시판 관리자</li>
						<li><input value="권혁민" disabled></li>
						<li>자동비밀글</li>
						<li><input type="checkbox" disabled></li>
						<li>권한</li>
						<li>　</li>
						<li>목록보기<br>
							<select disabled>
								<option>일반</option>
								<option>정회원</option>
								<option>우수회원</option>
								<option>관리자</option>
							</select>
						</li>
						<li>내용보기<br>
							<select disabled>
								<option>일반</option>
								<option>정회원</option>
								<option>우수회원</option>
								<option>관리자</option>
							</select>
						</li>
						<li>글쓰기<br>
							<select disabled>
								<option>일반</option>
								<option>정회원</option>
								<option>우수회원</option>
								<option>관리자</option>
							</select>
						</li>
						<li>답글쓰기<br>
							<select disabled>
								<option>일반</option>
								<option>정회원</option>
								<option>우수회원</option>
								<option>관리자</option>
							</select>
						</li>
						<li><br>권한이 없을 경우</li>
						<li>　</li>
						<li style="width:500px;"><br>경고메세지 = ( ) 경고후 이동페이지 = ( )</li>
					</ul>
					<button type="button" id="postbtn">저장</button>
					<button type="button" id="postlist">목록</button>
				</form>
			</article>
		</section>
	</body>
</html>	