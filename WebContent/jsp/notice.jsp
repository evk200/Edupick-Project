<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>        

<%  
	String mName = (String)request.getAttribute("loginname");
	String lName = (String)request.getAttribute("loginname");
	String loginname = (String)session.getAttribute("loginname");
%>

<%	ArrayList<service.NoticeVo> alist = (ArrayList<service.NoticeVo>)request.getAttribute("alist");
	ArrayList<service.NoticeVo> alistuse = (ArrayList<service.NoticeVo>)request.getAttribute("alistuse");
	ArrayList<service.NoticeVo> alistevent = (ArrayList<service.NoticeVo>)request.getAttribute("alistevent");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<!-- 타이틀 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 기본틀 css -->
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<!-- 공지사항css -->
		<link href="<%= request.getContextPath() %>/css/notice.css" rel="stylesheet" type="text/css" />
		<!-- 제이쿼리 -->
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<!-- 공지사항스크립트 -->
		<script src="<%= request.getContextPath() %>/js/notice.js"></script>
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<link href="<%= request.getContextPath()%>/css/loginbtn.css" rel="stylesheet" type="text/css" />
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;">
		<header>
			<!-- 메인로고 -->
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			 <c:if test="${not empty sessionScope.loginname && userType =='M'|| userType=='L' || userType=='A'}">
            <div class="logoutdiv">
               <%=loginname %> <a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:20px; height:20px;">
            </div>
         </c:if>
         <c:if test="${empty sessionScope.loginname}">
            <div class="lognbt" id="loginbtnmain">
               <a href="<%= request.getContextPath() %>/Common/login.do">로그인</a><br>
            </div>
         </c:if>
			<div id="topmenumain">
				<ul>
					<li>
						<a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua">학원찾기</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua" style="background:#FA5858">공지사항</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Eduinformation/eduinformation.do" class="menua">교육정보</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Customerservice/customerservice.do" class="menua">고객센터</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua">My 서비스</a>
					</li>
				</ul>
			</div>
		</header>
		<section>
			
			<div class="maindmenu">
			<h1 id="noticeh1">공지사항</h1>
			<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
			<label for="tab1">전체</label>
			<input id="tab2" type="radio" name="tabs">
			<label for="tab2">이용 안내</label>
			<input id="tab3" type="radio" name="tabs">
			<label for="tab3">이벤트</label>	
			<section id="content1">
				<p id="ptag">
				<div id="div2">
					<select id='selSearchOption' >
						<option value='A'>제목+내용</option>
						<option value='T'>제목</option>
						<option value='C'>내용</option>
					</select>		
					<input id='txtKeyWord' />
					<button type='button' id="searchbtn" ><img src="<%= request.getContextPath()%>/webimage/search.jpg"></button>
				</div>
				<form>
				<div class="div3">
					<table border="0" id ="trTable" width="100%">
						<tr>
							<td width="5%">No</td>
							<td class="left"  width="40%">제목</td>
							<td width="10%">작성자</td>
							<td width="20%">작성일</td>
							<td width="10%">조회수</td>
							<td width="13%">첨부파일</td>
						</tr>
						<%for (NoticeVo nv : alist) {%>
						<tr>
							<td style="display:none;"><input type="hidden" value="<%=nv.getNcategory()%>"></td>
							<td width="5%"><%=nv.getNidx() %></td>
							<td class="left"  width="40%"><a href="<%=request.getContextPath()%>/Notice/noticedetail.do?nidx=<%=nv.getNidx()%>"><%=nv.getNsubject() %></a></td>
							<td width="10%"><%=nv.getNwriter() %></td>
							<td width="20%"><%=nv.getNwriteday() %></td>
							<td width="10%"><%=nv.getNhit() %></td>
							<td width="13%">
								<%if(nv.getNfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
								<%=nv.getNfile() %>
								<%} %>
							</td>
						</tr>
						<% } %>										
					</table>		
				</div>		
				<table id="divPaging">
						<tr>
							<td>
								<%if (pm.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Notice/notice.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Notice/notice.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm.isNext()&& pm.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Notice/notice.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>
			</section>
			<section id="content2">
				<p id="ptag">
				<form>
				<div id="div2">
					<select id='selSearchOption' >
						<option value='A'>제목+내용</option>
						<option value='T'>제목</option>
						<option value='C'>내용</option>
					</select>	
					<input id='txtKeyWord' />
					<button type='button' id="searchbtn" ><img src="<%= request.getContextPath()%>/webimage/search.jpg"></button>
				</div>	
				<table border="0" id ="trTable" width="100%">
				<thead>
				<tr>
					<td width="5%">No</td>
					<td class="left"  width="40%">제목</td>
					<td width="10%">작성자</td>
					<td width="20%">작성일</td>
					<td width="10%">조회수</td>
					<td width="13%">첨부파일</td>
				</tr>
				<%for (NoticeVo nv : alistuse) {%>
						<tr>
							<td style="display:none;"><input type="hidden" value="<%=nv.getNcategory()%>"></td>
							<td width="5%"><%=nv.getNidx() %></td>
							<td class="left"  width="40%"><a href="<%=request.getContextPath()%>/Notice/noticedetail.do?nidx=<%=nv.getNidx()%>"><%=nv.getNsubject() %></a></td>
							<td width="10%"><%=nv.getNwriter() %></td>
							<td width="20%"><%=nv.getNwriteday() %></td>
							<td width="10%"><%=nv.getNhit() %></td>
							<td width="13%">
								<%if(nv.getNfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
								<%=nv.getNfile() %>
								<%} %>
							</td>
						</tr>
						<% } %>				
				</table>				
			<table id="divPaging">
						<tr>
							<td>
								<%if (pm.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Notice/notice.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Notice/notice.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm.isNext()&& pm.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Notice/notice.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>	
			</section>
			<section id="content3">
				<p id="ptag">
				<form>
				<div id="div2">
					<select id='selSearchOption' >
						<option value='A'>제목+내용</option>
						<option value='T'>제목</option>
						<option value='C'>내용</option>
					</select>	
					<input id='txtKeyWord' />
					<button type='button' id="searchbtn" ><img src="<%= request.getContextPath()%>/webimage/search.jpg"></button>
				</div>
				<table border="0" id ="trTable" width="100%">
				<thead>
				<tr>
					<td width="5%">No</td>
					<td class="left"  width="40%">제목</td>
					<td width="10%">작성자</td>
					<td width="20%">작성일</td>
					<td width="10%">조회수</td>
					<td width="13%">첨부파일</td>
				</tr>
				<%for (NoticeVo nv : alistevent) {%>
						<tr>
							<td style="display:none;"><input type="hidden" value="<%=nv.getNcategory()%>"></td>
							<td width="5%"><%=nv.getNidx() %></td>
							<td class="left"  width="40%"><a href="<%=request.getContextPath()%>/Notice/noticedetail.do?nidx=<%=nv.getNidx()%>"><%=nv.getNsubject() %></a></td>
							<td width="10%"><%=nv.getNwriter() %></td>
							<td width="20%"><%=nv.getNwriteday() %></td>
							<td width="10%"><%=nv.getNhit() %></td>
							<td width="13%">
								<%if(nv.getNfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
								<%=nv.getNfile() %>
								<%} %>
							</td>
						</tr>
						<% } %>
				</table>
				<table id="divPaging">
						<tr>
							<td>
								<%if (pm.isPrev() == true) {%>
								<a href="<%=request.getContextPath()%>/Notice/notice.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">◀</a>
								<% } %>
							</td>
							<td>
								<%for (int i=pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
								<a href="<%=request.getContextPath() %>/Notice/notice.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>"><%=i%></a>		
								<% } %>				
							</td>
							<td>
								<%if(pm.isNext()&& pm.getEndPage() >0) %>
								<a href="<%=request.getContextPath() %>/Notice/notice.do?page=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword()) %>">▶</a>
							</td>
						</tr>	
					</table>
				</form>
			</section>
			</div>
		</section>
		<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
		<footer>
			<!-- footer hr -->
			<hr class="hr02">
			<!-- footer 로고 -->
			<div class="footerdiv">
				<div>
					<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
				</div>
				<!-- footer 링크 -->
				<div class="fer01">	
					<ul>
						<li style="margin:3%;">
							<a href="#" class="fera"><h5>회사소개</h5></a>
						</li>	
						<li style="margin:3%;">	
							<a href="#" class="fera"><h5>개인정보처리방침</h5></a>
						</li>
						<li style="margin:3%;">	
							<a href="#" class="fera"><h5>사업자 정보 확인</h5></a>
						</li>
					</ul>
				</div>
				<!-- footer 홈페이지정보 -->
				<div class="fer02">
					㈜ 에듀픽<br/>
					주소 : 전라북도 전주시<br/>
					대표조장 : 김학림 | 사업자등록번호 : 498-65-65421
				</div>
				<!-- footer 전화번호 -->
				<div class="ct01">
					고객센터 : 1577-8888<br/>
					<p/>
					근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>
					점심시간 : PM12 :00 ~ PM 1 : 00<br/>
					고객센터 : AM 10: 00 ~ PM6 : 00<br/>
				</div>
			</div>
		</footer>
	</body>
</html>