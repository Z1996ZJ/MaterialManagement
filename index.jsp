<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>武科大信息中心设备管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />  
  </head>  
  <body>
  <!-- 导航栏 -->
  <jsp:include page="navbar.jsp">
  	<jsp:param value="#e95404" name="color"/>
  </jsp:include>
	<jsp:include page="lunbo.jsp"></jsp:include>
	<jsp:include page="list.jsp"></jsp:include>
	
	<jsp:include page="footer.jsp"></jsp:include>
    <br>
  </body>
</html>
