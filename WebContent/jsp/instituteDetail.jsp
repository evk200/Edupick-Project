<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>  
    

<%	ArrayList<CourseVo> alist = (ArrayList<CourseVo>)request.getAttribute("alist");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	InstituteVo iv = (InstituteVo)request.getAttribute("iv");
	ArrayList<ReviewVo> alistm = (ArrayList<ReviewVo>)request.getAttribute("alistm");
	ArrayList<CommunityVo> alist129 = (ArrayList<CommunityVo>)request.getAttribute("alist129");
%>
<%  
   String loginname = (String)session.getAttribute("loginname");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원찾기상세보기</title>
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 기본틀 css -->
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<!-- 제이쿼리 -->
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<!-- top 위로올리기 -->
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<!-- 메인 css -->
		<link href="<%= request.getContextPath() %>/css/edupickmain.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<!-- 검색 css js -->
		<link href="<%= request.getContextPath() %>/css/edupicksearch.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/edupicksearch.js"></script>
		<link href="<%= request.getContextPath() %>/css/instituteDetail.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/instituteDetail.js"></script>
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;">
		<header>
			<!-- 메인로고 -->
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<div class="logoutdiv">
				<%=loginname %> <a href="#">로그아웃</a><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:10%; height:10%;">
			</div>
			<div id="topmenumain">
				<ul>
					<li>
						<a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua" style="background:#FA5858">학원찾기</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua">공지사항</a>
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
		<div class="main">
			<h1><%=iv.getIname() %></h1>
			<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
			<label for="tab1">학원정보</label>

			<input id="tab2" type="radio" name="tabs">
			<label for="tab2">진행중인 강의</label>
			
			<input id="tab3" type="radio" name="tabs">
			<label for="tab3">한줄 수강평</label>
			
			<input id="tab4" type="radio" name="tabs">
			<label for="tab4">학원커뮤니티</label>
			
			
			<section id="content1">
			<div id="main1">
				<p>
				<p>	
						
				<div id="img11">
					<img src="<%= request.getContextPath() %>/filefolder/<%=iv.getIfile() %>" width="350px" height="250px">
					<div id="table1">
						<table id="table1" width="400px" height="400px">
							<tr>
								<td width="20%">학원명</td>
								<td width="50%"><%=iv.getIname() %></td>
							</tr>
							<tr>
								<td>학원위치</td>
								<td><%=iv.getIjibunaddr() %><br><%=iv.getIdetailaddr() %></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><%=iv.getItel() %></td>
							</tr>
							<tr>
								<td>개설과목</td>
								<td><%=iv.getIsubjects() %></td>
							</tr>
							<tr>
								<td>편의사항</td>
								<td><%=iv.getIneeds() %></td>
							</tr>
						</table>
					</div>
					<p>	
				</div>				
				<hr class="hr1" width="420" color="gray" noshade/>
			</div>
			<hr class="hr2" width="800" color="gray" noshade/>

			</section>
				
			<section id="content2">
				<p>
								
				<table border="0" id ="trTable" width="100%">
					<thead>
						<tr>
							<td width="2%">번호</td>
							<td class="left"  width="45%">수강명</td>
							<td width="10%">수강비</td>
							<td width="10%">수강시간</td>
							<td width="23%">수강기간</td>
							
						</tr>
					</thead>
					<tbody >
						<%for (CourseVo cv : alist) {%>
						<tr>
							<td width="15%"><%= pm.getTotalCount() -((alist.indexOf(cv)+1)+(pm.getScri().getPage()-1)*pm.getScri().getPerPageNum())+1 %></td>
							<td class="left"  width="45%"><a href="<%=request.getContextPath()%>/Institute/CourseDetail.do?cidx=<%=cv.getCidx()%>&iidx=<%=iv.getIidx()%>"><%=cv.getCname() %></a></td>
							<td width="10%"><%=cv.getCprice() %></td>
							<td width="10%"><%=cv.getCtime() %></td>
							<td width="10%"><%=cv.getCperiod() %></td>
						</tr>
						<%} %>
					</tbody>
				</table>			
			</section>
			
			<section id="content3">
				<div class="content3_main">
					<%for (ReviewVo rv : alistm) {%>
					<div>
						<%=rv.getRcontent() %><br>
						<%=rv.getRwriter() %><br>
						<%=rv.getRwriteday() %>
					</div>					
					<%} %>
				</div>
				<a href="/edupick/Institute/InstituteReview.do?iidx=<%=iv.getIidx()%>"><button type="button" id="content3_btn">작성하기</button></a>
			</section>
			
			<section id="content4">
				<h3>무엇이든 물어보세요!</h3>
				<hr color=blue;>
				<p>		
				<table border="0" id ="trTable" width="100%">
					<thead>
						<tr>
							<td width="10%">번호</td>
							<td class="left"  width="45%">제목</td>
							<td width="10%">작성자</td>
							<td width="30%">작성날짜</td>
						</tr>
					</thead>
					<tbody >
						<%for (CommunityVo civ : alist129) {%>
						<tr>
							<td width="10%"><%=civ.getCoidx() %></td>
							<td class="left"  width="45%"><a href="/edupick/Institute/progresslecture.do?coidx=<%=civ.getCoidx()%>"><%=civ.getCosubject() %></a></td>
							<td width="30%"><%=civ.getCowrite() %></td>
							<td width="10%"><%=civ.getCowriteday() %></td>
						</tr>
						<%} %>
					</tbody>
				</table>
					
				<p>
				<hr color=blue;>
				
					
				<a href="/edupick/Institute/CommunityWrite.do?iidx=<%=iv.getIidx()%>"><button id = "b2">작성하기</button></a>	
					
				<div id="divPaging">
					<div>◀</div></a>
					<div><a href="#"><b>1</b></div></a>
					<div><a href="#">2</div></a>
					<div><a href="#">3</div></a>
					<div><a href="#">4</div></a>
					<div><a href="#">5</div></a>
					<div>▶</div></a>
				</div>
			</section>
					
		</div>	
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