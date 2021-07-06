<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가</title>
<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/css/adminpagep.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		function check(){
			if (document.frm.nsubject.value == ""){
				alert("제목을 입력하세요.");
				document.frm.nsubject.focus();
				return;
			}else if (document.frm.ncontent.value == "") {
				alert("내용을 입력하세요.");
				document.frm.ncontent.focus();
				return;
			}else if (document.frm.nwriter.value == "") {
				alert("작성자를 입력하세요.");
				document.frm.nwriter.focus();
				return;
			}
			alert("등록합니다.");
			document.frm.action="<%=request.getContextPath() %>/Admin2/adminPageNoticeAction.do";
			document.frm.method="post";
			document.frm.enctype="multipart/form-data";
			document.frm.submit();
			
			
			return;
		}
	</script>
</head>
<body>
	<header>
		<div class="herdiv" id="herdiv2">
			<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
			<div class="logdiv" id="logdiv_2"><%= loginname %></div>
			<div class="logdiv2" id="logodiv_2">
			<a href="<%= request.getContextPath() %>/Common/main.do">Home</a>
			<a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a>
			</div>
		</div>
	</header>
	<nav class="nav">
		<div class="admin">관리자 계정관리</div>
		<div>
			<div class="navuser">페이지 관리 ▼</div>
			<div class="navuser_1">
				<a href="<%= request.getContextPath() %>/Admin2/adminPageManage.do" id="navuser_1_1">공지사항</a><br>
				<a href="<%= request.getContextPath() %>/Admin2/adminPageManage.do" id="navuser_1_2">교육정보</a><br>
				<a href="<%= request.getContextPath() %>/Admin2/adminPageManage.do" id="navuser_1_3">고객센터</a><br>
			</div>
		</div>
	</nav>
	<nav>
		<div class="adminmenu">
			<div class="subnav" id="subnav1">회원관리</div>
			<div class="subnav" id="subnav2">상품관리</div>
			<div class="subnav" id="subnav3">주문관리</div>
			<div class="subnav" id="subnav4">게시판관리</div>
			<div class="subnav" id="subnav5" style="background:#FA5858;">페이지관리</div>
			<div class="subnav" id="subnav6">기타관리</div>
		</div>
		
		<div class="adminmenu4" id="senagogo2">
			<div class="subnav4" id="subnav2_1">회원관리</div>
			<div class="subnav4" id="subnav2_2">상품관리</div>
			<div class="subnav4" id="subnav2_3">주문관리</div>
			<div class="subnav4" id="subnav2_4">게시판관리</div>
			<div class="subnav4" id="subnav2_5" style="background:#FA5858;">페이지관리</div>
			<div class="subnav4" id="subnav2_6">기타관리</div>
		</div>
	</nav>
	<section>
		<article>
			<form class="pagefrmp" name="frm">
				<h2>공지사항</h2>
				<select name="ncategory" id="ncategory" style="width:120px;">
					<option value="use">이용 안내</option>
					<option value="event">이벤트</option>
				</select>
				<table style="border-collapse:collapse">
					<tr>
						<td width=10%>제목</td>
						<td width=150%><input name="nsubject"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="ncontent"></textarea></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input name="nwriter"></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="nfile" size="200"></td>
					</tr>
				</table>
				<button type="button" id="noticesubmit" onclick="check()">등록</button>
			</form>
		</article>
	</section>
</body>
</html>