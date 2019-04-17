<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	session.setAttribute("name", "立即登录");
 %>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script src="js/jquery-1.11.0.js"></script>
  </head>  
  <body>
  <!-- 导航栏 -->
  <div style="width:100vw;height:7vw;position:fixed;z-index: 10000;background:#ffffff">
	<table width="100vw" height="7vw" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td align="center" valign="middle" width="15vw"><a href="/scout/Index.html"><img src="images/logo.jpg"  border="0" style="margin-left:10vw;widrh:5vw;height:5vw"/></a></td>
    <td width="85vw" height=7vw">   
	<div id="wrapper">
			<div id="nav-header" style="width:85vw;height:7vw">
					<nav style="width:70vw;height:7vw;margin-left:15vw;" >
						<ul>
							<li>
								<a href="#" class="home" style="color:#000000"><strong style="color:#333333">首页</strong></a>
							</li>
							<li class="careerpath">
								<a href="#"><strong style="color:#333333">设备借用</strong></a>
								
							</li>
							<li>
								<a href="javascript:;"><strong style="color:#333333">资产管理</strong></a><i class="slide-icon"></i>
								<div class="slide-submeu" >
									<a href="#" >固定资产</a>
									<a href="#" >易耗资产</a>
								</div>
							</li>
							<li>
								<a href="javascript:;"><strong style="color:#333333">设备维修</strong></a>
							
							</li>
							<li>
								<a href="javascript:;"><strong style="color:#333333">系统管理</strong></a><i class="slide-icon"></i>
								<div class="slide-submeu">
									<a href="#">部门管理</a>
                                    <a href="#">教师管理</a>
									<a href="#">系统重置</a>
								</div>
							</li>
							<li>
								<a href="#" style="color:#00caca;text-decoration: none;font-size:1vw;padding-left:5vw"><%=session.getAttribute("name") %></a>
							</li>
						</ul>
					</nav>
			</div>
  		</div>
 	</td>
 </div>
  </tr>
</table>
<div><img src="images/222.jpg" alt="" style="width:100vw;height:0.5vw"/></div>
</div>
<div style="width:100vw;height:7vw;background:#ffffff"></div>
<!-- 导航 -->
 
