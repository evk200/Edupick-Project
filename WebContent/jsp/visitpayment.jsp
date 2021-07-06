<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>
<%  
   String loginname = (String)session.getAttribute("loginname");
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문결제</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/visitpayment.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/visitpayment.js"></script>
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><a href="<%= request.getContextPath() %>/jsp/main.do"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></a></div>
				<div class="logdiv"><%=loginname %></div>
				<div class="logdiv2">
				<a href="#">로그아웃</a>
				</div>
			</div>
		</header>
		<section>
			<article>
				<form class="visitfrm">
					<div class="visitdiv">
					<ul>
						<li id="visitdate">날짜</li>
						<li id="visitdate2"><input type="date" name="inputaline" value="" ></li>						
					</ul>
					<ul>
						<li>시간</li>
						<li><input type="time" name="inputaline" value="" ></li>
					</ul>
					<ul>
						<li>결제방법</li>
						<li><input type="radio" name="radio1" >카드결제 <input type="radio" name="radio1" checked >현금결제</li>
					</ul>
					<ul>
						<li>대리인 방문</li>
						<li><input type="radio" name="yn" checked >예 <input type="radio" name="yn" >아니오</li>
					</ul>
					<ul>
						<li>대리인 성함</li>
						<li><input name="inputaline" value="" ></li>
					</ul>
					<ul>
						<li>대리인 연락처</li>
						<li><input name="inputaline" value="" ></li>
					</ul>
					<ul>
						<li>관계</li>
						<li><input name="inputaline" value="" ></li>
					</ul>
					</div>
					<button type="button" id="visitbtn011" onclick="visitbtn()">저장</button>
				</form>
			</article>
		</section>
	</body>
</html>