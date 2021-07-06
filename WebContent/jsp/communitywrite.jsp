<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>  
<%  
   String loginname = (String)session.getAttribute("loginname");
   InstituteVo iv = (InstituteVo)request.getAttribute("iv");
%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>커뮤니티</title>
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
		<style>
			input[name=cosubject] {
				width:500px;
			}
			input[name=cocontent] {
				width:500px;
				height:300px;
			}
			input[name="cowriter"] {
				width:500px;
			}
			.c1 , .c2 , c3 {
				border:1px solid black;
			}
			form[name=frm] {
				width:800px;
				height:400px;
				position:relative;
				top:500px;
				left:650px;
			}
			
			form[name=frm] > button {
				border: 1px solid black;
				background:white;
				zoom:1.5;
				margin-left:63%;
			}
			footer {
				position:absolute;
				bottom: 0;
				top:1200px;
			}
		</style>
		<script>
		function check(){
			var iidx = document.getElementById("iidx").value;
			
				if (document.frm.cosubject.value == ""){
					alert("제목을 입력하세요.");
					document.frm.cosubject.focus();
					return;
				}if (document.frm.cocontent.value == "") {
					alert("내용을 입력하세요.");
					document.frm.cocontent.focus();
					return;
				}if (document.frm.cowrite.value == "") {
					alert("작성자를 입력하세요.");
					document.frm.cowrite.focus();
					return;
				}
				alert("등록합니다.");
				document.frm.action="<%=request.getContextPath() %>/Institute/CommunityWriteAction.do?iidx="+iidx;
				document.frm.method="post";
				document.frm.enctype="multipart/form-data";
				document.frm.submit();
			}
		
		</script>
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
		<section>
			<form name="frm">
			<input type="hidden" id="iidx" value="<%=iv.getIidx()%>">
				<table>
					<tr>
						<td class="c1">제목</td>
						<td><input type="text" name="cosubject"></td>
					</tr>
					<tr>
						<td class="c2">내용</td>
						<td><input type="text" name="cocontent"></td>
					</tr>
					<tr>
						<td class="c3">작성자</td>
						<td><input type="text" name="cowrite" value="<%=loginname %>"></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="cofile"></td>
					</tr>
				</table>
				<button type="button" onclick="check()">완료</button>
			</form>
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