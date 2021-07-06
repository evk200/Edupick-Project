<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>         
<% String loginname = (String)session.getAttribute("loginname"); %>  
<% InstituteVo iv = (InstituteVo)request.getAttribute("iv"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학원상세</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/admininstitutedetail.css" rel="stylesheet" type="text/css" />
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
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_1" style="background:#FA5858;">학원관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_2">강의관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_3">수강생관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_4">수강평관리</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_5">커뮤니티 관리</a><br>
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
			
			<div class="adminmenu4">
				<div class="subnav3" id="subnav2_1">회원관리</div>
				<div class="subnav3" id="subnav2_2" style="background:#FA5858;">상품관리</div>
				<div class="subnav3" id="subnav2_3">주문관리</div>
				<div class="subnav3" id="subnav2_4">게시판관리</div>
				<div class="subnav3" id="subnav2_5">페이지관리</div>
				<div class="subnav3" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<div class="clmain">
					<form>
						<input type="hidden" name="iidx" value="<%=iv.getIidx()%>">
						<div class="clmain1">
							<%if (iv.getIfile() == null) { 
								out.print("이미지가 없거나 오류 입니다."); %>
							<%} else {%>
							<img id="mainbanner" src="<%=request.getContextPath()%>/filefolder/<%=iv.getIfile()%>">
							<%} %>
						</div>
						<div class="clmain2">
							<ul>
								<li style="line-height:100px;">학원명 : <%=iv.getIname() %></li>
								<li>학원위치 : <br><%=iv.getIroadaddr() %><br><%=iv.getIdetailaddr() %><img src="B.jpg"><br><br></li>
								<li style="line-height:100px;">전화번호 : <%=iv.getItel() %></li>
								<li style="line-height:50px;">개설과목 : <%=iv.getIsubjects() %></li>
								<li style="line-height:100px;">편의사항 : <%=iv.getIneeds() %></li>
							</ul>
						</div>
						<div class="clmain3" style="text-align:center;">
							<div style="border-bottom:1px solid black;">
								<span>학원 소개</span>
							</div>
							<%=iv.getIintroduce() %>
						</div>
						<div class="clmainsub">
							<button type="button" id="clmodi"><a href="/edupick/Admin2/adminInstituteModify.do?iidx=<%=iv.getIidx()%>">수정</a></button>
							<button type="button" id="cllist">목록</button>
						</div>
					</form>
				</div>
			</article>
		</section>
	</body>
</html>