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
		<title>Ŀ�´�Ƽ ��</title>
		<!-- title ������ -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/admincommunitydetail.css" rel="stylesheet" type="text/css" />
		<!-- ������ -->
		<link href="<%= request.getContextPath() %>/css/rp.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv" id="herdiv2">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv" id="logdiv_2"><%= loginname %></div>
				<div class="logdiv2" id="logodiv_2">
				<a href="<%= request.getContextPath() %>/Common/main.do">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">�α׾ƿ�</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >������ ��������</div>
			<div>
				<div class="navuser">��ǰ���� ��</div>
				<div class="navuser_1">
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_1">�п�����</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_2">���ǰ���</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_3">����������</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_4">���������</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_5">Ŀ�´�Ƽ ����</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_6">������</a><br>
				</div>
			</div>
		</nav>
		<nav>
			<div class="adminmenu">
				<div class="subnav" id="subnav1">ȸ������</div>
				<div class="subnav" id="subnav2" style="background:#FA5858;">��ǰ����</div>
				<div class="subnav" id="subnav3">�ֹ�����</div>
				<div class="subnav" id="subnav4">�Խ��ǰ���</div>
				<div class="subnav" id="subnav5">����������</div>
				<div class="subnav" id="subnav6">��Ÿ����</div>
			</div>
			
			<div class="adminmenu4" id="senagogo2">
				<div class="subnav4" id="subnav2_1">ȸ������</div>
				<div class="subnav4" id="subnav2_2" style="background:#FA5858;">��ǰ����</div>
				<div class="subnav4" id="subnav2_3">�ֹ�����</div>
				<div class="subnav4" id="subnav2_4">�Խ��ǰ���</div>
				<div class="subnav4" id="subnav2_5">����������</div>
				<div class="subnav4" id="subnav2_6">��Ÿ����</div>
			</div>
		</nav>
		<section>
			<article>
				<form class="cmnfrm">
					<div class="cmnul">����</div>
					<ul id="titleli"><br>
						<li style="width:150px;">��ȣ</li>
						<li style="width:150px;">�ۼ���</li>
						<li style="width:510px;">����</li>
						<li style="width:200px;">�ۼ���¥</li>
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
						<li style="width:150px;">÷������</li>
						<li colspan=4 style="width:863px;"><%=civ.getCofile() %></li>
					</ul>
					<button type="button" id="listbtn3">���</button>
					<button type="button" id="delbtn2">����</button>
				</form>
			</article>
		</section>	
	</body>
</html>	