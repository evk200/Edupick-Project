<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>
<%@ page import = "Domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
   String mName = (String)request.getAttribute("loginname");
   String lName = (String)request.getAttribute("loginname");
%>
<%  
   String loginname = (String)session.getAttribute("loginname");
	int mpoint = (int)request.getAttribute("mpoint");
%>

<html>
   <head>
      <meta charset="UTF-8">
      <title>EduPick 학원검색 | 학원찾기</title>
      <link rel="preconnect" href="https://fonts.gstatic.com">
      <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
      <link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
      <link href="<%= request.getContextPath() %>/css/edupick.css" rel="stylesheet" type="text/css" />
      <link href="<%= request.getContextPath() %>/css/banner.css" rel="stylesheet" type="text/css" />
      <link rel="preconnect" href="https://fonts.gstatic.com">
      <script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
      <script type="text/javacript" src="<%= request.getContextPath() %>/js/pagepush.js"></script>
      <link href="<%= request.getContextPath() %>/css/top.css" rel="stylesheet" type="text/css" />
      <script src="<%= request.getContextPath() %>/js/top.js"></script>
      <link href="<%= request.getContextPath() %>/css/edupickmain.css" rel="stylesheet" type="text/css" />
      <link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
      <link href="<%= request.getContextPath() %>/css/edupicksearch.css" rel="stylesheet" type="text/css" />
      <link href="<%= request.getContextPath() %>/css/edupickla.css" rel="stylesheet" type="text/css" />
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
   	  <script>
   	  	function block(){
   	  		
   	  		var loginname = '<%=(String)session.getAttribute("loginname") %>';
   	  		
   	  		if(loginname == 'null'){
   	  			alert("로그인이 필요한 항목입니다. 로그인 페이지로 이동합니다.");
   	  		    location.replace("/edupick/Common/login.do");
   	  			
   	  		}else{
   	  			alert("오류");
   	  			location.replace("/edupick/Myservice/myservice.do");
   	  			
   	  		}
   	  		
   	  	}  	  
   	  </script>
   </head>
   <body style="overflow-x:hidden; overflow-y:scroll;"> 
      <header>
         <div class="headerimg">
            <a href="#">
            <img class="img1" src="<%= request.getContextPath() %>/webimage/edupick2.jpg">   
            </a>
         </div>
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
                  <a href="<%= request.getContextPath() %>/Institute/institute.do" class="menua">학원찾기</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Notice/notice.do" class="menua">공지사항</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Eduinformation/eduinformation.do" class="menua">교육정보</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Customerservice/customerservice.do" class="menua" >고객센터</a>
               </li>
               <li>
                  <a href="<%= request.getContextPath() %>/Myservice/myservice.do" class="menua" >My 서비스</a>
               </li>
            </ul>
         </div>
      </header>
      <section>
         <article>
           <c:if test="${empty sessionScope.loginname}">
            <div class="imgbanner">
               <a href="http://localhost:8090/edupick/Notice/noticedetail.do?nidx=23"><img src="<%= request.getContextPath() %>/webimage/event11.jpg" id="img5"></a>
               <img src="<%= request.getContextPath() %>/webimage/event22.jpg" id="img5_2">
               <span id="movebanner">◀</span>
               <span id="movebanner2">▶</span>
            </div>
            <div class="imgbanner2">
               <img src="<%= request.getContextPath() %>/webimage/event33.jpg" id="img5">
               <img src="<%= request.getContextPath() %>/webimage/event44.jpg" id="img5_2">
               <span id="movebanner3">◀</span>
               <span id="movebanner4">▶</span>
            </div>
            <div class="imgbanner3">
               <img src="<%= request.getContextPath() %>/webimage/event55.jpg" id="img5">
               <span id="movebanner5">◀</span>
               <span id="movebanner6">▶</span>
            </div>
            <div class="login">
               <div class="lognbt">
                  <img id="img6" src="<%= request.getContextPath() %>/webimage/login1.jpg">
                  <a href="<%= request.getContextPath() %>/Common/login.do">로그인</a><br>
               </div>
               <div>
                  <img id="img7" src="<%= request.getContextPath() %>/webimage/login2.jpg">
                  <a href="<%= request.getContextPath() %>/Common/joinstart.do" style="font-size:20px;">회원가입</a><br>
               </div>
               <div>
                  <img id="img8" src="<%= request.getContextPath() %>/webimage/login3.jpg">
                  <a href="<%= request.getContextPath() %>/Common/find.do" >아이디 찾기 | 비밀번호 찾기</a>
               </div>
            </div>
            <div class="subbanner_main">
               수강생들이 Pick한 Hot Place
               <img id="img9" src="<%= request.getContextPath() %>/webimage/com.png">
            </div>
            </c:if>
            
            <c:if test="${not empty sessionScope.loginname && sessionScope.userType.equals('M')}">
            <div class="imgbanner">
               <a href="http://localhost:8090/edupick/Notice/noticedetail.do?nidx=23"><img src="<%= request.getContextPath() %>/webimage/event11.jpg" id="img5"></a>
               <img src="<%= request.getContextPath() %>/webimage/event22.jpg" id="img5_2">
               <span id="movebanner">◀</span>
               <span id="movebanner2">▶</span>
            </div>
            <div class="imgbanner2">
               <img src="<%= request.getContextPath() %>/webimage/event33.jpg" id="img5">
               <img src="<%= request.getContextPath() %>/webimage/event44.jpg" id="img5_2">
               <span id="movebanner3">◀</span>
               <span id="movebanner4">▶</span>
            </div>
            <div class="imgbanner3">
               <img src="<%= request.getContextPath() %>/webimage/event55.jpg" id="img5">
               <span id="movebanner5">◀</span>
               <span id="movebanner6">▶</span>
            </div>
            <div class="loginafter" style="min-height:160px; max-height:160px;">
               <div class="lofer1">
                  <img src="<%= request.getContextPath() %>/webimage/user.png" name = loginname id="userimg1"><%=loginname %> 님 
                  <img src="<%= request.getContextPath() %>/webimage/login4.jpg" id="userimg2">                  
                  <button type="button" onclick="location.href='<%= request.getContextPath() %>/Common/logout.do'" style="background:white;">로그아웃</button><br>
                  <a href="<%= request.getContextPath() %>/Common/Modify.do" id="modify">회원정보 수정</a><img src="<%= request.getContextPath() %>/webimage/login3.jpg" style="width:10%; height:20%;">
               </div>
               <div class="lofer2">
                  <div class="mypoint">Mypoint</div><img src="<%= request.getContextPath() %>/webimage/point.png" style="width:7%; height:20px; float:right; margin-top:-25px;">
               </div>
               
               <div id="point">
						<%=mpoint%>
				</div>
            </div>
            <div class="subbanner_main">
					수강생들이 Pick한 Hot Place
					<img id="img9" src="<%= request.getContextPath() %>/webimage/com.png">
				</div>
				<div class="quizdiv">
					<a href="#" onclick="window.open('<%= request.getContextPath()%>/Member/Quiz.do','window','width=580,height=300,left=670,top=400,resizable=no,scrollbars=no');return false"><img src="<%= request.getContextPath() %>/webimage/quiz.png" style="width:60px; height:60px;">오늘의 퀴즈</a><br>					
				</div>
				</c:if>
            
            <c:if test="${not empty sessionScope.loginname && sessionScope.userType.equals('L')  && sessionScope.lgrade.equals('L')}">
            <div class="imgbanner">
               <a href="http://localhost:8090/edupick/Notice/noticedetail.do?nidx=23"><img src="<%= request.getContextPath() %>/webimage/event11.jpg" id="img5"></a>
               <img src="<%= request.getContextPath() %>/webimage/event22.jpg" id="img5_2">
               <span id="movebanner">◀</span>
               <span id="movebanner2">▶</span>
            </div>
            <div class="imgbanner2">
               <img src="<%= request.getContextPath() %>/webimage/event33.jpg" id="img5">
               <img src="<%= request.getContextPath() %>/webimage/event44.jpg" id="img5_2">
               <span id="movebanner3">◀</span>
               <span id="movebanner4">▶</span>
            </div>
            <div class="imgbanner3">
               <img src="<%= request.getContextPath() %>/webimage/event55.jpg" id="img5">
               <span id="movebanner5">◀</span>
               <span id="movebanner6">▶</span>
            </div>
            <div class="loginafter"">
               <div class="lofer1">
                  <img src="<%= request.getContextPath() %>/webimage/user.png" name = loginname id="userimg1"><%=loginname %> 님 
                  <img src="<%= request.getContextPath() %>/webimage/login4.jpg" id="userimg2">                  
                  <button type="button" onclick="location.href='<%= request.getContextPath() %>/Common/logout.do'" style="background:white;">로그아웃</button><br>
                  <a href="<%= request.getContextPath() %>/Admin/admin.do">관리하기</a>
                  <a href="<%= request.getContextPath() %>/Common/Modify.do" id="modify">회원정보 수정</a><img src="<%= request.getContextPath() %>/webimage/login3.jpg" style="width:10%; height:20%;">
               </div>
            </div>
            <div class="subbanner_main">
               수강생들이 Pick한 Hot Place
               <img id="img9" src="<%= request.getContextPath() %>/webimage/com.png">
            </div>
            <div class="quizdiv">
              <a href="#" onclick="window.open('<%= request.getContextPath()%>/Member/Quiz.do','window','width=580,height=300,left=670,top=400,resizable=no,scrollbars=no');return false"><img src="<%= request.getContextPath() %>/webimage/quiz.png" style="width:60px; height:60px;">오늘의 퀴즈</a><br>
            </div>
            </c:if>
            
            
            <c:if test="${not empty sessionScope.loginname && sessionScope.userType.equals('L')  && sessionScope.lgrade.equals('A')}">
            <div class="imgbanner">
               <a href="http://localhost:8090/edupick/Notice/noticedetail.do?nidx=23"><img src="<%= request.getContextPath() %>/webimage/event11.jpg" id="img5"></a>
               <img src="<%= request.getContextPath() %>/webimage/event22.jpg" id="img5_2">
               <span id="movebanner">◀</span>
               <span id="movebanner2">▶</span>
            </div>
            <div class="imgbanner2">
               <img src="<%= request.getContextPath() %>/webimage/event33.jpg" id="img5">
               <img src="<%= request.getContextPath() %>/webimage/event44.jpg" id="img5_2">
               <span id="movebanner3">◀</span>
               <span id="movebanner4">▶</span>
            </div>
            <div class="imgbanner3">
               <img src="<%= request.getContextPath() %>/webimage/event55.jpg" id="img5">
               <span id="movebanner5">◀</span>
               <span id="movebanner6">▶</span>
            </div>
            <div class="loginafter" style="height:220px;">
               <div class="lofer1">
                  <img src="<%= request.getContextPath() %>/webimage/user.png" name = loginname id="userimg1"><%=loginname %> 님 
                  <img src="<%= request.getContextPath() %>/webimage/login4.jpg" id="userimg2">                  
                  <button type="button" onclick="location.href='<%= request.getContextPath() %>/Common/logout.do'" style="background:white;">로그아웃</button><br>
                  <a href="<%= request.getContextPath() %>/Admin/admin.do">관리하기</a>
               </div>
            </div>
            <div class="subbanner_main">
               수강생들이 Pick한 Hot Place
               <img id="img9" src="<%= request.getContextPath() %>/webimage/com.png">
            </div>
            <div class="quizdiv">
              <a href="#" onclick="window.open('<%= request.getContextPath()%>/Member/Quiz.do','window','width=580,height=300,left=670,top=400,resizable=no,scrollbars=no');return false"><img src="<%= request.getContextPath() %>/webimage/quiz.png" style="width:60px; height:60px;">오늘의 퀴즈</a><br>
            </div>
            </c:if>
            <div class="subbanner">
            <div class="slideshow-container">
               <div class="mySlides fade">
                  <div class="numbertext">1 / 3</div>
                  <img src="<%= request.getContextPath() %>/webimage/ezenmain.jpg" style="width:800px; height:500px;">
                  <div class="text"></div>
               </div>
               <div class="mySlides fade">
                  <div class="numbertext">2 / 3</div>
                  <img src="<%= request.getContextPath() %>/webimage/CandC.jpg" style="width:800px; height:500px;">
                  <div class="text"></div>
               </div>
               <div class="mySlides fade">
                  <div class="numbertext">3 / 3</div>
                  <img src="<%= request.getContextPath() %>/webimage/park.jfif" style="width:800px; height:500px;">
                  <div class="text"></div>
               </div>
            </div>
            <br>
            <div style="text-align:center">
              <span class="dot"></span> 
              <span class="dot"></span> 
              <span class="dot"></span> 
            </div>
         </article>
      </section>
      <button onclick="topFunction()" id="scrollTopBtn" title="Go to top">▲TOP</button>
      <button onclick="topFunction()" id="scrollTopBtnMob" title="Go to top">▲Top</button>
      <footer>
         <hr class="hr02">
            <div class="footerdiv">
               <div>
                  <img id="img3" src="<%= request.getContextPath() %>/webimage/logo.jpg">
               </div>
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
               <div class="fer02">
                  ㈜ 에듀픽<br/>
                  주소 : 전라북도 전주시<br/>
                  대표조장 : 김학림 | 사업자등록번호 : 498-65-65421
               </div>
               <div class="ct01">
                  고객센터 : 1577-8888<br/>
                  <p/>
                  근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00<br/>
                  점심시간 : PM12 :00 ~ PM 1 : 00<br/>
                  고객센터 : AM 10: 00 ~ PM6 : 00<br/>
               </div>
            </div>   
      </footer>
      <script src="<%= request.getContextPath() %>/js/banner.js"></script>
   </body>
</html>