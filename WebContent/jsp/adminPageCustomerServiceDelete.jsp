<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cidx = (String) request.getAttribute("cidx"); %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 삭제</title>
<script type="text/javascript">
	function check(){
		alert("삭제합니다.");
		document.frm.action="<%=request.getContextPath() %>/Admin2/adminPageCustomerServiceDeleteAction.do";
		document.frm.method="post";
		document.frm.submit();
		
		
	}
</script>
</head>
<body>
	<h2>삭제</h2>
	<form name="frm">
		<input type="hidden" name="cidx" value="<%=cidx %>">
		<div>삭제 하시겠습니까?<br><br>
			<input type="button" onclick="check();" value="예">
			<input type="button" value="아니오">
		</div>
	</form>
</body>
</html>