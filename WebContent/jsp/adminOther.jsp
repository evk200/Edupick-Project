<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>       
   
<%	ArrayList<service.PointquizVo> alist = (ArrayList<service.PointquizVo>)request.getAttribute("alist");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
%>    
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기타관리</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminother.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;">
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
			<div class="admin">관리자 계정관리</div>
			<div>
				<div class="navuser">포인트 관리 ▼</div>
				<div class="navuser_1">
					<a href="#" id="navuser_1_2" style="background:#FA5858;">포인트 퀴즈</a><br>
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
			
			<div class="adminmenu4" id="senagogo2">
				<div class="subnav4" id="subnav2_1">회원관리</div>
				<div class="subnav4" id="subnav2_2">상품관리</div>
				<div class="subnav4" id="subnav2_3">주문관리</div>
				<div class="subnav4" id="subnav2_4">게시판관리</div>
				<div class="subnav4" id="subnav2_5">페이지관리</div>
				<div class="subnav4" id="subnav2_6" style="background:#FA5858;">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
					<div class="usermainpage2">
						<form class="shfrm">
							<div class="selectsh">
								<select>
									<option selected>문제</option>
									<option>난이도</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
							<div class="clplus"><button type="button" id="clplus_4">퀴즈 추가하기</button></div>
						</form>
					</div>
					<form class="mainfrm2">
					<table class="maintable">
						<tr id="table1">
							<th><input type="checkbox" id="usercheck"></th>
							<th>번호</th>
							<th>문제</th>
							<th>난이도</th>
							<th>적립 포인트</th>
						</tr>
						<%for (PointquizVo pv : alist) {%>
						<tr>
							<th><input type="checkbox" id="usercheck_all1"></th>
							<td><%=pv.getPidx() %></td>
							<td>
								<a href="<%=request.getContextPath()%>/Admin/adminPointQuizDetail.do?pidx=<%=pv.getPidx()%>">
								<%=pv.getPsubject() %></a>
							</td>
							<td><%=pv.getPdifficulty() %></td>
							<td><%=pv.getPscore() %></td>
						</tr>
						<% } %>
					</table>
					<table id="divPaging">
						<tr>
							<td>
								<%if (pm.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Admin2/adminOther.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Admin2/adminOther.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm.isNext()&& pm.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Admin2/adminOther.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>
			
			</article>
		</section>
	</body>
</html>