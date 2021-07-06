<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String midx = (String)request.getAttribute("midx");
String lidx = (String)request.getAttribute("lidx");
%>
<% 
String mId = (String)session.getAttribute("mid");    
String lId = (String)session.getAttribute("lid");
String lGrade = (String)session.getAttribute("lgrade");
String userType = (String)session.getAttribute("userType");
%>
<%


MemberVo mv = new MemberVo();
String mTel ="";
String[] mTelArray = null;
String mJumin ="";
String[] mJuminArray =null;
String mEmail="";
String[] mEmailArray =null;

LicenseeVo lv = new LicenseeVo();
String lTel = "";
String[] lTelArray =null;
String lJumin ="";
String[] lJuminArray = null;
String lEmail = "";
String[] lEmailArray = null;
String lNumber = "";
String[] lNumberArray = null;

if(userType.equals("M")){
   mv = (MemberVo)request.getAttribute("vo");
   
   mTel = mv.getMtel();
   mTelArray = mTel.split("-");
   
   mJumin = mv.getMjumin();
   mJuminArray = mJumin.split("-");
   
   mEmail = mv.getMemail();
   mEmailArray = mEmail.split("@");
}else{
   lv = (LicenseeVo)request.getAttribute("vo");
   
   lTel = lv.getLtel();
   lTelArray = lTel.split("-");
   
   lJumin = lv.getLjumin();
   lJuminArray = lJumin.split("-");
   
   lEmail = lv.getLemail();
   lEmailArray = lEmail.split("@");
   
   lNumber = lv.getLnumber();
   lNumberArray = lNumber.split("-");
   
}
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<!-- 타이틀 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- 기본틀 css -->
		<link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
		<!-- 제이쿼리 -->
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<!-- top 위로올리기 -->
		<link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/top.js"></script>
		<!-- 필드셋 폼 css -->
		<link href="<%= request.getContextPath() %>/css/join.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/modify.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/modify.js"></script>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src="<%= request.getContextPath() %>/js/address.js"></script>
	    <script src="<%= request.getContextPath() %>/js/modifyAction.js"></script>
	    <script src="<%= request.getContextPath() %>/js/deleteaction.js"></script>
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;">
		<header>
			<!-- 메인로고 -->
			<div class="headerimg">
				<a href="<%= request.getContextPath() %>/Common/main.do">
				<img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">	
				</a>
			</div>
			<hr class="hr03" style="border:1px solid #BDBDBD;" role="presentation" />
		</header>
		<section>
			<article>
				<form>
					<form name="regFrm1">
		               <div class="mfd">
		                  <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
		                  <label for="tab1">정보 수정하기</label>
		                  <input id="tab2" type="radio" name="tabs">
		                  <label for="tab2">회원탈퇴하기</label>
		               </div>
	               </form>
					<fieldset name="joinfed">
					<form name="regFrm">
						<table>
							<tr>
                                <td width="19%;">아이디</td>
                                <td><input name="id" size="15" disabled style="background:white; border:1px solid black;"> 
                                <!-- onClick로 입력한 아이디가 중복된 값인지 확인 -->
                            </tr>
							<tr>
								<td>
									비밀번호
								</td>
								<td>
									<button type="button">변경하기</button>
								</td>
							</tr>
							<tr>
								<td>
									이름
								</td>
								<td>
									<input name="name" size="15" disabled style="background:white; border:1px solid black;">
								</td>
							</tr>
							<tr>
								<td>
									주민등록번호
								</td>
								<td>
									<input name="birthday" size="8" maxlength="6" disabled style="background:white; border:1px solid black;"> - 
									<input type="password" name="birthday2" size="8" maxlength="7" value="*******">
								</td>
							</tr>
							<tr>
								<td>
									이메일
								</td>
								<td>
									<input name="email" size="20"> @	
									<select>
										<option selected>naver.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									이메일 수신동의
								</td>
								<td>
									<input type="radio" name="emailch"> 동의
									<input type="radio" name="emailch"> 동의거부
								</td>
							</tr>
							<tr id="addressnum">
								<td>
									우편번호
								</td>
                                <td>
									<input name="zipcode" size="5" > <input
                                    type="button" value="우편번호찾기" onClick="zipCheck()"> <!-- zipCheck()함수를 사용해 우편번호와 주소를 검색한다. -->
                                </td>
							</tr>
							<tr id="addressva">
								<td>
									주소
								</td>
								<td>
									<input name="address" size="37"> 
								</td>
							</tr>
							<tr>
								<td>
									휴대폰 번호
								</td>							
								<td>
									<select>
										<option selected>010</option>
									</select> -
									<input name="phone" size="5" maxlength="4"> - <input name="phone2" size="5" maxlength="4">
								</td>
							</tr>
							<tr>
								<td>
									사업장명
								</td>
								<td>
									<input name="company" size="6" maxlenght ="5">
								</td>
							</tr>
							<tr>
								<td>
									사업자 번호
								</td>
								<td>
									<input name="comnumber1" size="5" maxlength="4"> <input name="comnumber2" size="3" maxlength="2"> <input name="comnumber"3 size="4" maxlength="3">
								</td>
							</tr>
							
							<tr>
                                <td id="jointd"><input type="button"
                                    value="변경하기" onclick="inputCheck()">
								</td>
                            </tr>
						</table>	
					</form>	
				</fieldset>
				</form>
				<form>
					<fieldset name="dropuser">
						<table class="dropusertb">
							<tr style="margin-top:10px;">
								<td>휴대폰 인증하기</td>
								<td style="margin-left:3%;"><input size=3 maxlength=3> - <input size=3 maxlength=4> - <input size=3 maxlength=4></td>
								<td style="margin-left:3%;"><button type="button">인증하기</button></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td style="margin-left:7%;"><input type="password" size=24 maxlength=18></td>
								<td style="margin-left:3%;"><button type="button">확인</button></td>
							</tr>
						</table>
					</fieldset>
				</form>
			</article>
		</section>
		<!-- 탑버튼,모바일버튼 -->
		<button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
		<footer>
			<!-- footer hr -->
			<hr class="hr02">
				<!-- footer 로고 -->
				<div class="footerdiv">
					<div>
						<img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
					</div>
					<!-- footer 링크 -->
					<div class="fer01">	
						<ul>
							<li style="margin:3%;">
								<a href="#" class="fera"><h5>회사소개</h5></a>
							</li>	
							<li style="margin:3%;">	
								<a href="#" class="fera"><h5>개인정보처리방침</h5></a>
							</li>
							<li style="margin:3%;">	
								<a href="#" class="fera"><h5>사업자 정보 확인</h5></a>
							</li>
						</ul>
					</div>
					<!-- footer 홈페이지정보 -->
					<div class="fer02">
						㈜ 에듀픽<br/>
						주소 : 전라북도 전주시<br/>
						대표조장 : 김학림 | 사업자등록번호 : 498-65-65421
					</div>
					<!-- footer 전화번호 -->
					<div class="ct01">
						고객센터 : 1577-8888<br/>
						<p/>
						근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>