<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String loginname = (String)session.getAttribute("loginname");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
		<!-- 타이틀 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 기본틀 css -->
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<!-- 제이쿼리 -->
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<link href="<%= request.getContextPath() %>/css/cart.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/cart.js"></script>
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
				<%=loginname %>(님) <a href="#">로그아웃</a><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:10%; height:10%;">
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
						<a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua">My 서비스</a>
					</li>
				</ul>
			</div>
		</header>
		<div class="servicemain">
			<div class="box1">
				<h3 style="margin:0;">장바구니</h3>
			</div>
			<p>
			<div class="table1">
				<table class="table2">
					<tr>
						<td width="5%"></td>
						<td width="10%"></td>
						<td width="10%">학원명</td>
						<td width="10%">수강명</td>
						<td width="10%">수강 기간</td>
						<td width="10%">인원</td>
						<td width="12%">상품 가격</td>
						<td width="15%">결제 정보</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="chk"></td>
						<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
						<td></td>
						<td></td>
						<td> </td>
						<td></td>
						<td><button type="button" id="creditbtn20">결제하기</button></td>
						<td><button type="button" id="modifybtn10">수정</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="chk"></td>
						<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
						<td></td>
						<td></td>
						<td> </td>
						<td></td>
						<td><button type="button" id="creditbtn21">결제하기</button></td>
						<td><button type="button" id="modifybtn11">수정</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="chk"></td>
						<td><img src="<%= request.getContextPath() %>/webimage/1.jpg" width="100px" height="75px"></td>
						<td></td>
						<td></td>
						<td> </td>
						<td></td>
						<td><button type="button" id="creditbtn22">결제하기</button></td>
						<td><button type="button" id="modifybtn12">수정</button></td>
					</tr>
				</table>
			</div>
			<div class="text">
				<span id="more" style="CURSOR: hand" onclick="if(story.style.display=='none')
					{story.style.display='';more.innerText='▶접기'} 
					else {story.style.display='none';more.innerText='▶더보기'}">▶더보기</button>
				</span>
			</div>
			<div id="story" style="display: none">텍스트</div>
			<p/>
			<div class="credittext">온라인 결제 : - 원 + 방문결제 : - 원 총결제금액 : - 원</div>
			<p>
			<div class="btn">
				<button class="btn1">결제하기</button>
			</div>
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