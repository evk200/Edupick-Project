<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "service.*" %>     
<%@ page import = "Domain.*" %>
<%@ page import = "controller.*" %>         
<% String loginname = (String)session.getAttribute("loginname"); %>  
<% InstituteVo iv = (InstituteVo)request.getAttribute("iv"); %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>�п���</title>
		<!-- title ������ -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<!-- ��Ʈ -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/admininstitutedetail.css" rel="stylesheet" type="text/css" />
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
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_1" style="background:#FA5858;">�п�����</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_2">���ǰ���</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_3">����������</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_4">���������</a><br>
					<a href="<%= request.getContextPath() %>/Admin2/adminProductManage.do" id="navuser_1_5">Ŀ�´�Ƽ ����</a><br>
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
			
			<div class="adminmenu4">
				<div class="subnav3" id="subnav2_1">ȸ������</div>
				<div class="subnav3" id="subnav2_2" style="background:#FA5858;">��ǰ����</div>
				<div class="subnav3" id="subnav2_3">�ֹ�����</div>
				<div class="subnav3" id="subnav2_4">�Խ��ǰ���</div>
				<div class="subnav3" id="subnav2_5">����������</div>
				<div class="subnav3" id="subnav2_6">��Ÿ����</div>
			</div>
		</nav>
		<section>
			<article>
				<div class="clmain">
					<form>
						<input type="hidden" name="iidx" value="<%=iv.getIidx()%>">
						<div class="clmain1">
							<%if (iv.getIfile() == null) { 
								out.print("�̹����� ���ų� ���� �Դϴ�."); %>
							<%} else {%>
							<img id="mainbanner" src="<%=request.getContextPath()%>/filefolder/<%=iv.getIfile()%>">
							<%} %>
						</div>
						<div class="clmain2">
							<ul>
								<li style="line-height:100px;">�п��� : <%=iv.getIname() %></li>
								<li>�п���ġ : <br><%=iv.getIroadaddr() %><br><%=iv.getIdetailaddr() %><img src="B.jpg"><br><br></li>
								<li style="line-height:100px;">��ȭ��ȣ : <%=iv.getItel() %></li>
								<li style="line-height:50px;">�������� : <%=iv.getIsubjects() %></li>
								<li style="line-height:100px;">���ǻ��� : <%=iv.getIneeds() %></li>
							</ul>
						</div>
						<div class="clmain3" style="text-align:center;">
							<div style="border-bottom:1px solid black;">
								<span>�п� �Ұ�</span>
							</div>
							<%=iv.getIintroduce() %>
						</div>
						<div class="clmainsub">
							<button type="button" id="clmodi"><a href="/edupick/Admin2/adminInstituteModify.do?iidx=<%=iv.getIidx()%>">����</a></button>
							<button type="button" id="cllist">���</button>
						</div>
					</form>
				</div>
			</article>
		</section>
	</body>
</html>