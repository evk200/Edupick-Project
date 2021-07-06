<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>      

<% PointquizVo qv = (PointquizVo)request.getAttribute("pv"); %>        
    

<% String loginname = (String)session.getAttribute("loginname"); %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>퀴즈 수정</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminquizadd.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		function check(){
			if (document.frm.psubject.value == ""){
				alert("문제를 입력하세요.");
				document.frm.psubject.focus();
				return;
			}else if (document.frm.pcontent1.value == "") {
				alert("문제1번을 입력하세요.");
				document.frm.pcontent1.focus();
				return;
			}else if (document.frm.pcontent2.value == "") {
				alert("문제2번을 입력하세요.");
				document.frm.pcontent2.focus();
				return;
			}else if (document.frm.pcontent3.value == "") {
				alert("문제3번을 입력하세요.");
				document.frm.pcontent3.focus();
				return;
			}else if (document.frm.pcontent4.value == "") {
				alert("문제4번을 입력하세요.");
				document.frm.pcontent4.focus();
				return;
			}else if (document.frm.pexplanation.value == "") {
				alert("문제 풀이를 입력하세요.");
				document.frm.pexplanation.focus();
				return;
			}
			alert("등록합니다.");
			document.frm.action="<%=request.getContextPath() %>/Admin/adminPointQuizModifyAction.do";
			document.frm.method="post";
			//document.frm.enctype="multipart/form-data";
			document.frm.submit();
			
			
			return;
		}
	</script>
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
				<form class="quizplusfrm" name="frm">
					<div class="quizdiv1">난이도
						<select name="pdifficulty" value="<%= qv.getPdifficulty()%>">
							<option selected value="high">상</option>
							<option value="middle">중</option>
							<option value="low">하</option>
						</select>
					</div>
					<div>문제지문
						<input type="text" name="psubject" value="<%= qv.getPsubject()%>">
						<input type="hidden" name="pscore" value="<%= qv.getPscore()%>">
						<input type="hidden" name="pidx" value="<%= qv.getPidx()%>">
					</div>
						<ul>
							<li>문제 : 1 <input type="text" id="rsize" name="pcontent1" value="<%= qv.getPcontent1()%>" ></li>
							<li>문제 : 2 <input type="text" id="rsize" name="pcontent2" value="<%= qv.getPcontent2()%>"></li>
							<li>문제 : 3 <input type="text" id="rsize" name="pcontent3" value="<%= qv.getPcontent3()%>"></li>
							<li>문제 : 4 <input type="text" id="rsize" name="pcontent4" value="<%= qv.getPcontent4()%>"></li>
						</ul>
					<div class="quizdiv2">정답
						<select name="panswer" value="<%= qv.getPanswer()%>">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
					<div>문제 풀이
						<input type="text" name="pexplanation" value="<%= qv.getPexplanation()%>">
					</div>
					<button type="button" id="quizsave" onclick="check()">저장</button>
				</form>
			</article>
		</section>
	</body>
</html>