<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "Domain.*" %>
 <%  
    String mName = (String)request.getAttribute("loginname");
    String lName = (String)request.getAttribute("loginname");
//	CourseVo cv = (CourseVo)request.getAttribute("cv");
	MemberVo mv = (MemberVo)request.getAttribute("mv");
%> 
<%  
   String loginname = (String)session.getAttribute("loginname");
%>    
<% ArrayList<InstituteVo> alist = (ArrayList<InstituteVo>)request.getAttribute("alist");
   PageMaker pm = (PageMaker)request.getAttribute("pm");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EduPick 학원검색 | 학원찾기</title>
      <!-- 폰트 -->
      <link rel="preconnect" href="https://fonts.gstatic.com">
      <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
      <!-- title 아이콘 -->
      <link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
      <!-- 기본틀 css -->
      <link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
      <!-- 메인 배너 css -->
      <link href="<%= request.getContextPath() %>/css/banner.css" rel="stylesheet" type="text/css" />
      <!-- 폰트 -->
      <link rel="preconnect" href="https://fonts.gstatic.com">
      <!-- 제이쿼리 -->
      <script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
      <!-- top 위로올리기 -->
      <link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
      <script src="<%= request.getContextPath() %>/js/top.js"></script>
      <!-- 메인 css -->
      <link href="<%= request.getContextPath() %>/css/edupickmain.css" rel="stylesheet" type="text/css" />
      <!-- 반응형 -->
      <link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
      <!-- 검색 css js -->
      <link href="<%= request.getContextPath() %>/css/edupicksearch.css" rel="stylesheet" type="text/css" />
      <script src="<%= request.getContextPath() %>/js/edupicksearch.js"></script>
      <link href="<%= request.getContextPath() %>/css/institute.css" rel="stylesheet" type="text/css" />
      <script src="<%= request.getContextPath() %>/js/institute.js"></script>
      <script> 
 	  	function Search(){
   			
 	  		if(frmsh.input01.value == 0){
   				alert("학원명을 입력해주세요.");
   				frmsh.input01.focus();
   			}else{
 	  			document.frmsh.action ="<%= request.getContextPath() %>/Institute/institute.do";
   				document.frmsh.method ="get";
   				document.frmsh.submit();
 	  		}
 	  	}	
   	  </script>
   </head>
   <body style="overflow-x:hidden; overflow-y:scroll;"> 
      <header>
         <!-- 메인로고 -->
         
         <div class="headerimg">
            <a href="<%= request.getContextPath() %>/Common/main.do">
            <img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">   
            </a>
         </div>       
         <c:if test="${not empty sessionScope.loginname && userType =='M'|| userType=='L' || userType=='A'}">
            <div class="logoutdiv">
               <%= loginname %> <a href="<%= request.getContextPath() %>/Common/logout.do">로그아웃</a><img src="<%= request.getContextPath() %>/webimage/알림.png" style="width:10%; height:10%;">
            </div>
         </c:if>
         <c:if test="${empty sessionScope.loginname}">
            <div class="lognbt" id="loginbtnmain">
               <a href="<%= request.getContextPath() %>/Common/login.do">로그인</a><br>
            </div>
         </c:if>
         <!-- 검색 폼 -->
          <form class="frmsh" id="frmsh" name="frmsh">
         	<input type="hidden" name="region">
         	<input type="hidden" name="subjects">
            <div class="search01">
               <input type="text" id="input01" name="input01" placeholder="학원명을 입력해주세요.">
               <button type="button" id="btn01" name="btn01" onclick="Search();"><img id="img4" src="<%= request.getContextPath() %>/webimage/search.jpg" ></button>
            </div>
         </form>
         <div id="topmenumain">
            <ul>
               <li>
                  <a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua" style="background:#FA5858">학원찾기</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua">공지사항</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Eduinformation/eduinformation.do" class="menua">교육정보</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Customerservice/customerservice.do" class="menua">고객센터</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua">My 서비스</a>
               </li>
            </ul>
         </div>
      </header>
      <section>
         <article>
            <div class="classD">
                <p id="ptag">
                <h5 class="box1">카테고리 나열</h5>  
				<%-- <input type="hidden" name="piidx" value="<%=piidx%>">   --%>
                <table class="t2" border="3px solid black" width="800px" height="500px">
                  <tr>
                     <td>학원 대표 사진</td>
                     <td>학원명</td>
                     <td>학원 위치</td>
                     <td>최소수강비 ~ 최대수강비</td>
                     <td>과목나열</td>
                     <td>전화번호</td>
                  </tr>
                  
                  <%for(InstituteVo iv : alist){ %>
                  <tr>
                     <td><img src="<%=request.getContextPath()%>/filefolder/s-<%=iv.getIfile()%>"></td>
                     <td id="subjecthover_1"><a href="<%= request.getContextPath()%>/Institute/instituteDetail.do?iidx=<%=iv.getIidx()%>"><%=iv.getIname() %></a></td>
                     <td id="subjecthover_2"><a href="<%= request.getContextPath()%>/Institute/instituteDetail.do?iidx=<%=iv.getIidx()%>"><%=iv.getIroadaddr() %>, <%=iv.getIdetailaddr() %></a></td>
                     <td><%=iv.getImin() %> 원 ~ <%=iv.getImax() %> 원 </td>
                     <td><%=iv.getIsubjects() %></td>
                     <td><%=iv.getItel() %></td>
                  </tr>
                  <% }%>   
               </table>
               </div>
            </div>
         </article>
      </section>
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