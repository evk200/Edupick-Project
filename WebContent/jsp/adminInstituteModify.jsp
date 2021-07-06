<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>       

<% InstituteVo iv = (InstituteVo)request.getAttribute("iv"); %>    
<% String loginname = (String)session.getAttribute("loginname"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학원수정</title>
		<!-- title 아이콘 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/admininstituteadd.css" rel="stylesheet" type="text/css" />
		<!-- 반응형 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
		 <script>
         function fnUpload(){
            $('#fileUpload').click();
            
         }
         function remover(){
        	 var url = '<%= request.getContextPath() %>';
        	 var str = '';
        	 str += '<input type="hidden" id="fileNm" name="fileNm" readonly/>'
             str += '<a id="imageUpload" href="javascript:fnUpload();"><img src="'+url+'/webimage/더하기.png" /></a><br>사진을 추가해주세요'
        	 $('.addimg').html('  <a id="imageUpload" href="javascript:fnUpload();"><img src="'+url+'/webimage/더하기.png" /></a><br>사진을 추가해주세요');
         }
   	 	 function readURL() {
   	 		var input = document.getElementById("fileUpload");
   	 	alert(input.value);
   			if (input.files && input.files[0]) {
   			   var reader = new FileReader();
   	  		   reader.onload = function (e) {
   	  		   $('.addimg').html("<img src='"+e.target.result+"' width='100'><br><button type='button' onclick='remover()'>삭제</button>");  
	   	 	}
	   	  
	   	 	 reader.readAsDataURL(input.files[0]);
	   	  }
	   	}
   	 
   		$(document).ready(function(){
		   	$("#fileUpload").change(function(){
		   	    readURL();
		   	}); 
   		});
   		
   		function check(){
			if (document.addfrm.iname.value == ""){
				alert("학원명을 입력하세요.");
				document.addfrm.iname.focus();
				return;
			}else if (document.addfrm.sample4_postcode.value == "") {
				alert("주소를 입력해주세요.");
				document.addfrm.sample4_postcode.focus();
				return;
			}else if (document.addfrm.sample4_detailAddress.value == "") {
				alert("상세 주소를 입력하세요.");
				document.addfrm.sample4_detailAddress.focus();
				return;
			}else if (document.addfrm.itel2.value == "") {
				alert("휴대폰 번호를 입력하세요.");
				document.addfrm.itel2.focus();
				return;
			}else if (document.addfrm.itel3.value == "") {
				alert("휴대폰 번호를 입력하세요.");
				document.addfrm.itel3.focus();
				return;
			}else if (document.addfrm.imin.value == "") {
				alert("최소 수강비를 입력하세요.");
				document.addfrm.imin.focus();
				return;
			}else if (document.addfrm.imax.value == "") {
				alert("최대 수강비를 입력하세요.");
				document.addfrm.imax.focus();
				return;
			}
			alert("등록합니다.");
			document.addfrm.action="<%=request.getContextPath() %>/Admin2/adminInstituteModifyAction.do";
			document.addfrm.method="post";
			document.addfrm.enctype="multipart/form-data";
			document.addfrm.submit();
			
			
			return;
		}
   		</script>
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
               <a href="<%=request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_1" style="background:#FA5858;">학원관리</a><br>
               <a href="<%=request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_2">강의관리</a><br>
               <a href="<%=request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_3">수강생관리</a><br>
               <a href="<%=request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_4">수강평관리</a><br>
               <a href="<%=request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_5">커뮤니티 관리</a><br>
               <a href="<%=request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_6">상담관리</a><br>
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
         
            <form name="addfrm" class="addfrm">
            	<input type="hidden" name="iidx" value="<%=iv.getIidx()%>">
              <input type="file" id="fileUpload" name="fileUpload" style="display:none" onchange=""/>
               <div>
                  <div class="addimg">
                     <input type="hidden" id="fileNm" name="fileNm" readonly/>
                     <a id="imageUpload" href="javascript:fnUpload();"><img src="<%= request.getContextPath() %>/webimage/더하기.png" /></a><br>사진을 추가해주세요
                  </div>                  
               </div>
               
               <div class="clinfo">
               
                  <div class="clinfo_1">
                     <ul>
                        <li>학원명 : <input type="text" size=20 name="iname" value="<%=iv.getIname()%>"></li>
                           <li style="height:180px;">학원위치 : <br>             
                              <input type="text" id="sample4_postcode" name="sample4_postcode" value="<%=iv.getIpostcode()%>"  readonly placeholder="우편번호">
                                     <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                     <input type="text" id="sample4_roadAddress" name="sample4_roadAddress" value="<%=iv.getIroadaddr()%>" readonly placeholder="도로명주소">
                                      <input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" value="<%=iv.getIjibunaddr()%>" readonly placeholder="지번주소"><br>
                                      <span id="guide" name="guide" style="color:#999;display:none"></span>
                                      <input type="text" id="sample4_detailAddress" name="sample4_detailAddress" value="<%=iv.getIdetailaddr()%>" placeholder="상세주소">                                                                       
                                       <input type="text" id="sample4_extraAddress" name="sample4_extraAddress" value="<%=iv.getIextraaddr()%>" placeholder="참고항목">
                           </li>
                        <li>학원 연락처 : 
                        <select id="itel1" name="itel1" style="width:50px;">
                             <option>02</option>
                             <option>051</option>
                             <option>053</option>
                             <option>032</option>
                             <option>062</option>
                             <option>042</option>
                             <option>052</option>
                             <option>044</option>
                             <option>031</option>
                             <option>033</option>
                             <option>043</option>
                             <option>041</option>
                             <option>063</option>
                             <option>061</option>
                             <option>054</option>
                             <option>055</option>
                             <option>064</option>
                        </select> -
                           <input type="text" id="itel2" name="itel2" size="4" maxlength="3"> - <input type="text" id="itel3" name="itel3" size="5" maxlength="4">    
                        </li>
                     </ul>
                  </div>
                  
                  <div class="clinfo_2">
                     <ul style="margin-top:80px;">
                        <li>과목 카테고리 : 
                           <select name="isubjects">
                              <option>국어</option>
                              <option>수학</option>
                              <option>영어</option>
                              <option>사회</option>
                              <option>과학</option>
                              <option>음악</option>
                              <option>미술</option>
                              <option>체육</option>
                              <option>컨설팅</option>
                              <option>논술</option>
                              <option>재수</option>
                              <option>종합</option>
                              <option>제2외국어</option>
                           </select>
                        </li>
                        <li>편의사항 : <input type="text" name="ineeds" value="<%=iv.getIneeds()%>"></li>
                        <li>최소 수강비 : <input type="number" name="imin" value="<%=iv.getImin()%>">원</li>
                        <li>최대 수강비 : <input type="number" name="imax" value="<%=iv.getImax()%>">원</li>
                     </ul>
                  </div>
               </div>
               <div class="maininfo">
                  <div>학원 설명</div>
                  <textarea name="iintroduce"><%=iv.getIintroduce() %></textarea>
               </div>
              
               <div class="subbtn">
               <button type="button" onclick="check()">등록하기</button>
               </div>
            </form>
         </article>
      </section>
   </body>
</html>