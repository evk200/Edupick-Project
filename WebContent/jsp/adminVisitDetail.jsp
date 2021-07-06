<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String loginname = (String)session.getAttribute("loginname");
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>방문결제상세보기</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/js/adminmemebermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminvisitdetail.css" rel="stylesheet" type="text/css" />
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
					<a href="주문관리.html" id="navuser_1_1">결제내역</a><br>
					<a href="주문관리.html" id="navuser_1_2">방문결제 관리</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2">상품관리</div>
				<div class="subnav" id="subnav3" style="background:#FA5858;">주문관리</div>
				<div class="subnav" id="subnav4">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="visitfrm">
					<div class="visitdiv">
					<ul>
						<li id="visitdate">날짜</li>
						<li id="visitdate2"><input type="date" name="inputaline" value="2021-02-24" disabled></li>						
					</ul>
					<ul>
						<li>시간</li>
						<li><input type="time" name="inputaline" value="13:30" disabled></li>
					</ul>
					<ul>
						<li>결제방법</li>
						<li><input type="radio" name="radio1" disabled>카드결제 <input type="radio" name="radio1" checked disabled>현금결제</li>
					</ul>
					<ul>
						<li>대리인 방문</li>
						<li><input type="radio" name="yn" checked disabled>예 <input type="radio" name="yn" disabled>아니오</li>
					</ul>
					<ul>
						<li>대리인 성함</li>
						<li><input name="inputaline" value="전갱이" disabled></li>
					</ul>
					<ul>
						<li>대리인 연락처</li>
						<li><input name="inputaline" value="010-6341-0842" disabled></li>
					</ul>
					<ul>
						<li>관계</li>
						<li><input name="inputaline" value="父" disabled></li>
					</ul>
					</div>
					<button type="button" id="visitlist">목록</button>
					<button type="button" id="visitdel">삭제</button>
				</form>
			</article>
		</section>
	</body>
</html>	