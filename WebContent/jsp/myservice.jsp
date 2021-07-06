<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>      
<%  
	String loginname = (String)session.getAttribute("loginname");
%>    
<%	ArrayList<PaymentinfoVo> alistmy = (ArrayList<PaymentinfoVo>)request.getAttribute("alistmy");
	PageMaker pm = (PageMaker)request.getAttribute("pm");	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my서비스</title>
		<!-- 타이틀 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 기본틀 css -->
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<!-- 제이쿼리 -->
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/myservice.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<script src="<%= request.getContextPath() %>/js/myservice.js"></script>
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
						<a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua">학원찾기</a>
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
						<a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua" style="background:#FA5858">My 서비스</a>
					</li>
				</ul>
			</div>
		</header>
		<div class="service_z">
			<div class="servicemain">
				<div class="box1">
					<h3 style="margin:0;">수강중인 강의</h3>
				</div>
				<p>
				<div class="table1">
					<table class="table2">
						<tr>
							<td width="5%">번호</td>
							<td width="10%">학원이미지</td>
							<td width="10%">학원명</td>
							<td width="10%">수강명</td>
							<td width="10%">수강 기간</td>
							<td width="10%">수강비</td>
							<td width="12%">학원 페이지</td>
						</tr>					
						<% for(PaymentinfoVo piv : alistmy){ %>
						<tr>
							<td><%=piv.getPiidx() %></td>	
							<td><img src="<%=request.getContextPath()%>/filefolder/s-<%=piv.getIfile()%>"></td>
							<td><%=piv.getIname() %></td>
							<td class="left"><%=piv.getCname() %></td>					
							<td><%=piv.getCtime() %></td>
							<td><%=piv.getCprice() %>원</td>	
							<td><button type="button" id="inpage2"><a href="<%= request.getContextPath()%>/Institute/instituteDetail.do?iidx=<%=piv.getIidx()%>">학원 상세페이지</a></button></td>
						</tr>
						<%} %>
						<%-- <tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td> </td>
							<td></td>
							<td><button type="button" id="inpage2">학원 상세페이지</button></td>
							<td><button type="button" id="creditbtn16">결제방법 변경 및 결제</button></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td> </td>
							<td></td>
							<td><button type="button" id="inpage3">학원 상세페이지</button></td>
							<td><button type="button" id="creditbtn17">결제방법 변경 및 결제</button></td>
						</tr> --%>
					</table>
				</div>
				<%-- <div id="story" style="display: none">
					<table class="table2">
						<tr>
							<td width="5%"><input type="checkbox" id="chk"></td>
							<td width="10%"><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td width="10%"></td>
							<td width="10%"></td>
							<td width="10%"> </td>
							<td width="10%"></td>
							<td width="12%"><button type="button" id="inpage1">학원 상세페이지</button></td>
							<td width="15%"><button type="button" id="creditbtn15">결제방법 변경 및 결제</button></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td> </td>
							<td></td>
							<td><button type="button" id="inpage2">학원 상세페이지</button></td>
							<td><button type="button" id="creditbtn16">결제방법 변경 및 결제</button></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td> </td>
							<td></td>
							<td><button type="button" id="inpage3">학원 상세페이지</button></td>
							<td><button type="button" id="creditbtn17">결제방법 변경 및 결제</button></td>
						</tr>
					</table>
				</div>
				<p>
				<div class="text">
					<span id="more" style="CURSOR: pointer" onclick="if(story.style.display=='none')
						{story.style.display='block';more.innerText='▶접기'} 
						else {story.style.display='none';more.innerText='▶접기'}">▶더보기</button>
					</span>
				</div> --%>
				<div class="btn">
					<button class="btn1">쇼핑 계속하기</button>
					<!-- <button class="btn2">주문하기</button> -->	
				</div>
			</div>
			
			<%-- <div class="servicemain">
				<div class="box1">
					<h3 style="margin:0;">최근 결제내역</h3>
				</div>
				<p>
				<div class="table1">
					<table class="table2">
						<tr>
							<td width="5%"></td>
							<td width="10%"></td>
							<td width="20%">학원명</td>
							<td width="25%">수강명</td>
							<td width="20%">결제일</td>
							<td width="20%">결제금액</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div id="story2" style="display: none">
					<table class="table2">
						<tr>
							<td width="5%"><input type="checkbox" id="chk"></td>
							<td width="10%"><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td width="20%"></td>
							<td width="25%"></td>
							<td width="20%"></td>
							<td width="20%"></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk"></td>
							<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<p/>
				
			</div> --%>
			
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