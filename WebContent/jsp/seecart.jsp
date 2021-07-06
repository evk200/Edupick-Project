<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/seecart.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/seecart.js"></script>
	</head>
	<body>
	
		<h3 class="box1">
			>장바구니 보기</h3>
		<br>
		<hr class="hr1" width="41%" color="red" noshade/>
		<br>
		<h3 class="box2">(수강명)이(가) 강의가 장바구니에 담겼습니다.</h3>
		<h3 class="box3">지금 확인하시겠습니까?</h3>
		<br>
		<hr class="hr1" width="41%" color="red" noshade/>	
		<br>
		<div class="btn">
		<button type="button" class="btn1" onclick="yescan()">예</button>
		<button type="button" class="btn2" onclick="shop()">계속쇼핑</button>
		</div>
	</body>
</html>
