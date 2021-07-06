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
<title>수강자 정보입력</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/learnerinformation.css" rel="stylesheet" type="text/css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
		<script src="<%= request.getContextPath() %>/js/learnerinformation.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv" id="infolog"><a href="<%= request.getContextPath() %>/Common/main.do"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></a></div>
				<div class="logdiv"><%=loginname %></div>
				<div class="logdiv2">
				<a href="#">로그아웃</a>
				</div>
			</div>
		</header>
		<form name="frm" id="carfrm">
			<table>
				<tr>
					<td>수강자명 : </td>
					<td><input type="text" name="sname"></td>
				</tr>	
				<tr>
					<td>수강자 연락처 : </td>
					<td><input type="text" name="sphone"></td>
				</tr>
				<tr>
					<td>학원차량 탑승여부 : </td>
					<td><input type="radio" name="sride" checked> O <input type="radio" name="sride"> X</td>
				</tr>
				<tr>
					<td>학원차량 탑승지역 : </td>
					<td><input type="text" name="saddr"></td>
				</tr>
			</table>
			<button type="button" id="lmsp" onclick="imsp()">저장</button>
		</form>
	</body>
</html>