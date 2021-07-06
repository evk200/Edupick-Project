<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>       
       
<% EduinformationVo ev = (EduinformationVo)request.getAttribute("ev"); %>
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육정보 추가</title>
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
		<link href="<%= request.getContextPath() %>/css/adminpagep.css" rel="stylesheet" type="text/css" />
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
		<div class="admin">관리자 계정관리</div>
		<div>
			<div class="navuser">페이지 관리 ▼</div>
			<div class="navuser_1">
				<a href="<%= request.getContextPath() %>/Admin2/adminPageManage.do" id="navuser_1_1">공지사항</a><br>
				<a href="<%= request.getContextPath() %>/Admin2/adminPageManage.do" id="navuser_1_2">교육정보</a><br>
				<a href="<%= request.getContextPath() %>/Admin2/adminPageManage.do" id="navuser_1_3">고객센터</a><br>
			</div>
		</div>
	</nav>
	<nav>
		<div class="adminmenu">
			<div class="subnav" id="subnav1">회원관리</div>
			<div class="subnav" id="subnav2">상품관리</div>
			<div class="subnav" id="subnav3">주문관리</div>
			<div class="subnav" id="subnav4">게시판관리</div>
			<div class="subnav" id="subnav5" style="background:#FA5858;">페이지관리</div>
			<div class="subnav" id="subnav6">기타관리</div>
		</div>
		
		<div class="adminmenu4" id="senagogo2">
			<div class="subnav4" id="subnav2_1">회원관리</div>
			<div class="subnav4" id="subnav2_2">상품관리</div>
			<div class="subnav4" id="subnav2_3">주문관리</div>
			<div class="subnav4" id="subnav2_4">게시판관리</div>
			<div class="subnav4" id="subnav2_5" style="background:#FA5858;">페이지관리</div>
			<div class="subnav4" id="subnav2_6">기타관리</div>
		</div>
	</nav>
	<section>
		<article>
			<form class="pagefrmp" name="frm">
				<h2>교육정보</h2>
				<div name="ecategory" id="ecategory" style="width:120px;">
					<%=ev.getEcategory() %>
				</div>
				<table style="border-collapse:collapse">
					<tr>
						<td width=10%>제목</td>
						<td width=150%><%=ev.getEsubject() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="econtent" readonly><%= ev.getEcontent() %></textarea>
							<img src="<%=request.getContextPath()%>/filefolder/<%=ev.getEfile()%>" style="width:400px; height:200px;">							
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%= ev.getEwriter() %></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<%if(ev.getEfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
							<%=ev.getEfile() %>
							<%} %>
							<a href="<%=request.getContextPath()%>/Admin2/fileDownload.do?Nfile=<%=ev.getEfile()%>">다운로드</a>
						</td>
					</tr>
				</table>
				<button type="button" id="eduinformationmodify"><a href="<%=request.getContextPath()%>/Admin2/adminPageEduInformationModify.do?eidx=<%=ev.getEidx()%>">수정</a></button>
				<button type="button" id="eduinformationdel"><a href="<%=request.getContextPath()%>/Admin2/adminPageEduInformationDelete.do?eidx=<%=ev.getEidx()%>">삭제</a></button>
				<button type="button" id="noticelist">목록</button>
			</form>
		</article>
	</section>
</body>
</html>