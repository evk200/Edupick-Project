<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "Domain.*" %>    
<% String loginname = (String)session.getAttribute("loginname"); %>   
<% ArrayList<InstituteVo> alist = (ArrayList<InstituteVo>)request.getAttribute("alist");
	ArrayList<CourseVo> alist2 = (ArrayList<CourseVo>)request.getAttribute("alist2");
	ArrayList<PaymentinfoVo> alist3 = (ArrayList<PaymentinfoVo>)request.getAttribute("alist3");
	ArrayList<ReviewVo> alistmu = (ArrayList<ReviewVo>)request.getAttribute("alistmu");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	PageMaker pm2 = (PageMaker)request.getAttribute("pm2");
	ArrayList<CommunityVo> alist129 = (ArrayList<CommunityVo>)request.getAttribute("alist129");
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품관리</title>
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
				<div class="navuser">상품관리 ▼</div>
				<div class="navuser_1">
					<a href="#" id="navuser_1_1" style="background:#FA5858;">학원관리</a><br>
					<a href="#" id="navuser_1_2">강의관리</a><br>
					<a href="#" id="navuser_1_3">수강생관리</a><br>
					<a href="#" id="navuser_1_4">수강평관리</a><br>
					<a href="#" id="navuser_1_5">커뮤니티 관리</a><br>
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
			
			<div class="adminmenu3">
				<div class="subnav2" id="subnav2_1">회원관리</div>
				<div class="subnav2" id="subnav2_2" style="background:#FA5858;">상품관리</div>
				<div class="subnav2" id="subnav2_3">주문관리</div>
				<div class="subnav2" id="subnav2_4">게시판관리</div>
				<div class="subnav2" id="subnav2_5">페이지관리</div>
				<div class="subnav2" id="subnav2_6">기타관리</div>
			</div>
		</nav>
		<section>
			<article>
				<div class="sena01"> 
					<div class="usermainpage">
						<form class="shfrm">
							<div class="selectsh">
								<select>
									<option selected>학원명</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<div class="userup">
						<div><button type="button" style="opacity:0.1;">삭제</button></div>
						<div>총 학원수 :</div>
						<div>검색 학원수 :</div>
					</div>
					<form class="mainfrm">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>학원명</th>
								<th>학원위치</th>
								<th>학원 연락처</th>
								<th>등록일</th>
								<th>기능</th>
							</tr>
							<% for(InstituteVo iv : alist){ %>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td><%=iv.getIidx()%></td>
								<td><%=iv.getIname()%></td>
								<td>(<%= iv.getIpostcode() %>)<br><%=iv.getIroadaddr()%>,<%=iv.getIdetailaddr() %></td>
								<td><%=iv.getItel() %></td>
								<td><%=iv.getIwriteday() %></td>
								<td><button type="button" id="btbtcl"><a href="/edupick/Admin2/adminInstituteDetail.do?iidx=<%=iv.getIidx()%>">보기</a></button></td>
							</tr>
							<% } %>
						</table>
						<div class="clplus"><button type="button" id="clplus_1">추가하기</button></div>
						<table>
							<tr>
							<td><%if (pm.isPrev() == true) {%>
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">◀</a>
									<%} %>
								</td>
								<td>
									<% for (int i =pm.getStartPage(); i<pm.getEndPage(); i++){%>	
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>"><%=i%></a>
									<% } %>
								</td>
								<td><%if (pm.isNext() == true) {%>
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">▶</a>
									<%} %>
								</td>
							</tr>
						</table>
					</form>
					<div class="usermainpage2">
						<form class="shfrm">
							<div class="selectsh">
								<select>
									<option selected>회원명</option>
									<option>회원아이디</option>
									<option>회원연락처</option>
									<option>회원이메일</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<div class="userup2">
						<div><button type="button" style="opacity:0.1;">삭제</button></div>
						<div>총 회원수 :</div>
						<div>검색 회원수 :</div>
					</div>
					<form class="mainfrm2">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>학원명</th>
								<th>수강비</th>
								<th>수강기간</th>
								<th>수강시간</th>
								<th>모집인원</th>
								<th>등록일</th>
								<th>기능</th>
							</tr>
							<% for(CourseVo cv : alist2){ %>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td><%=cv.getCidx() %></td>
								<td><%=cv.getCname() %></td>
								<td><%=cv.getCprice() %>원</td>
								<td><%=cv.getCperiod() %></td>
								<td><%=cv.getCtime() %></td>
								<td><%=cv.getCpeople() %></td>
								<td><%=cv.getCwriteday() %></td>
								<td><button type="button" id="btbt99"><a href="/edupick/Admin2/adminCouresDetail.do?cidx=<%=cv.getCidx()%>">보기</a></button></td>
							</tr>
							<%}%>
						</table>
						<table>
							<tr>
							<td><%if (pm.isPrev() == true) {%>
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do?page=<%=pm.getStartPage()-1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">◀</a>
									<%} %>
								</td>
								<td>
									<% for (int i =pm.getStartPage(); i<pm.getEndPage(); i++){%>	
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>"><%=i%></a>
									<% } %>
								</td>
								<td><%if (pm.isNext() == true) {%>
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do=<%=pm.getEndPage()+1%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">▶</a>
									<%} %>
								</td>
							</tr>
						</table>
						<button type="button" name="btn0407"><a href="<%=request.getContextPath()%>/Admin2/adminCoures.do">추가하기</a></button>
					</form>
					<div class="usermainpage3">
						<form class="shfrm">
							<div class="selectsh">
								<select>
									<option selected>회원명</option>
									<option>회원아이디</option>
									<option>회원연락처</option>
									<option>회원이메일</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<div class="userup3">
						<div><button type="button" style="opacity:0.1;">삭제</button></div>
						<div>총 수강생수 :</div>
						<div>검색 수강생수 :</div>
					</div>
					<form class="mainfrm3">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>이름</th>
								<th>학원명</th>
								<th>강의명</th>
								<th>수강시간</th>
								<th>수강기간</th>
								<th>등록일</th>
								<th>기능</th>
							</tr>
							<% for(PaymentinfoVo piv : alist3){ %>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td><%=piv.getPiidx()%></td>
								<td><%=piv.getMname()%></td>
								<td><%=piv.getIname() %></td>
								<td><%=piv.getCname() %></td>
								<td><%=piv.getCtime() %></td>
								<td><%=piv.getCperiod() %></td>
								<td><%=piv.getCwriteday() %></td>
								<td><button type="button" id="btbtcl"><a href="/edupick/Admin2/adminInstituteDetail.do?iidx=<%=piv.getIidx()%>">보기</a></button></td>
							</tr>
							<% } %>
						</table>
						<table>
							<tr>
							<td><%if (pm2.isPrev() == true) {%>
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do?page=<%=pm2.getStartPage()-1%>&keyword=<%=pm2.encoding(pm2.getScri().getKeyword())%>">◀</a>
									<%} %>
								</td>
								<td>
									<% for (int i =pm2.getStartPage(); i<pm2.getEndPage(); i++){%>	
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do?page=<%=i%>&keyword=<%=pm2.encoding(pm2.getScri().getKeyword())%>"><%=i%></a>
									<% } %>
								</td>
								<td><%if (pm2.isNext() == true) {%>
									<a href="<%=request.getContextPath()%>/Admin2/adminProductManage.do=<%=pm2.getEndPage()+1%>&keyword=<%=pm2.encoding(pm2.getScri().getKeyword())%>">▶</a>
									<%} %>
								</td>
							</tr>
						</table>
					</form>
					<div class="usermainpage4">
						<form class="shfrm" id="senana_2">
							<div class="selectsh">
								<select>
									<option selected>학원명</option>
								</select>
							</div>
							<div class="selectsh2"><input size=30></div>
							<div class="selectsh3"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<div class="userup4">
						<div><button type="button" style="opacity:0.1;">삭제</button></div>
						<div>총 수강평 :</div>
						<div>검색 수강평 :</div>
					</div>
					<form class="mainfrm4" id="senana">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>이름</th>
								<th>학원명</th>
								<th>강의명</th>
								<th>작성일자</th>
								<th>기능</th>
							</tr>
							<%for(ReviewVo rv : alistmu) {%>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td><%=rv.getRidx() %></td>
								<td><%=rv.getRwriter() %></td>
								<td>
									<%if (rv.getIname() == null) { %>
									현재 수정중입니다.
									<%} else { %>
									<%=rv.getIname() %>
									<%} %>
								</td>
								<td>
									<%if (rv.getCname() == null) { %>
									현재 수정중입니다.
									<%} else { %>
									<%=rv.getCname() %>
									<%} %>
								</td>
								<td><%=rv.getRwriteday() %></td>
								<td><button type="button" id="btbt77">보기</button></td>
							</tr>
							<%} %>
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
					<div class="usermainpage5">
						<form class="shfrm">
							<div class="comsh">
								<select>
									<option>본글</option>
									<option>댓글</option>
								</select>
							</div>
							<div class="comsh2">
								<select>
									<option>건의사항</option>
									<option>공지사항</option>
								</select>
							</div>
							<div class="selectsh">
								<select>
									<option selected>회원명</option>
									<option>회원아이디</option>
									<option>회원연락처</option>
									<option>회원이메일</option>
								</select>
							</div>
							<div class="selectsh2" id="shmove1"><input size=30></div>
							<div class="selectsh3" id="shmove2"><img src="<%= request.getContextPath() %>/webimage/search.jpg"></div>
						</form>
					</div>
					<div class="userup5">
						<div><button type="button" style="opacity:0.1;">삭제</button></div>
						<div>총 커뮤니티 글 :</div>
						<div>검색 커뮤니티 글 :</div>
					</div>
					<form class="mainfrm5">
						<table class="maintable">
							<tr id="table1">
								<th><input type="checkbox" id="usercheck"></th>
								<th>No</th>
								<th>작성자</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성날짜</th>
								<th>파일</th>
								<th>기능</th>
							</tr>
							<%for(CommunityVo civ : alist129) {%>
							<tr>
								<th><input type="checkbox" id="usercheck_all1"></th>
								<td><%=civ.getCoidx() %></td>
								<td><%=civ.getCowrite() %></td>
								<td><%=civ.getCosubject() %></td>
								<td><%=civ.getCocontent() %></td>
								<td><%=civ.getCowriteday() %></td>
								<td><%=civ.getCofile() %></td>
								<td><a href="/edupick/Admin2/adminCommunityDetail.do?coidx=<%=civ.getCoidx()%>"><button type="button" style="border:1px solid black; background:white;">보기</button></a></td>
							</tr>
							<%} %>
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
			</article>
		</section>
	</body>
</html>