<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>    
   

<% PointquizVo pv = (PointquizVo)request.getAttribute("pv"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>포인트 퀴즈</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<style>
	table {
		border:1px solid black;
		width:560px;
		height:280px;
		text-align:center;
	}

	table  , td {
		border:1px solid black;
	}
	
	td:nth-child(odd){
		background:#A4A4A4;
		width:140px;
	}
</style>
<script>
	$(document).ready(function(){
		var answer = ${pv.panswer};
		$("#quiz1").click(function(){
			if( answer == 1) {
				alert("정답입니다.");
				$.ajax({
					url:"AddPoint.do",
					type:"post",
					success:function(data){
						$("#quizanswer").css("display","table-row");
						$("#quizexplan").css("display","table-row");
						parent.opener.location.reload();
						$("#quiz1").unbind("click");
						$("#quiz2").unbind("click");
						$("#quiz3").unbind("click");
						$("#quiz4").unbind("click");
					}
				});			
				
			}else {
				alert("틀렸습니다 다시 풀어주세요.");
			}
		});
		$("#quiz2").click(function(){
			if(answer == 2) {
				alert("정답입니다.");
				$.ajax({
					url:"AddPoint.do",
					type:"post",
					success:function(data){
						$("#quizanswer").css("display","table-row");
						$("#quizexplan").css("display","table-row");
						parent.opener.location.reload();
						$("#quiz1").unbind("click");
						$("#quiz2").unbind("click");
						$("#quiz3").unbind("click");
						$("#quiz4").unbind("click");
					}
				});
			}else {
				alert("틀렸습니다 다시 풀어주세요.");
			}
		});
		$("#quiz3").click(function(){
			if(answer == 3) {
				alert("정답입니다.");
				$.ajax({
					url:"AddPoint.do",
					type:"post",
					success:function(data){
						$("#quizanswer").css("display","table-row");
						$("#quizexplan").css("display","table-row");
						parent.opener.location.reload();
						$("#quiz1").unbind("click");
						$("#quiz2").unbind("click");
						$("#quiz3").unbind("click");
						$("#quiz4").unbind("click");
					}
				});
			}else {
				alert("틀렸습니다 다시 풀어주세요.");
			}
		});
		$("#quiz4").click(function(){
			if(answer == 4) {
				alert("정답입니다.");
				$.ajax({
					url:"AddPoint.do",
					type:"post",
					success:function(data){
						$("#quizanswer").css("display","table-row");
						$("#quizexplan").css("display","table-row");	
						parent.opener.location.reload();
						$("#quiz1").unbind("click");
						$("#quiz2").unbind("click");
						$("#quiz3").unbind("click");
						$("#quiz4").unbind("click");
					}
				});
			}else {
				alert("틀렸습니다 다시 풀어주세요.");
			}
		});
	});
</script>
</head>
<body oncontextmenu="return false">
	<form>
		<table>
			<tr>
				<td>난이도</td>
				<td><input type="hidden" name="pidx" value="<%=pv.getPidx()%>">
					<% if(pv.getPdifficulty().equals("high")) {%>
						<%out.print("상");%>
					<%}else if (pv.getPdifficulty().equals("middle")) { %>
						<% out.print("중"); %>
					<%}else { %>
						<% out.print("하"); } %>
				</td>
			</tr>
			<tr>
				<td>포인트</td>
				<td><%=pv.getPscore() %></td>
			</tr>
			<tr>
				<td>문제</td>
				<td><%=pv.getPsubject() %></td>
			</tr>
			<tr>
				<td>1</td>
				<td id="quiz1"><%=pv.getPcontent1() %></td>
			</tr>
			<tr>
				<td>2</td>
				<td id="quiz2"><%=pv.getPcontent2() %></td>
			</tr>
			<tr>
				<td>3</td>
				<td id="quiz3"><%=pv.getPcontent3() %></td>
			</tr>
			<tr>
				<td>4</td>
				<td id="quiz4"><%=pv.getPcontent4() %></td>
			</tr>
			<tr id="quizanswer" style="display:none;">
				<td>답</td>
				<td id="quiz1_1"><%=pv.getPanswer() %>번</td>
			</tr>
			<tr id="quizexplan" style="display:none;">
				<td>문제 해설</td>
				<td><%=pv.getPexplanation() %></td>
			</tr>
		</table>
	</form>
</body>
</html>