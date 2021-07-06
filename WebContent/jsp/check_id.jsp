<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%> 
<%@ page import="service.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<% String id = (String)request.getAttribute("id"); %>
<% boolean b = (boolean)request.getAttribute("b"); %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>id 중복 검사</title>

</head>

<body>

<b><%=id %></b>

<%

	if(b){

%>

		는(은) 이미  사용중인 아이디 입니다.<p/>

		<a href="#" onclick = "window.close();"><button type="button" style="border:1px solid black; background:white;">확인</button></a>

		<!-- opener : window.open으로 현재 창을 호출한 부모 페이지 -->

<%

	} else {

%>

		는(은) 사용 가능 합니다.<p/>

		<a href="#" onclick = "window.close();"><button type="button" style="border:1px solid black; background:white;">확인</button></a>

<%	} %>

</body>

</html>

