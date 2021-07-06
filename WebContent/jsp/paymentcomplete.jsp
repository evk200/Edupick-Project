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
<title>결제완료</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/paymentcomplete.js"></script>
		<link href="<%= request.getContextPath() %>/css/paymentcomplete.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<input type="hidden" id="cidx" value="<%=cv.getCidx()%>">
		<input type="hidden" id="iidx" value="<%=iv.getIidx()%>">
		<input type="hidden" id="midx" value="<%=mv.getMidx()%>">
		
		<%-- <input type="hidden" id="piidx" value="<%=piv.getPiidx()%>"> --%>
		<div class="div1">
			결제가 완료되었습니다.<br>정보입력 창으로 이동합니다
		</div>
		<div class="div2"><a href="<%=request.getContextPath()%>/Myservice/paymentAction.do?iidx=<%=iv.getIidx()%>&cidx=<%=cv.getCidx()%>">확인</a></div>
	</body>
</html>