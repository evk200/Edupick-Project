<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>      
<% String loginname = (String)session.getAttribute("loginname"); %> 
<% CommunityVo civ = (CommunityVo)request.getAttribute("civ"); %>       
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>目孤聪萍 惑技</title>
		<!-- title 酒捞能 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/admincommunitydetail.css" rel="stylesheet" type="text/css" />
		<!-- 馆览屈 -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv" id="herdiv2">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv" id="logdiv_2"><%= loginname %></div>
				<div class="logdiv2" id="logodiv_2">
				<a href="<%= request.getContextPath() %>/Common/main.do">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">肺弊酒眶</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >包府磊 拌沥包府</div>
			<div>
				<div class="navuser">惑前包府 ″</div>
				<div class="navuser_1">
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_1">切盔包府</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_2">碍狼包府</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_3">荐碍积包府</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_4">荐碍乞包府</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_5">目孤聪萍 包府</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_6">惑淬包府</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">雀盔包府</div>
				<div class="subnav" id="subnav2" style="background:#FA5858;">惑前包府</div>
				<div class="subnav" id="subnav3">林巩包府</div>
				<div class="subnav" id="subnav4">霸矫魄包府</div>
				<div class="subnav" id="subnav5">其捞瘤包府</div>
				<div class="subnav" id="subnav6">扁鸥包府</div>
			</div>
			
			<div class="adminmenu4" id="senagogo2">
				<div class="subnav4" id="subnav2_1">雀盔包府</div>
				<div class="subnav4" id="subnav2_2" style="background:#FA5858;">惑前包府</div>
				<div class="subnav4" id="subnav2_3">林巩包府</div>
				<div class="subnav4" id="subnav2_4">霸矫魄包府</div>
				<div class="subnav4" id="subnav2_5">其捞瘤包府</div>
				<div class="subnav4" id="subnav2_6">扁鸥包府</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="cmnfrm">
					<div class="cmnul">夯臂</div>
					<ul id="titleli"><br>
						<li style="width:150px;">锅龋</li>
						<li style="width:150px;">累己磊</li>
						<li style="width:510px;">力格</li>
						<li style="width:200px;">累己朝楼</li>
					</ul>
					<ul>
						<li style="width:150px;"><%=civ.getCoidx() %></li>
						<li style="width:150px;"><%=civ.getCowrite() %></li>
						<li style="width:510px;"><%=civ.getCosubject() %></li>
						<li style="width:200px;"><%=civ.getCowriteday() %></li>
					</ul>
					<ul>
						<li colspan=5 style="width:1016px; height:200px;"><%=civ.getCocontent() %></li>
					</ul>
					<ul>
						<li style="width:150px;">梅何颇老</li>
						<li colspan=4 style="width:863px;"><%=civ.getCofile() %></li>
					</ul>
					<button type="button" id="listbtn3">格废</button>
					<button type="button" id="delbtn2">昏力</button>
				</form>
			</article>
		</section>	
	</body>
</html>	