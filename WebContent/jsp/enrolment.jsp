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
<%  
   String loginname = (String)session.getAttribute("loginname");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>수강신청</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
        <script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<!-- top 위로올리기 -->
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/enrolment.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/enrolment.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      	<script src="<%= request.getContextPath() %>/js/address.js"></script>
		<script>
			$(document).ready(function(){
				/* var price = ${cv.getCprice()};
				var point = ${mpoint};
				var result = minus(price, point); */
			});
		</script>
	</head>
	<body>
		<header>
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<div class="logoutdiv">
				<%=loginname %> <a href="#">로그아웃</a><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:10%; height:10%;">
			</div>
		</header>
		<section>
			<article class="lisiz">
				<form name="creditfrm" class="lisiz_1">
					<h5 class="box1">주문 정보</h5>
					<input type="hidden" id="cidx" value="<%=cv.getCidx()%>">
					<input type="hidden" id="iidx" value="<%=iv.getIidx()%>">
					<input type="hidden" id="midx" value="<%=mv.getMidx()%>">
					
					
					
					<table border="1px black solid" width="760px" class="protable">
						<tr>
							<td>학원명</td>
							<td width="25%"><%=iv.getIname() %></td>
							<td>수강명</td>
							<td width="25%"><%=cv.getCname() %><input type="hidden" name="cidx" value="<%=cv.getCidx()%>"></td>
							<td>주문가격 : <%=cv.getCprice() %>원</td>
						</tr>
					</table>
					<p>
					<img src="<%=request.getContextPath()%>/filefolder/<%=iv.getIfile() %>" alt="instimg" width="200px" height="150px" border="1px black solid">
					<p>
					<span id="more" style="CURSOR: hand" onclick="if(story.style.display=='none')
						{story.style.display='';more.innerText='▶접기'} 
						else {story.style.display='none';more.innerText='▶자세히보기'}">▶자세히보기
					</span>
					<div id="story" style="display: none">
						상세정보 없음
					</div>
					<hr class="hr0001" width="760px"/>
					<h3 class="box2" border="1px black solid">결제자 정보</h3>
					<table class="credittablenpa">
						<tr>
							<td>
								<span>*</span>이름
							</td>
							<td>
								<input name="mname" size="15" value="<%=mv.getMname()%>">
							</td>
						</tr>
						<tr>
							<td>
								<span>*</span>휴대폰 번호
							</td>							
							<td>
								<select name="mTel0">
									<%
                                	 if(mTelArray[0].equals("010")){
                                    %>
									<option selected>010</option>
									<%
		                                 }else if(mTelArray[0].equals("011")){
		                                    %>
		                                    <option selected>011</option>
		                                    <%
		                                 }else{
		                                    %>
		                                    <option selected>018</option>
		                                    <% 
		                                 }   
		                              %>
									
									<option >010</option>
									<option >011</option>
									<option >018</option>
								</select> -
								<input name="mTel1" size="5" maxlength="4" value="<%= mTelArray[1]%>"> - <input name="mTel2" size="5" maxlength="4" value="<%= mTelArray[2]%>">
							</td>
						</tr>
						<p>	
						<tr id="addressva">
							<td>
								<span>*</span>주소
							</td>
							<td>
								<input type="text" id="sample4_postcode" name="sample4_postcode" value="<%=mv.getMpostcode()%>"  readonly placeholder="우편번호">
                         		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                         		<input type="text" id="sample4_roadAddress" name="sample4_roadAddress" value="<%=mv.getMroadaddr() %>" readonly placeholder="도로명주소">
                          		<input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" value="<%=mv.getMjibunaddr() %>" readonly placeholder="지번주소"><br>
                          		<span id="guide" name="guide" style="color:#999;display:none"></span>
                          		<input type="text" id="sample4_detailAddress" name="sample4_detailAddress" value="<%=mv.getMdetailaddr() %>" placeholder="상세주소">                       																
                           		<input type="text" id="sample4_extraAddress" name="sample4_extraAddress" value="<%=mv.getMextraaddr() %>" placeholder="참고항목">
							</td>
						</tr>
					</table>
					<hr class="hr0002" width="760px"/>			
					<h3 class="box3" border="1px red solid">결제 방법</h3>	
					<div class="radio1" name="pdmethod">
						<input type="radio" name="pay" id="pay1" value="card" checked>신용카드
						<input type="radio" name="pay" id="pay2" value="transfer">계좌이체
						<input type="radio" name="pay" id="pay3" value="visit">방문결제
					</div>
					<p>
					<div class="msg">
						<table class="credittablecb">
							<tr>
								<td>
								*기간단위 강의의 연장을 원하실 때에는 기간 만료 3~5일 전에 <br> 미리  마이페이지 > 수강중인 강의에서 결제하셔야 합니다.<br>
								*결제 후 동일 상품의 결제 방법을  변경하시려면 <br> 마이페이지 > 수강중인 강의에서 변경 가능합니다.  
								</td>
							</tr>
						</table>
					</div>
					<hr class="hr0003" width="760px"/>
					<h3 class="box4" border="1px red solid">할인 혜택</h3>
					<br>	
					<div class="point">
						<table class="credittablepoint" width="700px">
							<tr>
								<td>보유 포인트</td>
								<td><input name="nowpoint" value="<%=mpoint %>point" size="15"></td> 
								<td>사용할 포인트</td>
								<td><input name="allpoint" value="<%=mpoint %>point" size="10"></td> 
							</tr>
							<tr>
								<td colspan=4 style="text-align:center;">포인트는 항상 전액 사용됩니다.</td>
							</tr>
						</table>
					</div>	
					<hr class="hr0004" width="760px"/>
					<p>
					<h3 class="box5" border="1px red solid">총 주문 금액</h3>	
					<br>
					<table border="1px black solid" width="760px">
						<tr>
							<td>상품 가격</td>
							<td width="15%" id="price"><%=cv.getCprice() %>원</td>
							<td>사용할 포인트</td>
							<td width="15%" id="point"><%=mpoint %>point</td>
							<td>총 결제금액</td>
							<td width="15%" id=""><% int a = Integer.parseInt(cv.getCprice()); 
													 int b = mpoint;	
													 int c = a-b;
													 %>
													 <%=c %>원
							</td>
						</tr>
					</table>
					<br> 
					<div class="btn0001">
						<button type="button" id="creditbtn01"><a href="/edupick/Myservice/payment.do?iidx=<%=iv.getIidx()%>&cidx=<%=cv.getCidx()%>">결제하기</a></button>
						<button type="button" id="creditbtn02"><a href="/edupick/Institute/instituteDetail.do?iidx=<%=iv.getIidx()%>">취소하기</a></button>
					</div>
					<div class="btn0002">
						<button type="button" id="creditbtn03"><a onclick="alert('농협은행 예금주 : 권혁민 계좌번호 : 302-0177-0251-41');" href="/edupick/Institute/instituteDetail.do?iidx=<%=iv.getIidx()%>">결제하기</a></button>
						<button type="button" id="creditbtn04""><a href="/edupick/Institute/instituteDetail.do?iidx=<%=iv.getIidx()%>">취소하기</a></button>
					</div>
					<div class="btn0003">
						<button type="button" id="creditbtn05" onclick="credit3()">결제하기</button>
						<button type="button" id="creditbtn06"><a href="/edupick/Institute/instituteDetail.do?iidx=<%=iv.getIidx()%>">취소하기</a></button>
					</div>
				</form>
				<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
			</article>
		</section>
	</body>
</html>