<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%  
	String loginname = (String)session.getAttribute("loginname");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<title>EduPick 학원검색 | 학원찾기</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/banner.css" rel="stylesheet" type="text/css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<link href="<%= request.getContextPath() %>/css/edupickmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/edupickla.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<!-- 검색 css js -->
		<link href="<%= request.getContextPath() %>/css/edupicksearch.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/edupicksearch.js"></script>
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;"> 
		<header>
			<!-- 메인로고 -->
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<!-- 검색 폼 -->
			<form class="frmsh">
				<!-- 검색박스 -->
				<div class="search01">
					<input type="text" id="input01" placeholder="검색어를 입력해주세요.">
						<div id="option01">연령</div>
						<div id="option02">지역</div>
						<div id="option03">과목</div>
					<button type="button" id="btn01"><img id="img4" src="<%= request.getContextPath() %>/webimage/search.jpg" ></button>
				</div>
				<!-- 연령 -->
				<div class="agemain">
					<h3>연령</h3>
					<p id="age1">초등학생</p>
					<p id="age2">중학생</p>
					<p id="age3">고등학생</p>
					<p id="age4">성인</p>
				</div>
				<!-- 지역 -->
				<div class="areamain">
					<div class="areaname">
						<h3>지역</h3>
						<p id="an1">서울</p>
						<p id="an2">경기</p>
						<p id="an3">인천</p>
						<p id="an4">부산</p>
						<p id="an5">대구</p>
						<p id="an6">광주</p>
						<p id="an7">대전</p>
						<p id="an8">울산</p>
						<p id="an9">세종</p>
						<p id="an10">강원</p>
						<p id="an11">경남</p>
						<p id="an12">경북</p>
						<p id="an13">전남</p>
						<p id="an14">전북</p>
						<p id="an15">충남</p>
						<p id="an16">충북</p>
						<p id="an17">제주</p>
					</div>
					<ul id="firstarea">
						<li id="area1">
							<ul id="area_1">
								<li>강남구</li>
								<li>강동구</li>
								<li>강북구</li>
								<li>강서구</li>
								<li>관악구</li>
								<li>광진구</li>
								<li>구로구</li>
								<li>금천구</li>
								<li>노원구</li>
								<li>도봉구</li>
								<li>동대문구</li>
								<li style="margin-left:34px;">동작구</li>
								<li style="margin-left:56px;">마포구</li>
								<li style="margin-left:50px;">서대문구</li>
								<li style="margin-left:40px;">서초구</li>
								<li>성동구</li>
								<li>성북구</li>
								<li>송파구</li>
								<li>양천구</li>
								<li style="margin-left:40px;">영등포구</li>
								<li style="margin-left:50px;">용산구</li>
								<li>은평구</li>
								<li>종로구</li>
								<li>중구</li>
								<li style="margin-left:49px;">중랑구</li>
							</ul>
						</li>
						<li id="area2">
							<ul id="area_2">
								<li>가평군</li>
								<li>고양시</li>
								<li>고양시 덕양구</li>
								<li>고양시 일산동구</li>
								<li>고양시 일산서구</li>
								<li>과천시</li>
								<li>광명시</li>
								<li>광주시</li>
								<li style="margin-left:35px;">구리시</li>
								<li style="margin-left:35px;">군포시</li>
								<li style="margin-left:35px;">김포시</li>
								<li style="margin-left:35px;">남양주시</li>
								<li>동두천시</li>
								<li style="margin-left:34px;">부천시</li>
								<li>부천시 소사구</li>
								<li style="margin-left:34px;">부천시 오정구</li>
								<li style="margin-left:34px;">부천시 원미구</li>
								<li style="margin-left:34px;">성남시</li>
								<li>성남시 분당구</li>
								<li>성남시 수정구</li>
								<li>성남시 중원구</li>
								<li>수원시</li>
								<li style="margin-left:34px;">수원시 권선구</li>
								<li style="margin-left:34px;">수원시 영통구</li>
								<li style="margin-left:34px;">수원시 장안구</li>
								<li style="margin-left:50px;">수원시 팔달구</li>
								<li style="margin-left:50px;">시흥시</li>
								<li style="margin-left:34px;">안산시</li>
								<li style="margin-left:34px;">안산시 단원구</li>
								<li style="margin-left:34px;">안산시 상록구</li>
								<li style="margin-left:34px;">안성시</li>
								<li style="margin-left:34px;">안양시</li>
								<li style="margin-left:34px;">안양시 동안구</li>
								<li>안양시 만안구</li>
								<li style="margin-left:34px;">양주시</li>
								<li style="margin-left:34px;">양평군</li>
								<li style="margin-left:34px;">여주시</li>
								<li style="margin-left:34px;">연천군</li>
								<li style="margin-left:34px;">오산시</li>
								<li style="margin-left:34px;">용인시</li>
								<li style="margin-left:34px;">용인시 기흥구</li>
								<li>용인시 수지구</li>
								<li>용인시 처인구</li>
								<li>의왕시</li>
								<li>의정부시</li>
								<li style="margin-left:34px;">이천시</li>
								<li>파주시</li>
								<li>평택시</li>
								<li>포천시</li>
								<li>하남시</li>
								<li>화성시</li>
							</ul>
						</li>
						<li id="area3">
							<ul id="area_3">
								<li>강화군</li>
								<li>계양구</li>
								<li>남동구</li>
								<li>동구</li>
								<li>미추홀구</li>
								<li>부평구</li>
								<li>서구</li>
								<li>연수구</li>
								<li>옹진군</li>
								<li>중구</li>
							</ul>
						</li>
						<li id="area4">
							<ul id="area_4">
								<li>강서구</li>
								<li>금정구</li>
								<li>기장군</li>
								<li>남구</li>
								<li>동구</li>
								<li>동래구</li>
								<li>부산진구</li>
								<li>북구</li>
								<li style="margin-left:50px;">사상구</li>
								<li>사하구</li>
								<li>서구</li>
								<li style="margin-left:64px;">수영구</li>
								<li style="margin-left:34px;">연제구</li>
								<li style="margin-left:34px;">영도구</li>
								<li style="margin-left:54px;">중구</li>
								<li>해운대구</li>
							</ul>
						</li>
						<li id="area5">
							<ul id="area_5">
								<li>남구</li>
								<li>달서구</li>
								<li>달성군</li>
								<li>동구</li>
								<li>북구</li>
								<li>서구</li>
								<li>수성구</li>
								<li>중구</li>
							</ul>
						</li>
						<li id="area6">
							<ul id="area_6">
								<li>광산구</li>
								<li>남구</li>
								<li>동구</li>
								<li>북구</li>
								<li>서구</li>
							</ul>
						</li>
						<li id="area7">
							<ul id="area_7">
								<li>대덕구</li>
								<li>동구</li>
								<li>서구</li>
								<li>유성구</li>
								<li>중구</li>
							</ul>
						</li>
						<li id="area8">
							<ul id="area_8">
								<li>남구</li>
								<li>동구</li>
								<li>북구</li>
								<li>울주군</li>
								<li>중구</li>
							</ul>
						</li>
						<li id="area9">
							<ul id="area_9">
								<li>세종특별자치시</li>
							</ul>
						</li>
						<li id="area10">
							<ul id="area_10">
								<li>강릉시</li>
								<li>고성군</li>
								<li>동해시</li>
								<li>삼척시</li>
								<li>속초시</li>
								<li>양구군</li>
								<li>양양군</li>
								<li>영월군</li>
								<li>원주시</li>
								<li>인제군</li>
								<li>정선군</li>
								<li>철원군</li>
								<li>춘천시</li>
								<li>태백시</li>
								<li>평창군</li>
								<li>홍천군</li>
								<li>화천군</li>
								<li>횡성군</li>
							</ul>
						</li>
						<li id="area11">
							<ul id="area_11">
								<li>거제시</li>
								<li>거창군</li>
								<li>고성군</li>
								<li>김해시</li>
								<li>남해군</li>
								<li>밀양시</li>
								<li>사천시</li>
								<li>산청군</li>
								<li>양산시</li>
								<li>의령군</li>
								<li>진주시</li>
								<li>창녕군</li>
								<li>창원시</li>
								<li>창원시 마산합포구</li>
								<li>창원시 마산회원구</li>
								<li>창원시 성산구</li>
								<li>창원시 의창구</li>
								<li>창원시 진해구</li>
								<li>통영시</li>
								<li>하동군</li>
								<li>함안군</li>
								<li>함양군</li>
								<li>합천군</li>
							</ul>
						</li>
						<li id="area12">
							<ul id="area_12">
								<li>경산시</li>
								<li>경주시</li>
								<li>고령군</li>
								<li>구미시</li>
								<li>군위군</li>
								<li>김천시</li>
								<li>문경시</li>
								<li>봉화군</li>
								<li>상주시</li>
								<li>성주군</li>
								<li>안동시</li>
								<li>영덕군</li>
								<li>영양군</li>
								<li>영주시</li>
								<li>영천시</li>
								<li>예천군</li>
								<li>울릉군</li>
								<li>울진군</li>
								<li>의성군</li>
								<li>청도군</li>
								<li>청송군</li>
								<li>칠곡군</li>
								<li>포항시</li>
								<li>포항시 남구</li>
								<li>포항시 북구</li>
							</ul>
						</li>
						<li id="area13">
							<ul id="area_13">
								<li>강진군</li>
								<li>고흥군</li>
								<li>곡성군</li>
								<li>광양시</li>
								<li>구례군</li>
								<li>나주시</li>
								<li>담양군</li>
								<li>목포시</li>
								<li>무안군</li>
								<li>보성군</li>
								<li>순천시</li>
								<li>신안군</li>
								<li>여수시</li>
								<li>영광군</li>
								<li>영암군</li>
								<li>완도군</li>
								<li>장성군</li>
								<li>장흥군</li>
								<li>진도군</li>
								<li>함평군</li>
								<li>해남군</li>
								<li>화순군</li>
							</ul>
						</li>
						<li id="area14">
							<ul id="area_14">
								<li>고창군</li>
								<li>군산시</li>
								<li>김제시</li>
								<li>남원시</li>
								<li>무주군</li>
								<li>부안군</li>
								<li>순창군</li>
								<li>완주군</li>
								<li>익산시</li>
								<li>임실군</li>
								<li>장수군</li>
								<li>전주시</li>
								<li>전주시 덕진구</li>
								<li>전주시 완산구</li>
								<li>정읍시</li>
								<li>진안군</li>
							</ul>
						</li>
						<li id="area15">
							<ul id="area_15">
								<li>계룡시</li>
								<li>공주시</li>
								<li>금산군</li>
								<li>논산시</li>
								<li>당진시</li>
								<li>보령시</li>
								<li>부여군</li>
								<li>서산시</li>
								<li>서천군</li>
								<li>아산시</li>
								<li>연기군</li>
								<li>예산군</li>
								<li>천안시</li>
								<li>천안시 동남구</li>
								<li>천안시 서북구</li>
								<li>청양군</li>
								<li>태안군</li>
								<li>홍성군</li>
							</ul>
						</li>
						<li id="area16">
							<ul id="area_16">
								<li>괴산군</li>
								<li>단양군</li>
								<li>보은군</li>
								<li>영동군</li>
								<li>옥천군</li>
								<li>음성군</li>
								<li>제천시</li>
								<li>증평군</li>
								<li>진천군</li>
								<li>청원군</li>
								<li>청주시</li>
								<li>청주시 상당구</li>
								<li>청주시 서원구</li>
								<li>청주시 청원구</li>
								<li>청주시 흥덕구</li>
								<li>충주시</li>
							</ul>
						</li>
						<li id="area17">
							<ul id="area_17">
								<li>서귀포시</li>
								<li>제주시</li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- 과목 -->
				<div class="subjectmain">
					<h3>과목</h3>
					<p id="subject1">국어</p>
					<p id="subject2">수학</p>
					<p id="subject3">영어</p>
					<p id="subject4">사회</p>
					<p id="subject5">과학</p>
					<p id="subject6">음악</p>
					<p id="subject7">미술</p>
					<p id="subject8">체육</p>
					<p id="subject9">컨설팅</p>
					<p id="subject10">논술</p>
					<p id="subject11">재수</p>
					<p id="subject12">종합</p>
					<p id="subject13">제2외국어</p>
				</div>
			</form>
			<!-- header top hr -->
			<hr class="hr03" style="border:1px solid #BDBDBD;" role="presentation" />
			<!-- hr 안에 메뉴 -->
			<div id="topmenumain">
				<ul id="topmenu">
					<li style="margin-left:-5%;">
						<a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua">학원찾기</a>
					</li>
					<li style="margin-left:10%;">
						<a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua">공지사항</a>
					</li>
					<li style="margin-left:10%;">
						<a href="<%= request.getContextPath() %>/Eduinformation/eduinformation.do" class="menua">교육정보</a>
					</li>
					<li style="margin-left:10%;">
						<a href="<%= request.getContextPath() %>/Customerservice/customerservice.do" class="menua">고객센터</a>
					</li>
					<li style="margin-left:10%;">
						<a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua">My 서비스</a>
					</li>
				</ul>
			</div>
			<!-- header bottom hr -->
			<hr class="hr01" style="border:1px solid #F2F2F2;"/>
		</header>
		<section>
			<article>
				<div class="imgbanner">
					<img src="<%= request.getContextPath() %>/webimage/thief.png" id="img5">
				</div>
				<div class="loginafter">
					<div class="lofer1">
						<img src="<%= request.getContextPath() %>/webimage/user.png" name = loginname id="userimg1"><%=loginname %> 님 <img src="<%= request.getContextPath() %>/webimage/login4.jpg" id="userimg2">
						
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/Common/logout.do'" style="background:white;">로그아웃</button><br>
						
						<a href="<%= request.getContextPath() %>/Common/modify.do" id="modify">회원정보 수정</a><img src="<%= request.getContextPath() %>/webimage/login3.jpg" style="width:10%; height:10%;">
					</div>
					<div class="lofer2">
						<div class="mypoint">Mypoint</div><img src="<%= request.getContextPath() %>/webimage/point.png" style="width:7%; height:7%; float:right; margin-top:-25px;">
					</div>
					<div class="lofer3">
						<a href="#" id="logalink">수강중</a>
					</div>
					<div class="lofer3_2">
						<a href="#" id="logalink">장바구니</a>
					</div>
					<div class="lofer3_3">
						<a href="#" id="logalink">찜</a>
					</div>
				</div>
				<div class="subbanner_main">
					수강생들이 Pick한 Hot Place
					<img id="img9" src="<%= request.getContextPath() %>/webimage/com.png">
				</div>
				<div class="quizdiv">
					<a href="#" onclick="window.open('Quiz.html','window','width=580,height=300,left=670,top=400,resizable=no,scrollbars=no');return false"><img src="quiz.png" style="width:30%; height:3%;">오늘의 퀴즈</a>
				</div>
				<div class="subbanner">
				<div class="slideshow-container">
					<div class="mySlides fade">
						<div class="numbertext">1 / 3</div>
						<img src="<%= request.getContextPath() %>/webimage/banner1.jpg" style="width:800px; height:500px;">
						<div class="text"></div>
					</div>
					<div class="mySlides fade">
						<div class="numbertext">2 / 3</div>
						<img src="<%= request.getContextPath() %>/webimage/banner2.jpg" style="width:800px; height:500px;">
						<div class="text"></div>
					</div>
					<div class="mySlides fade">
						<div class="numbertext">3 / 3</div>
						<img src="<%= request.getContextPath() %>/webimage/banner3.jpg" style="width:800px; height:500px;">
						<div class="text"></div>
					</div>
				</div>
				<br>
				<div style="text-align:center">
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				</div>
				<div>
			</article>
		</section>
		<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
		<button onclick="topFunction()" id="scrollTopBtnMob" title="Go to top">▲Top</button>
		<footer>
			<hr class="hr02">
				<div class="footerdiv">
					<div>
						<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
					</div>
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
					<div class="fer02">
						㈜ 에듀픽<br/>
						주소 : 전라북도 전주시<br/>
						대표조장 : 김학림 | 사업자등록번호 : 498-65-65421
					</div>
					<div class="ct01">
						고객센터 : 1577-8888<br/>
						<p/>
						근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>
						점심시간 : PM12 :00 ~ PM 1 : 00<br/>
						고객센터 : AM 10: 00 ~ PM6 : 00<br/>
					</div>
				</div>	
		</footer>
		<script src="<%= request.getContextPath() %>/js/banner.js"></script>
	</body>
</html>