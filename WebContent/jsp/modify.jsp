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
            <form name="regFrm1">
               <div class="mfd">
                  <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
                  <label for="tab1">정보 수정하기</label>
                  <input id="tab2" type="radio" name="tabs">
                  <label for="tab2">회원탈퇴하기</label>
               </div>
               </form>
               <c:if  test ="${userType eq 'M' }" >
               <fieldset name="joinfed">
               <form name="regFrm01" >
                  <input type = "hidden" name="midx" value="<%=mv.getMidx()%>">
                  <table>
                     <tr>
                     	<td width="19%;">아이디</td>
                        <td><input id="modiid" name="modiid" size="15" disabled style="background:white; border:1px solid black;" value="<%= mv.getMid()%>"> 
                        <!-- onClick로 입력한 아이디가 중복된 값인지 확인 -->
                     </tr>
                     <tr>
                        <td>
                           	비밀번호
                        </td>
                        <td>
                           <input  type="password" name="modipwd" id="modipwd">
                        </td>
                     </tr>
                     <tr>
                        <td>
                         	  비밀번호 확인
                        </td>
                        <td>
                           <input  type="password" name="modipwdcheck" id="modipwdcheck"><span id="same"></span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                         	  이름
                        </td>
                        <td>
                           <input name="name" name="name" size="15" disabled style="background:white; border:1px solid black;" value="<%= mv.getMname()%>">
                        </td>
                     </tr>
                     <tr>
                        <td>
                        	주민등록번호
                        </td>
                        <td>
                           <input name="birthday" " size="8" maxlength="6" disabled style="background:white; border:1px solid black;" value = "<%= mJuminArray[0]%>"> - 
                           <input type="password" name="birthday2" size="8"  maxlength="7" disabled style="background:white value="<%= mJuminArray[1] %>">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           	이메일
                        </td>
                        <td>
                           <input name="modiemail" id="modiemail" size="20" value="<%= mEmailArray[0]%>"> @   
                           <select name="modiemail2">
                              <%
                                 if(mEmailArray[1].equals("naver.com")){
                                    %>
                                    <option selected>naver.com</option>
                                    <%
                                 }else if(mEmailArray[1].equals("nate.com")){
                                    %>
                                    <option selected>nate.com</option>
                                    <%
                                 }else if(mEmailArray[1].equals("daum.com")){
                                    %>
                                    <option selected>daum.net</option>
                                    <% 
                                 }else if(mEmailArray[1].equals("google.com")){
                                    %>
                                    <option selected>google.com</option>
                                    <% 
                                 }      
                              %>
                              <option >naver.com</option>
                              <option >nate.com</option>
                              <option >daum.com</option>
                              <option >google.com</option>
                              
                           </select>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span>*</span>우편번호
                        </td>
                                <td>
                           <input type="text" id="sample4_postcode" name="sample4_postcode"  readonly placeholder="우편번호" value="<%=mv.getMpostcode()%>">
                                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                  <input type="text" id="sample4_roadAddress" name="sample4_roadAddress" readonly placeholder="도로명주소" value="<%=mv.getMroadaddr()%>">
                                   <input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" readonly placeholder="지번주소" value="<%=mv.getMjibunaddr()%>"><br>
                                   <span id="guide" name="guide" style="color:#999;display:none"></span>
                                   <input type="text" id="sample4_detailAddress" name="sample4_detailAddress" placeholder="상세주소" value="<%=mv.getMdetailaddr()%>">
                                    <input type="text" id="sample4_extraAddress" name="sample4_extraAddress" readonly placeholder="참고항목" value="<%=mv.getMextraaddr()%>">
                                </td>
                     </tr>
                     <tr>
                        <td>
                           	휴대폰 번호
                        </td>                     
                        <td>
                           <select name="phone1" id="phone1">
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
                                    
                              
                              
                              <option>010</option>
                              <option>011</option>
                              <option>018</option>
                           </select> -
                           <input name="phone2" id="phone2" size="5" maxlength="4" value="<%= mTelArray[1]%>"> - <input name="phone3" id="phone3" size="5" maxlength="4" value="<%= mTelArray[2]%>">
                        </td>
                     </tr>
                     <tr>
                         <td id="jointd"><input type="button"
                             value="변경하기" onclick="inputCheck01()">
                        </td>
                     </tr>
                  </table>        
               </form>   
            </fieldset>
            </c:if>
            
            <c:if test="${userType eq 'L' && lGrade eq 'A'}">
            <fieldset name="joinfed">
               <form name="regFrm02" value="licensee">
                  <input type = "hidden" name="lidx" value="<%=lv.getLidx()%>">
                  <table>
                     <tr>
                                <td width="19%;">아이디</td>
                                <td><input id="modiid" name="modiid" size="15" disabled style="background:white; border:1px solid black;" value="<%= lv.getLid()%>"> 
                                <!-- onClick로 입력한 아이디가 중복된 값인지 확인 -->
                            </tr>
                     <tr>
                        <td>
                          	비밀번호
                        </td>
                        <td>
                           <input  type="password" name="modipwd" id="modipwd">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           	비밀번호 확인
                        </td>
                        <td>
                           <input  type="password" name="modipwdcheck" id="modipwdcheck"><span id="same"></span>
                        </td>
                     </tr>
                     
                     <tr>
                        <td>
                          	이름
                        </td>
                        <td>
                           <input name="name" name="name" size="15" disabled style="background:white; border:1px solid black;" value="<%= lv.getLname()%>">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           	주민등록번호
                        </td>
                        <td>
                           <input name="birthday"  size="8" maxlength="6" disabled style="background:white; border:1px solid black;" value = "<%= lJuminArray[0]%>"> - 
                           <input type="password" name="birthday2" size="8"  maxlength="7" disabled style="background:white value="<%= lJuminArray[1] %>">
                        </td>
                     </tr>
                     <tr>
                        <td>
                          	 이메일
                        </td>
                        <td>
                           <input name="modiemail" id="modiemail" size="20" value="<%= lEmailArray[0]%>"> @   
                           <select name="modiemail2">
                              <%
                                 if(lEmailArray[1].equals("naver.com")){
                                    %>
                                    <option selected>naver.com</option>
                                    <%
                                 }else if(lEmailArray[1].equals("nate.com")){
                                    %>
                                    <option selected>nate.com</option>
                                    <%
                                 }else if(lEmailArray[1].equals("daum.com")){
                                    %>
                                    <option selected>daum.net</option>
                                    <% 
                                 }else if(lEmailArray[1].equals("google.com")){
                                    %>
                                    <option selected>google.com</option>
                                    <% 
                                 }      
                              %>
                              <option >naver.com</option>
                              <option >nate.com</option>
                              <option >daum.com</option>
                              <option >google.com</option>
                              
                           </select>
                           
                           
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span>*</span>우편번호
                        </td>
                                <td>
                           <input type="text" id="sample4_postcode" name="sample4_postcode"  readonly placeholder="우편번호" value="<%=lv.getLpostcode()%>">
                                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                  <input type="text" id="sample4_roadAddress" name="sample4_roadAddress" readonly placeholder="도로명주소" value="<%=lv.getLroadaddr()%>">
                                   <input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" readonly placeholder="지번주소" value="<%=lv.getLjibunaddr()%>"><br>
                                   <span id="guide" name="guide" style="color:#999;display:none"></span>
                                   <input type="text" id="sample4_detailAddress" name="sample4_detailAddress" placeholder="상세주소" value="<%=lv.getLdetailaddr()%>">
                                    <input type="text" id="sample4_extraAddress" name="sample4_extraAddress" readonly placeholder="참고항목" value="<%=lv.getLextraaddr()%>">
                                </td>
                     </tr>
                     <tr>
                        <td>
                           	휴대폰 번호
                        </td>                     
                        <td>
                           <select name="phone1" id="phone1">
                              <%
                                 if(lTelArray[0].equals("010")){
                                    %>
                                    <option selected>010</option>
                                    <%
                                 }else if(lTelArray[0].equals("011")){
                                    %>
                                    <option selected>011</option>
                                    <%
                                 }else{
                                    %>
                                    <option selected>018</option>
                                    <% 
                                 }   
                              %>
                                    
                              
                              
                              <option>010</option>
                              <option>011</option>
                              <option>018</option>
                           </select> -
                           <input name="phone2" id="phone2" size="5" maxlength="4" value="<%= lTelArray[1]%>"> - <input name="phone3" id="phone3" size="5" maxlength="4" value="<%= lTelArray[2]%>">
                        </td>   
                     </tr>
                     <tr>   
                        <td>
                         	업체명
                        </td>
                        <td>
                           <input name="modicomname" id="modicomname" size="10"  maxlength= "9" value="<%=lv.getLcomname() %>" >
                        </td>
                     
                     </tr>
                     <tr>
                        <td>
                         	사업자번호
                        </td>
                        <td>
                           <input name="lnumber1" size="4" maxlength="3" value ="<%=lNumberArray[0] %>"> - <input name="lnumber2" size="4" maxlength="2" value ="<%=lNumberArray[1] %>"> - <input name="lnumber3" size="4" maxlength="4" value ="<%=lNumberArray[2] %>">
                        </td>
                     </tr>
                     
                     <tr>
                                <td id="jointd">
                                <input type="button" value="변경하기" onclick="inputCheck02()">
                        </td>
                            </tr>
                  </table>   
               </form>   
            </fieldset>
            </c:if>
           
           <!----------------->
           <c:if test="${userType eq 'L' }">
            <fieldset name="joinfed">
               <form name="regFrm02" value="licensee">
                  <input type = "hidden" name="lidx" value="<%=lv.getLidx()%>">
                  <table>
                     <tr>
                                <td width="19%;">아이디</td>
                                <td><input id="modiid" name="modiid" size="15" disabled style="background:white; border:1px solid black;" value="<%= lv.getLid()%>"> 
                                <!-- onClick로 입력한 아이디가 중복된 값인지 확인 -->
                            </tr>
                     <tr>
                        <td>
                          	비밀번호
                        </td>
                        <td>
                           <input  type="password" name="modipwd" id="modipwd">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           	비밀번호 확인
                        </td>
                        <td>
                           <input  type="password" name="modipwdcheck" id="modipwdcheck"><span id="same"></span>
                        </td>
                     </tr>
                     
                     <tr>
                        <td>
                          	이름
                        </td>
                        <td>
                           <input name="name" name="name" size="15" disabled style="background:white; border:1px solid black;" value="<%= lv.getLname()%>">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           	주민등록번호
                        </td>
                        <td>
                           <input name="birthday"  size="8" maxlength="6" disabled style="background:white; border:1px solid black;" value = "<%= lJuminArray[0]%>"> - 
                           <input type="password" name="birthday2" size="8"  maxlength="7" disabled style="background:white value="<%= lJuminArray[1] %>">
                        </td>
                     </tr>
                     <tr>
                        <td>
                          	 이메일
                        </td>
                        <td>
                           <input name="modiemail" id="modiemail" size="20" value="<%= lEmailArray[0]%>"> @   
                           <select name="modiemail2">
                              <%
                                 if(lEmailArray[1].equals("naver.com")){
                                    %>
                                    <option selected>naver.com</option>
                                    <%
                                 }else if(lEmailArray[1].equals("nate.com")){
                                    %>
                                    <option selected>nate.com</option>
                                    <%
                                 }else if(lEmailArray[1].equals("daum.com")){
                                    %>
                                    <option selected>daum.net</option>
                                    <% 
                                 }else if(lEmailArray[1].equals("google.com")){
                                    %>
                                    <option selected>google.com</option>
                                    <% 
                                 }      
                              %>
                              <option >naver.com</option>
                              <option >nate.com</option>
                              <option >daum.com</option>
                              <option >google.com</option>
                              
                           </select>
                           
                           
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span>*</span>우편번호
                        </td>
                                <td>
                           <input type="text" id="sample4_postcode" name="sample4_postcode"  readonly placeholder="우편번호" value="<%=lv.getLpostcode()%>">
                                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                  <input type="text" id="sample4_roadAddress" name="sample4_roadAddress" readonly placeholder="도로명주소" value="<%=lv.getLroadaddr()%>">
                                   <input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" readonly placeholder="지번주소" value="<%=lv.getLjibunaddr()%>"><br>
                                   <span id="guide" name="guide" style="color:#999;display:none"></span>
                                   <input type="text" id="sample4_detailAddress" name="sample4_detailAddress" placeholder="상세주소" value="<%=lv.getLdetailaddr()%>">
                                    <input type="text" id="sample4_extraAddress" name="sample4_extraAddress" readonly placeholder="참고항목" value="<%=lv.getLextraaddr()%>">
                                </td>
                     </tr>
                     <tr>
                        <td>
                           	휴대폰 번호
                        </td>                     
                        <td>
                           <select name="phone1" id="phone1">
                              <%
                                 if(lTelArray[0].equals("010")){
                                    %>
                                    <option selected>010</option>
                                    <%
                                 }else if(lTelArray[0].equals("011")){
                                    %>
                                    <option selected>011</option>
                                    <%
                                 }else{
                                    %>
                                    <option selected>018</option>
                                    <% 
                                 }   
                              %>
                                    
                              
                              
                              <option>010</option>
                              <option>011</option>
                              <option>018</option>
                           </select> -
                           <input name="phone2" id="phone2" size="5" maxlength="4" value="<%= lTelArray[1]%>"> - <input name="phone3" id="phone3" size="5" maxlength="4" value="<%= lTelArray[2]%>">
                        </td>   
                     </tr>
                     <tr>   
                        <td>
                         	업체명
                        </td>
                        <td>
                           <input name="modicomname" id="modicomname" size="10"  maxlength= "9" value="<%=lv.getLcomname() %>" >
                        </td>
                     
                     </tr>
                     <tr>
                        <td>
                         	사업자번호
                        </td>
                        <td>
                           <input name="lnumber1" size="4" maxlength="3" value ="<%=lNumberArray[0] %>"> - <input name="lnumber2" size="4" maxlength="2" value ="<%=lNumberArray[1] %>"> - <input name="lnumber3" size="4" maxlength="4" value ="<%=lNumberArray[2] %>">
                        </td>
                     </tr>
                     
                     <tr>
                        <td id="jointd">
                        <input type="button" value="변경하기" onclick="inputCheck02()">
                        </td>
                     </tr>
                  </table>   
               </form>   
            </fieldset>
            </c:if>
         
      		<c:if  test ="${userType eq 'M' }" >
            <form name="regFrm2" id="regFrm2" >
               <fieldset name="dropuser">
                  <table class="dropusertb">
                     <input type="hidden" name="midx" value ="<%=mv.getMidx() %>">
                     <tr>
                        <td>비밀번호</td>
                        <td style="margin-left:7%;"><input type="password" size=24 maxlength=18 id="dpwd" name="dpwd"></td>
                        <td style="margin-left:3%;"><button type="button" onclick="deleteAction()">확인</button></td>
                     </tr>
                  </table>
               </fieldset>
            </form>
        	</c:if>
        	<c:if test="${userType eq 'L'}">
            <form name="regFrm2" id="regFrm2" >
               <fieldset name="dropuser">
                  <table class="dropusertb">
                     <input type="hidden" name="lidx" value ="<%=lv.getLidx() %>">
         
                     <tr>
                        <td>비밀번호</td>
                        <td style="margin-left:7%;"><input type="password" size=24 maxlength=18 id="dpwd" name="dpwd"></td>
                        <td style="margin-left:3%;"><button type="button" onclick="deleteAction()">확인</button></td>
                     </tr>
                  </table>
               </fieldset>
            </form>
        	</c:if>
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
					점심시간 : PM12 :00 ~ PM 1 : 00<br/>
					고객센터 : AM 10: 00 ~ PM6 : 00<br/>
				</div>
			</div>	
		</footer>
	</body>
</html>