<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  
	String loginname = (String)session.getAttribute("loginname");
%>     
<!DOCTYPE html>
<html>
	<head>
		<title>荐碍乞惑技</title>
		<!-- title 酒捞能 -->
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/webimage/titlelogo.png">
		<link href="<%= request.getContextPath() %>/css/adminmain.css" rel="stylesheet" type="text/css" />
		<link href="<%= request.getContextPath() %>/css/adminmembermanage.css" rel="stylesheet" type="text/css" />
		<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%= request.getContextPath() %>/js/admin.js"></script>
		<link href="<%= request.getContextPath() %>/css/adminreviewdetail.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<header>
			<div class="herdiv">
				<div class="logodiv"><img src="<%= request.getContextPath() %>/webimage/edupick2.jpg"></div>
				<div class="logdiv"><%=loginname %>(丛)</div>
				<div class="logdiv2">
				<a href="俊掂侨.html">Home</a>
				<a href="<%= request.getContextPath() %>/Common/logout.do">肺弊酒眶</a>
				</div>
			</div>
		</header>
		<nav class="nav">
			<div class="admin" >包府磊 拌沥包府</div>
			<div>
				<div class="navuser">惑前包府 ″</div>
				<div class="navuser_1">
					<a href="惑前包府.html" id="navuser_1_1">切盔包府</a><br>
					<a href="惑前包府.html" id="navuser_1_2">碍狼包府</a><br>
					<a href="惑前包府.html" id="navuser_1_3">荐碍积包府</a><br>
					<a href="惑前包府.html" id="navuser_1_4">荐碍乞包府</a><br>
					<a href="惑前包府.html" id="navuser_1_5">目孤聪萍 包府</a><br>
					<a href="惑前包府.html" id="navuser_1_6">惑淬包府</a><br>
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
		</nav>
		<section>
			<article>
				<form class="starfrm">
						<table class="startable">
							<tr>
								<th width="100px" height="68px">切盔疙</th>
								<td height="68px"><input type="text" value="捞哩IT" disabled></td>
								<th width="100px" height="68px">碍狼疙</th>
								<td height="68px"><input type="text" value="亥摹橇饭胶窍扁" disabled></td>
							</tr>
							<tr>
								<th height="68px">盒幅</th>
								<td><input type="text" value="秋芒" disabled></td>
								<th height="68px">累己老</th>
								<td><input type="text" value="2021-02-22" disabled></td>
							</tr>
							<tr>
								<th>郴侩</th>
								<td colspan=3><textarea disabled>抛胶飘涝聪促.</textarea></td>
							</tr>
						</table>
						<table class="startable2">
							<tr>
								<th rowspan=5 height=90% width=25%>荐碍乞府胶飘</th>
								<td width=10%>≮≮≮</td>
								<td width=50% height="100px">弊钒历钒 亮匙夸.</td>
								<td width=5%><button type="button" id="delbtn">昏力</button></td>
								<td width=10%>滚芭欧</td>
								
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">昏力</button></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">昏力</button></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">昏力</button></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td height="100px"></td>
								<td width=5%><button type="button" id="delbtn">昏力</button></td>
								<td></td>
							</tr>
							<tr>
								<th>荐碍乞</th>
								<td width="500px" height="100px" colspan=3><input type="text" id="textbox2"></td>
								<td width="120px;" style="border-top:1px solid white;"><button type="button" id="submit2">殿废</button></td>
							</tr>
						</table>
						<button type="button" id="starbtn">格废</button>
					</form>
			</article>
		</section>
	</body>
</html>					