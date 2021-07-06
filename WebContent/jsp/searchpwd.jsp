<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%  
	String mlpwd = (String)request.getAttribute("mlpwd");
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호찾기완료</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/findidpwd.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="malo">
			<img src="<%= request.getContextPath() %>/webimage/edupick2.jpg">
		</div><p/>
		</header>
		<form>
			<div name="mlpwd">회원님의 비밀번호는 "<%= mlpwd %>"입니다.</div>
		</form>
	</body>
</html>