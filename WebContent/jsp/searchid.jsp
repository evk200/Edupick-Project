<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%@ page import="controller.*" %>
<%  
	String mlid = (String)request.getAttribute("mlid");
	System.out.println("확인: " + mlid);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디찾기완료</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/findidpwd.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="malo">
				<img src="<%= request.getContextPath() %>/webimage/edupick2.jpg">
			</div>
			<p/>
		</header>
		<form>
			<div name="mlid">회원님의 아이디는"<%= mlid %> "입니다.</div>
		</form>
	</body>
</html>