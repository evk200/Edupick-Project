<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>    
<%  int mpoint = (int)request.getAttribute("mpoint"); %>    
<%  InstituteVo iv = (InstituteVo)request.getAttribute("iv");
	CourseVo cv = (CourseVo)request.getAttribute("cv");
%>	
<%	MemberVo mv = new MemberVo();
	String mTel ="";  
	String[] mTelArray = null;
	mv = (MemberVo)request.getAttribute("vo");
	mTel = mv.getMtel();
	mTelArray = mTel.split("-");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<link href="<%= request.getContextPath() %>/css/payment.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/payment.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form name="frm" id="frm" action="" method="post">
			<input type="hidden" name="cardNum">
			<input type="hidden" name="cardPass">
			<input type="hidden" name="cardCvc">
		</form>
		<header>
			<div class="headerdiv">
				<input type="hidden" id="cidx" value="<%=cv.getCidx()%>">
				<input type="hidden" id="iidx" value="<%=iv.getIidx()%>">
				<input type="hidden" id="midx" value="<%=mv.getMidx()%>">
				<a href="<%=request.getContextPath()%>/Common/main.do"><img id="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></a>
				<nav class="nav1" id="nav1_1">
				</nav>
				<nav class="nav2" id="nav1_2">
					<div class="name">에듀픽 결제시스템</div>
					<div>
						상품명 : <%=cv.getCname() %>
						<br>상품금액 : <%=cv.getCprice() %>원
						<br>쿠폰할인 :<%=mpoint %>원
						<br>합계 : <% int a = Integer.parseInt(cv.getCprice()); 
									 int b = mpoint;	
									 int c = a-b;
									 %>
									 <%=c %>원
					</div>
					<span class="payment">
						결제하기
					</span>
				</nav>
			</div>
			<div class="headerdiv2">
				<div class="use">이용약관</div>
				<div class="agree">전체동의<input type="checkbox" id="check"></div>
			</div>
		</header>
		<section>
			<article class="creditarticle">
				<div class="maindiv">
					<div class="maindiv2">전자금융거래 이용약관</div>
					<div class="maindiv3">개인정보 수집 및 이용안내 <input type="checkbox" id="checkagree"> 동의</div>
					<div class="maindiv4">개인정보 수집 및 위탁 안내 <input type="checkbox" id="checkagree2"> 동의</div>
				</div>
				<div class="Wlsmain">
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/비씨.png">비씨</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/씨티.png"><br>씨티</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/국민.png"><br>국민</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/하나.png"><br>하나</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/현대.png"><br>현대</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/롯데.png"><br>롯데</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/ibk.png"><br>IBK</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/카카오.png"><br>카카오뱅크</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/농협.png"><br>농협</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/삼성.png"><br>삼성</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/sc리워드.png"><br>SC리워드</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/신한.png"><br>신한</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/우리.png"><br>우리</div>
					<div><img id="bank" src="<%= request.getContextPath() %>/webimage/기타.png"><br>기타카드</div>
				</div>
				<div class="creditnum" style="width:180px;">
					카드 번호 : <input type="text" name="cardnum">
					비밀 번호 : <input type="text" name="cardpwd">
					cvc 3자리 : <input type="text" name="cardcvc">
					<button type="button" id="creditclose">닫기</button>
				</div>
			</article>
		</section>
	</body>
</html>