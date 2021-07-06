<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디찾기</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Song+Myung&display=swap" rel="stylesheet">
	  	<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script> 
		<script src="<%= request.getContextPath() %>/js/findaction.js"></script>
		<script src="<%= request.getContextPath() %>/js/find.js"></script>
		<link href="<%= request.getContextPath() %>/css/find.css" rel="stylesheet" type="text/css" />	
		<%-- <script src="<%= request.getContextPath() %>/js/isFind.js"></script> --%>
	</head>
	<body>
	  <h1>정보찾기</h1>
      <form name="findFrm">
         <div class="main">
            <input id="tab1" type="radio" name="tabs" id="id" value="id" checked> <!--디폴트 메뉴-->
            <label for="tab1">아이디찾기</label>

            <input id="tab2" type="radio" name="tabs" id="pwd" value="pwd">
            <label for="tab2">비밀번호찾기</label>                                                                                                                                                                                                                                                                                                                                             

                  
            <section id="content1">   
               <div class="idpwsh">
                  <div class="namesh1">
                     이   름 
                     : <input type="text" size=8 name="idname" id="idname">
                  </div>
                  <p>
                  <div class="undersh">
                     휴대전화 : <input type="text" size=11 maxlength=11 id="idtel" name="idtel"> 
                  </div>
                  <p>
                  <div class="btndivshce">
                  <button type="button" id="btnsh" onclick="findAction()">찾기</button>
                  <button type="button" id="btnsh_close" style="margin-left:3%;">닫기</button>
                  </div>
               </div>
            </section>
            <section id="content2">
            
               <div class="idsh">
                  아이디 : <input type="text" size=8 name="pwdid" id="pwdid">
               </div>
               <p>
               
               <div class="namesh2">
                  이 름 : <input type="text" size=8 name="pwdname" id="pwdname">
               </div>
               <p>
               <div class="undersh2">
                  주민등록번호 : <input type="text" size=3 maxlength=6 name="pwdjumin1" id="pwdjumin1"> - <input type="password" size=4 maxlength=7 name="pwdjumin2" id="pwdjumin2">
               </div>
               <p>
               <div class="btndivshce">
                  <button type="button" id="btnsh2" onclick="findAction2()">찾기</button>
                  <button type="button" id="btnsh_close2" style="margin-left:3%;">닫기</button>
               </div>      
            </section>
         </div>
      </form>   
	</body>
</html>
	
