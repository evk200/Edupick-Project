<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>    
<% String loginname = (String)session.getAttribute("loginname"); %>    
<%	ArrayList<service.NoticeVo> alist = (ArrayList<service.NoticeVo>)request.getAttribute("alist");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
<%	ArrayList<service.EduinformationVo> alist2 = (ArrayList<service.EduinformationVo>)request.getAttribute("alist2");
	PageMaker pm2 = (PageMaker)request.getAttribute("pm2");
%>
<%	ArrayList<service.CustomerServiceVo> alist3 = (ArrayList<service.CustomerServiceVo>)request.getAttribute("alist3");
	PageMaker pm3 = (PageMaker)request.getAttribute("pm3");
%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>페이지관리</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminpagemanage.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;" >
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
					<a href="#" id="navuser_1_1" style="background:#FA5858;">공지사항</a><br>
					<a href="#" id="navuser_1_2">교육정보</a><br>
					<a href="#" id="navuser_1_3">고객센터</a><br>
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
				<form class="mainfrm">
					<h2 id="topcenter">공지사항</h2>
					<div class="clplus"><button type="button" id="clplus_3" name="noticeplus">추가하기</button></div>
					<table class="maintable">
						<tr id="table1">
							<th><input type="checkbox" id="usercheck"></th>
							<th>No</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>첨부파일</th>
						</tr>
						<%for (NoticeVo nv : alist) {%>
						<tr>
							<th><input type="checkbox" id="usercheck_all1"></th>
							<td><%=nv.getNidx() %></td>
							<td><%=nv.getNcategory() %></td>
							<td>
								<a href="<%=request.getContextPath()%>/Admin2/adminPageNoticeDetail.do?nidx=<%=nv.getNidx()%>">
								<%=nv.getNsubject() %></a>
							</td>
							<td><%=nv.getNwriter() %></td>
							<td><%=nv.getNwriteday() %></td>
							<td><%=nv.getNhit() %></td>
							<td>
								<%if(nv.getNfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
								<% out.println("파일이 있습니다."); %>
								<br>
								파일명 : <%=nv.getNfile() %>
								<%} %>
							</td>
						</tr>
						<% } %>
					</table>
					<table id="divPaging">
						<tr>
							<td>
								<%if (pm.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Admin2/adminPageManage.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Admin2/adminPageManage.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm.isNext()&& pm.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Admin2/adminPageManage.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>
				<form class="mainfrm2">
					<h2 id="topcenter">교육정보</h2>
					<div class="clplus"><button type="button" id="clplus_3" name="eduinformationplus">추가하기</button></div>
					<table class="maintable">
						<tr id="table1">
							<th><input type="checkbox" id="usercheck"></th>
							<th>No</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>첨부파일</th>
						</tr>
						<%for (EduinformationVo ev : alist2) {%>
						<tr>
							<th><input type="checkbox" id="usercheck_all1"></th>
							<td><%=ev.getEidx() %></td>
							<td><%=ev.getEcategory() %></td>
							<td>
								<a href="<%=request.getContextPath()%>/Admin2/adminPageEduInformationDetail.do?eidx=<%=ev.getEidx()%>">
								<%=ev.getEsubject() %></a>
							</td>
							<td><%=ev.getEwriter() %></td>
							<td><%=ev.getEwriteday() %></td>
							<td><%=ev.getEhit() %></td>
							<td>
								<%if(ev.getEfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
								<% out.println("파일이 있습니다."); %>
								<br>
								파일명 : <%=ev.getEfile() %>
								<%} %>
							</td>
						</tr>
						<% } %>
					</table>
					<table id="divPaging">
						<tr>
							<td>
								<%if (pm2.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Admin2/adminPageManage.do?page=<%=pm2.getStartPage()-1%>&keyword=<%=pm2.encoding(pm2.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm2.getStartPage(); i<=pm2.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Admin2/adminPageManage.do?page=<%=i%>&keyword=<%=pm2.encoding(pm2.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm2.isNext()&& pm2.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Admin2/adminPageManage.do?page=<%=pm2.getEndPage()+1%>&keyword=<%=pm2.encoding(pm2.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>
				<form class="mainfrm3">
					<h2 id="topcenter">고객센터</h2>
					<div class="clplus"><button type="button" id="clplus_3" name="customerserviceplus">추가하기</button></div>
					<table class="maintable">
						<tr id="table1">
							<th><input type="checkbox" id="usercheck"></th>
							<th>No</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>첨부파일</th>
						</tr>
						<%for (CustomerServiceVo cv : alist3) {%>
						<tr>
							<th><input type="checkbox" id="usercheck_all1"></th>
							<td><%=cv.getCidx() %></td>
							<td><%=cv.getCcategory() %></td>
							<td>
								<a href="<%=request.getContextPath()%>/Admin2/adminPageCustomerServiceDetail.do?cidx=<%=cv.getCidx()%>">
								<%=cv.getCsubject() %></a>
							</td>
							<td><%=cv.getCwriter() %></td>
							<td><%=cv.getCwriteday() %></td>
							<td><%=cv.getChit() %></td>
							<td>
								<%if(cv.getCfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
								<% out.println("파일이 있습니다."); %>
								<br>
								파일명 : <%=cv.getCfile() %>
								<%} %>
							</td>
						</tr>
						<% } %>
					</table>
					<table id="divPaging">
						<tr>
							<td>
								<%if (pm3.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Admin2/adminPageManage.do?page=<%=pm3.getStartPage()-1%>&keyword=<%=pm3.encoding(pm3.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm3.getStartPage(); i<=pm3.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Admin2/adminPageManage.do?page=<%=i%>&keyword=<%=pm3.encoding(pm3.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm3.isNext()&& pm3.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Admin2/adminPageManage.do?page=<%=pm3.getEndPage()+1%>&keyword=<%=pm3.encoding(pm3.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>
			</article>
		</section>
	</body>
</html>