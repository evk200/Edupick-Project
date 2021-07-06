<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판관리</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
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
			<div class="admin" >관리자 계정관리</div>
			<div>
				<div class="navuser">게시판관리 ▼</div>
				<div class="navuser_1">
					<a href="#" id="navuser_1_1" style="background:#FF00FF;">게시판 관리</a><br>
					<a href="#" id="navuser_1_2">코멘트 관리</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">회원관리</div>
				<div class="subnav" id="subnav2">상품관리</div>
				<div class="subnav" id="subnav3">주문관리</div>
				<div class="subnav" id="subnav4" style="background:#FF00FF;">게시판관리</div>
				<div class="subnav" id="subnav5">페이지관리</div>
				<div class="subnav" id="subnav6">기타관리</div>
			</div>
			
			<div class="adminmenu4" id="senagogo2">
				<div class="subnav4" id="subnav2_1">회원관리</div>
				<div class="subnav4" id="subnav2_2">상품관리</div>
				<div class="subnav4" id="subnav2_3">주문관리</div>
				<div class="subnav4" id="subnav2_4" style="background:#FF00FF;">게시판관리</div>
				<div class="subnav4" id="subnav2_5">페이지관리</div>
				<div class="subnav4" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<div class="senat">
					<div class="usermainpage">
						<form class="shfrm">
							<div class="selectsh">
								<select>
									<option selected>게시판명</option>
									<option>카테고리</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<form class="mainfrm">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>게시판명</th>
								<th>카테고리</th>
								<th>목록보기</th>
								<th>글쓰기</th>
								<th>내용보기</th>
								<th>답글쓰기</th>
								<th>기능</th>							
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td>1</td>
								<td>자유게시판</td>
								<td>학원</td>
								<td>일반</td>
								<td>일반</td>
								<td>일반</td>
								<td>일반</td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all2"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all3"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all4"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all5"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all6"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all7"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all8"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all9"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all10"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all11"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all12"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all13"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all14"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all15"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbtmf">수정</button><button type="button" id="btbt22">보기</button></td>
							</tr>
						</table>
						<div id="divPaging">
							<div>◀</div>
							<div><a href="#"><b>1</b></a></div>
							<div><a href="#">2</a></div>
							<div><a href="#">3</a></div>
							<div><a href="#">4</a></div>
							<div><a href="#">5</a></div>
							<div>▶</div>
						</div>
						<div class="clplus"><button type="button" id="clplus_2">추가하기</button></div>
					</form>
					<div class="usermainpage2">
						<form class="shfrm">
							<div class="selectsh">
								<select>
									<option selected>회원 아이디</option>
									<option>댓글내용</option>
									<option>등록일</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<div class="userup2">
						<div><button type="button">삭제</button></div>
					</div>
					<form class="mainfrm2">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>게시판명</th>
								<th>카테고리</th>
								<th>회원 아이디</th>
								<th>등록일</th>
								<th>기능+게시물제목</th>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td>1</td>
								<td>공지사항</td>
								<td>공지사항</td>
								<td>won353</td>
								<td>2021-02-25</td>
								<td><button type="button" id="btbt11">보기</button> 안녕하세요</td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all2"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all3"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all4"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all5"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all6"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all7"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all8"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all9"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all10"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all11"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all12"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all13"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all14"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
							<tr>
								<th><input type="checkbox" id="usercheck_all15"></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button" id="btbt11">보기</button></td>
							</tr>
						</table>
						<div id="divPaging">
							<div>◀</div>
							<div><a href="#"><b>1</b></a></div>
							<div><a href="#">2</a></div>
							<div><a href="#">3</a></div>
							<div><a href="#">4</a></div>
							<div><a href="#">5</a></div>
							<div>▶</div>
						</div>
					</form>	
				</div>
			</article>
		</section>
	</body>
</html>	