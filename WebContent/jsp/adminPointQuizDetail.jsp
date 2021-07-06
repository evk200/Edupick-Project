<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>       
       
<% PointquizVo pv = (PointquizVo)request.getAttribute("pv"); %>
<% String loginname = (String)session.getAttribute("loginname"); %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>퀴즈 상세보기</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminquizadd.css" rel="stylesheet" type="text/css" />
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
			<div class="admin">관리자 계정관리</div>
			<div>
				<div class="navuser">포인트 관리 ▼</div>
				<div class="navuser_1">
					<a href="<%= request.getContextPath() %>/Admin2/adminOther.do" id="navuser_1_1">포인트 내역</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminOther.do" id="navuser_1_2">포인트 퀴즈</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6" style="background:#FA5858;">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="quizplusfrm" name="frm" id="bofrm">
					<div class="quizdiv1">난이도
						<%=pv.getPdifficulty() %>
					</div>
					<div>문제지문<br>
						<%=pv.getPsubject() %>
					</div>
						<ul>
							<li>문제 1 : <%=pv.getPcontent1() %></li>
							<li>문제 2 : <%=pv.getPcontent2() %></li>
							<li>문제 3 : <%=pv.getPcontent3() %></li>
							<li>문제 4 : <%=pv.getPcontent4() %></li>
						</ul>
					<div class="quizdiv2" id="poalign">정답<br>
						<%=pv.getPanswer() %>
					</div>
					<div>문제 풀이<br>
						<%=pv.getPexplanation() %>
					</div>
					<button type="button" id="quizlist">목록</button>
					<button type="button" id="quizmodify"><a href="<%=request.getContextPath()%>/Admin/adminPointQuizModify.do?pidx=<%=pv.getPidx()%>">수정</a></button>
					<button type="button" id="quizmodify"><a href="<%=request.getContextPath()%>/Admin/adminPointQuizDelete.do?pidx=<%=pv.getPidx()%>">삭제</a></button>
				</form>
			</article>
		</section>
	</body>
</html>