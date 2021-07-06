<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 수정</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
		<!-- top 위로올리기 -->
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<link href="<%= request.getContextPath() %>/css/enrolment.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/enrolment.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><a href="<%= request.getContextPath() %>/Common/main.do"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></a></div>
				<div class="logdiv">○○○(님)</div>
				<div class="logdiv2">
				<a href="#">로그아웃</a><br><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:10%; height:10%;">
				</div>
			</div>
		</header>
		<section>
			<article>
				<form name="creditfrm" id="examno">
					<h3 class="box2" border="1px black solid">결제자 정보</h3>
					<table class="credittablenpa">
						<tr>
							<td>
								<span>*</span>이름
							</td>
							<td>
								<input name="cname" size="15">
							</td>
						</tr>
						<tr>
							<td>
								<span>*</span>휴대폰 번호
							</td>							
							<td>
								<select>
									<option selected>010</option>
									<option >011</option>
									<option >016</option>
									<option >019</option>
								</select> -
								<input name="cphone" size="5" maxlength="4"> - <input name="cphone2" size="5" maxlength="4">
							</td>
						</tr>
						<p>	
						<tr id="addressva">
							<td>
								<span>*</span>주소
							</td>
							<td>
								<input name="caddress" size="5"> <br>
								<input name="caddress2" size="37"> 
							</td>
						</tr>
					</table>
					<hr class="hr0002" width="760px"/>			
					<h3 class="box5" border="1px red solid">총 주문 금액</h3>	
					<br>
					<table border="1px black solid" width="760px">
						<tr>
							<td>상품 가격</td>
							<td width="15%"></td>
							<td>사용할 포인트</td>
							<td width="15%"></td>
							<td>총 결제금액</td>
							<td width="15%"></td>
						</tr>
					</table>
					<br>
					<div class="btn0001">
						<button type="button" id="modifybtn0" onclick="modify()">수정</button>
						<button type="button" id="modifybtn0" onclick="list()" style="margin-left:50px;">목록</button>
				</form>
				<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
			</article>
		</section>
	</body>
</html>