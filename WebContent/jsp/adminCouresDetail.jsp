<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>       
<% String loginname = (String)session.getAttribute("loginname"); %>  
<% CourseVo cv = (CourseVo)request.getAttribute("cv"); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의상세보기</title>
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
		<link href="<%= request.getContextPath() %>/css/admincouresdetail.css" rel="stylesheet" type="text/css" />
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
				<div class="navuser">상품관리 ▼</div>
				<div class="navuser_1">
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_1">학원관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_2" style="background:#FA5858;">강의관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_3">수강생관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_4">수강평관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_5">커뮤니티 관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_6">상담관리</a><br>
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
			
			<div class="adminmenu4" id="senagogo2">
				<div class="subnav4" id="subnav2_1">회원관리</div>
				<div class="subnav4" id="subnav2_2" style="background:#FA5858;">상품관리</div>
				<div class="subnav4" id="subnav2_3">주문관리</div>
				<div class="subnav4" id="subnav2_4">게시판관리</div>
				<div class="subnav4" id="subnav2_5">페이지관리</div>
				<div class="subnav4" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="cladmain" name="cladmain">
					<ul id="main1">
						<li>수강명 : <input type="text" name="cname" value="<%=cv.getCname()%>" disabled></li>
						<li>수강비 : <input type="text" name="cprice" value="<%=cv.getCprice()%>" disabled></li>
						<li>수강기간 : <input type="text" name="cperiod" value="<%=cv.getCperiod()%>" disabled> 상시<input type="checkbox"></li>						
						<li>수강시간 : <input type="text" name="ctime" value="<%=cv.getCtime()%>" disabled></li>
						<li>모집인원 : <input type="text" name="cpeople" value="<%=cv.getCpeople()%>" disabled> <input type="checkbox" name="cpeople"> 제한없음</li>
						<li>파일 : <input type="file" name="cfile" value="<%=cv.getCfile()%>" disabled></li>
					</ul>
					<ul id="main2">
						<li>강의교재 : <input type="text" name="cbook" value="<%=cv.getCbook() %>" disabled></li>
						<li>강의목표 : <input type="text" name="caim" value="<%=cv.getCaim() %>" disabled></li>
					</ul>
					<input type="hidden" id="cidx" value="<%=cv.getCidx()%>">
					<button type="button" id="listbt">목록</button>
					<button type="button" id="modibtt"><a href="/edupick/Admin2/adminCouresModify.do?cidx=<%=cv.getCidx()%>">수정</a></button>
				</form>
			</article>
		</section>
	</body>
</html>