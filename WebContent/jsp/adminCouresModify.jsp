<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "Domain.*" %>  
<%@ page import = "controller.*" %>   
<% CourseVo cv = (CourseVo)request.getAttribute("cv"); %>    
<% String loginname = (String)session.getAttribute("loginname"); %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>강의상세보기</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%=request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/admin.js"></script>
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/css/admincouresdetail.css" rel="stylesheet" type="text/css" />
		<script>
			function check(){
				if (document.cladmain.cname.value == ""){
					alert("수강명을 입력하세요.");
					document.cladmain.cname.focus();
					return;
				}else if (document.cladmain.cprice.value == "") {
					alert("수강비를 입력해주세요.");
					document.cladmain.cprice.focus();
					return;
				}
				alert("등록합니다.");
				document.cladmain.action="<%=request.getContextPath() %>/Admin2/adminCourseModifyAction.do";
				document.cladmain.method="post";
				document.cladmain.enctype="multipart/form-data";
				document.cladmain.submit();
				
				
				return;
			}
		</script>
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><img src="<%=request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv"><%=loginname %></div>
				<div class="logdiv2">
				<a href="edupick/Common/main.do">Home</a>
				<a href="#">로그아웃</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >관리자 계정관리</div>
			<div>
				<div class="navuser">상품관리 ▼</div>
				<div class="navuser_1">
					<a href="/edupick/Admin2/adminProductManage.do" id="navuser_1_1">학원관리</a><br>
					<a href="/edupick/Admin2/adminProductManage.do" id="navuser_1_2" style="background:#FA5858;">강의관리</a><br>
					<a href="/edupick/Admin2/adminProductManage.do" id="navuser_1_3">수강생관리</a><br>
					<a href="/edupick/Admin2/adminProductManage.do" id="navuser_1_4">수강평관리</a><br>
					<a href="/edupick/Admin2/adminProductManage.do" id="navuser_1_5">커뮤니티 관리</a><br>
					<a href="/edupick/Admin2/adminProductManage.do" id="navuser_1_6">상담관리</a><br>
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
				<form class="cladmain" name="cladmain">
					<input type="hidden" name="cidx" value="<%=cv.getCidx()%>">
					<ul id="main1">
						<li>수강명 : <input type="text" name="cname" value="<%=cv.getCname()%>"></li>
						<li>수강비 : <input type="text" name="cprice" value="<%=cv.getCprice()%>"></li>
						<li>수강기간 : <input type="text" name="cperiod" value="<%=cv.getCperiod()%>"> 상시<input type="checkbox"></li>						
						<li>수강시간 : <input type="text" name="ctime" value="<%=cv.getCtime()%>"></li>
						<li>모집인원 : <input type="text" name="cpeople" value="<%=cv.getCpeople()%>"> <input type="checkbox" name="cpeople"> 제한없음</li>
						<li>파일 : <input type="file" name="cfile" value="<%=cv.getCfile()%>"></li>
					</ul>
					<ul id="main2">
						<li>강의교재 : <input type="text" name="cbook" value="<%=cv.getCbook()%>"></li>
						<li>강의목표 : <input type="text" name="caim" value="<%=cv.getCaim()%>"></li>
					</ul>
					<button type="button" id="coursesubmit" onclick="check()">등록</button>
				</form>
			</article>
		</section>
	</body>
</html>