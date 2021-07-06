<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<title>로그인</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Song+Myung&display=swap" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/css/loginForm.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/login.js"></script>
		<script src="<%= request.getContextPath() %>/js/loginaction.js"></script>
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<h1>로그인</h1>
	<div class="main">
	<form name="loginFrm" method="post" action="/edupick/Common/loginAction.do">
	<input type="hidden" name="type" value="M">
	
		<input id="tab1" type="radio" name="tabs"  value="member" checked> <!--디폴트 메뉴-->
		<label for="tab1">개인</label>
		<input id="tab2" type="radio" name="tabs" value="licensee">
		<label for="tab2">사업자</label>
		
			<section id="content1">
				<div id="onejoin1">					
						
						<div class="d2">&nbsp;아이디 : &nbsp;&nbsp;&nbsp; <input type="text" name="loginmid" style="width:120px;"></div>
						<p>
						<div class="d3">비밀번호 : &nbsp;&nbsp;<input type="password" name="loginmpwd" style="width:120px;"></div>
						<p><a href="#" class="a1">아이디 찾기&nbsp;&nbsp;</a>&nbsp;<a href="#" class="a2">&nbsp;비밀번호 찾기</a></p>
						<a href="<%=request.getContextPath() %>/Common/main.do"><img src="<%= request.getContextPath() %>/webimage/loginlogo.jpg"></a>
					
				</div>
			</section>
			<section id="content2">
				<div id="onejoin2">					
						<input type="hidden" name="type" value="B">	
						<div class="d2"> &nbsp;아이디 : &nbsp;&nbsp;&nbsp; <input type="text" name="loginlid" style="width:120px;"></div>
						<p>
						<div class="d3">비밀번호 : &nbsp;&nbsp;<input type="password" name="loginlpwd" style="width:120px;"></div>
						<p><a href="#" class="a1">아이디 찾기&nbsp;&nbsp;</a>&nbsp;<a href="#" class="a2">&nbsp;비밀번호 찾기</a></p>
						<a href="<%=request.getContextPath() %>/Common/main.do"><img src="<%= request.getContextPath() %>/webimage/loginlogo.jpg"></a>
					
				</div>
			</section>
				
				
						<button type="button" onclick="loginAction();">로그인</button>					
					
		
					
		</form>
	</div>		
</body>
</html>
		
	<%-- 	<form name="loginfrm" action="loginAction.do" method="post">
		<div class="d1">
			<img src="<%= request.getContextPath() %>/webimage/edupick2.jpg">
		</div><p/>
		<div>
				<input type="radio" id="onejo" name="loginln" value="onejo">개인로그인
				<div class="onjo2div"><input type="radio" id="onejo2" name="loginln" value="onejo2">사업자로그인</div>
		</div>
		
	
		<input type="hidden" name="type" value="M">
		<div id="onejoin">
			<div class="d2">개인아이디 : &nbsp;&nbsp;&nbsp; <input type="text" name="loginmid" style="width:120px;"></div>
			<div class="d3">개인비밀번호 : <input type="password" name="loginmpwd"  style="width:120px;"></div>
			<button type="button" onclick="loginaction()">로그인</button>
			<p><a href="#" class="a1">아이디 찾기&nbsp;</a>&nbsp;<a href="#" class="a2">&nbsp;비밀번호 찾기</a></p>
		</div>
		</form>
		<form name="loginfrm2" action="loginAction.do" method="post">
		<input type="hidden" name="type" value="L">
		<div id="onejoin2">
			<div class="d2">사업자아이디 : &nbsp;&nbsp;&nbsp; <input type="text" name="loginlid" style="width:120px;"></div>
			<div class="d3">사업자비밀번호 : <input type="password" name="loginlpwd" style="width:120px;"></div>
			<button type="button" onclick="loginaction()">로그인</button>
			<a href="#" class="a1">아이디 찾기&nbsp;</a>&nbsp;<a href="#" class="a2">&nbsp;비밀번호 찾기</a>
		</div>
		</form> --%>
