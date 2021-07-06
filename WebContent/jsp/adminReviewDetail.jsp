<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  
	String loginname = (String)session.getAttribute("loginname");
%>     
<!DOCTYPE html>
<html>
	<head>
		<title>수강평상세</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminreviewdetail.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv"><%=loginname %>(님)</div>
				<div class="logdiv2">
				<a href="에듀픽.html">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >관리자 계정관리</div>
			<div>
				<div class="navuser">상품관리 ▼</div>
				<div class="navuser_1">
					<a href="상품관리.html" id="navuser_1_1">학원관리</a><br>
					<a href="상품관리.html" id="navuser_1_2">강의관리</a><br>
					<a href="상품관리.html" id="navuser_1_3">수강생관리</a><br>
					<a href="상품관리.html" id="navuser_1_4">수강평관리</a><br>
					<a href="상품관리.html" id="navuser_1_5">커뮤니티 관리</a><br>
					<a href="상품관리.html" id="navuser_1_6">상담관리</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2" style="background:#FA5858;">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="starfrm">
						<table class="startable">
							<tr>
								<th width="100px" height="68px">학원명</th>
								<td height="68px"><input type="text" value="이젠IT" disabled></td>
								<th width="100px" height="68px">강의명</th>
								<td height="68px"><input type="text" value="벤치프레스하기" disabled></td>
							</tr>
							<tr>
								<th height="68px">분류</th>
								<td><input type="text" value="헬창" disabled></td>
								<th height="68px">작성일</th>
								<td><input type="text" value="2021-02-22" disabled></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan=3><textarea disabled>테스트입니다.</textarea></td>
							</tr>
						</table>
						<table class="startable2">
							<tr>
								<th rowspan=5 height=90% width=25%>수강평리스트</th>
								<td width=10%>★★★</td>
								<td width=50% height="100px">그럭저럭 좋네요.</td>
								<td width=5%><button type="button" id="delbtn">삭제</button></td>
								<td width=10%>버거킹</td>
								
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">삭제</button></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">삭제</button></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">삭제</button></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">삭제</button></td>
								<td></td>
							</tr>
							<tr>
								<th>수강평</th>
								<td width="500px" height="100px" colspan=3><input type="text" id="textbox2"></td>
								<td width="120px;" style="border-top:1px solid white;"><button type="button" id="submit2">등록</button></td>
							</tr>
						</table>
						<button type="button" id="starbtn">목록</button>
					</form>
			</article>
		</section>
	</body>
</html>					