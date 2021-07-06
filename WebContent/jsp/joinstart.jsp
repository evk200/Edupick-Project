<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<link href="<%= request.getContextPath() %>/css/joinstart.css" rel="stylesheet" type="text/css" />	
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/error.css" rel="stylesheet" type="text/css" />	
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;">                            
		<header>
			<meta name="viewport" content="width=device-width,initial-scale=1">
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
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
		<section>
			<article>
				<div class="h1_1">
					<h1 id="h1_1">회원가입</h1>
				</div>
				<div class="widthdiv">
					<div class="div01">
						<div class="div01_01">
							<a href="<%= request.getContextPath() %>/Member/memberAgree.do" id="a1">
								<img id="img01_01"src="<%= request.getContextPath() %>/webimage/join1.jpg">
							</a>
						</div>
						<div class="div01_02">
							<a href="<%= request.getContextPath() %>/Licensee/licenseeAgree.do" id="a2">
								<img id="img01_02" src="<%= request.getContextPath() %>/webimage/join2.jpg">
							</a>
						</div>
					</div>	
				</div>
			</article>
		</section>
		<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
		<button onclick="topFunction()" id="scrollTopBtnMob" title="Go to top">모바일 Top 버튼</button>
		<footer>
			<hr class="hr02">
				<div class="footerdiv">
					<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
				</div>
				<div class="fer01">	
					<ul>
						<li style="margin:3%;">
							<a href="#"><h5>회사소개</h5></a>
						</li>	
						<li style="margin:3%;">	
							<a href="#"><h5>개인정보처리방침</h5></a>
						</li>
						<li style="margin:3%;">	
							<a href="#"><h5>사업자 정보 확인</h5></a>
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
		</footer>
	</body>
</html>