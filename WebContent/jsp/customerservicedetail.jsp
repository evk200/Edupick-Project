<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %> 
<%  
	String mName = (String)request.getAttribute("loginname");
	String lName = (String)request.getAttribute("loginname");
%>
<% CustomerServiceVo cv = (CustomerServiceVo)request.getAttribute("cv"); %>
<% AnswerVo av = (AnswerVo)request.getAttribute("av"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 상세보기</title>
		<!-- 타이틀 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 기본틀 css -->
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<!-- 상세보기 -->
		<link href="<%= request.getContextPath() %>/css/customerservicedetail.css" rel="stylesheet" type="text/css" />
		<!-- 제이쿼리 -->
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;">
		<header>
			<!-- 메인로고 -->
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<div class="logoutdiv" name=loginname>
				<%=session.getAttribute("loginname")%> <a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:10%; height:10%;">
			</div>
			<div id="topmenumain">
				<ul>
					<li>
						<a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua">학원찾기</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua">공지사항</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Eduinformation/eduinformation.do" class="menua">교육정보</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Customerservice/customerservice.do" class="menua" style="background:#FA5858">고객센터</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua">My 서비스</a>
					</li>
				</ul>
			</div>
		</header>
		<section>
			<article class="bodysize">
				<div class="div1">
					<table border="2" width="800px" height="200px">
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th id="th1" width="50%">제목</th>
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
						<tr height="30px">
							<td><%= cv.getCidx() %></td>
							<td><%= cv.getCwriter() %></td>
							<td><%= cv.getCsubject() %></td>
							<td><%= cv.getCwriteday() %></td>
							<td><%= cv.getChit() %></td>
						</tr>
						<tr>
							<td colspan="5" height="300px"><%= cv.getCcontent() %></td>		
						</tr>
						<tr>
							<td id="td1">첨부파일</td>
						<td colspan="4">
							<%if(cv.getCfile() == null) {
									out.println("파일이 없습니다.");
								} else {%>
							<%=cv.getCfile() %>
							<%} %>
							<%if (cv.getCfile() == null) { 
								out.print(""); 
							} else { %>
								<a href="<%=request.getContextPath()%>/Admin2/fileDownload.do?Nfile=<%= cv.getCfile()%>">
								<b>다운로드</b>
							</a>
							<%} %>
						</td>
						</tr>
					</table>
				</div>
				<p>
				<p>	
				<%if (cv.getCcategory().equals("qna")) {%>
				<div class="div3">
					<table id="t3" border="2" width="800px">
						<tr id="tr2">
							<td height="20px" id = "td6" >Edupick님의 답변</td>
						</tr>
						<tr>
							<td height="300px"><%if(av == null) {  							
							out.print("답변이 없습니다."); 	}else {%>							
							<%= av.getCanswer() %>
							<% } %>
							</td>
						</tr>
					</table>
				</div>
				<%}else { %>
				
				<%} %>
			</article>	
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