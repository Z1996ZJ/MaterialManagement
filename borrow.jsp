<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="pagebean" class="mybean.data.Borrow_Bean" scope="session" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" type="text/css" href="css/zzj.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>武科大信息中心设备租借</title>
<style type="text/css">
<!--
body,td,th {
	font-size: xx-large;
	font-family: 宋体;
}
body {
	background-image:url(images/wkdj.jpg);
}
.STYLE2 {color: #FF0000}
-->
</style></head>
<body>
<p>
  <jsp:include page="navbar.jsp">
<jsp:param value="#e95404" name="color"/>      </jsp:include>
<br />
<jsp:setProperty name="pagebean" property="pagesize" param="pagesize" />
<jsp:setProperty name="pagebean" property="currentpage" param="currentpage" />
<%
	int column=6;
	String[] th={"事件编号","资产编号","借用人编号","借用时间","归还时间","事件类型"};
%>
<form id="form1" name="form1" method="post" action="insertServlet">
   <label></label>
   <p align="center">
     <label></label>
     <label>请选择资产类型
     <input type="radio" name="radiobutton" value="fixedassets" />
     固定资产</label>
     <label>
     <input type="radio" name="radiobutton" value="consumableassets" />
     易耗资产</label>
   </p>
   <p align="center">请选择事件类型
     <label>
     <input type="radio" name="radiobutton1" value="借" />
     借</label>
     <label>
     <input type="radio" name="radiobutton1" value="还" />
     还</label>
     <br />
     请输入资产编号         
       <label>
       <input name="text1" type="text" style="height:32px;font-size:24px;"/>
       </label>
  </p>
   <p align="center">请输入借用人编号
     <label>
     <input type="text" name="text2" style="height:32px;font-size:24px;" />
     </label>
  </p>
   <p align="center">借出时间
     <label>
     <input type="text" name="text3" style="height:32px;font-size:24px;"/>
     </label>
  </p>
   <p align="center">归还时间
     <label>
     <input type="text" name="text4" style="height:32px;font-size:24px;"/>
	  <input type="submit" value="提交" name="submit"style="height:36px;font-size:26px;" />
     </label></p>
</form>
<form id="form2" name="form2" method="post" action="QueryServlet"><br />
  <label></label>
  <p align="center"> 欢迎使用借用记录查询功能</p>
  <p align="center"> 请输入查询的资产编号
    <input type="text" name="text5" style="height:32px; font-size:24px" />
  请输入查询的借用人编号
  <input type="text" name="text6" style="height:32px; font-size:24px"  />
  <label>
  <input type="submit" name="Submit" value="确定" style="height:36px;font-size:26px;"  />
  </label>
  </form>
  <div align="center">
    <table class="table" style="background-color:#FFFFFF" cellpadding="0" cellspacing="0">
      <%for(int i=0;i<column;i++){%>
      <th class="td"><%=th[i] %></th>
	  <%} %>
        
        <% String[][]tablerecord=pagebean.getTablerecord();
		int totalrecord;
      if(tablerecord==null){out.print("没有记录");
	  totalrecord=0;}
	  else{totalrecord=tablerecord.length;}
	  out.print("全部记录数"+totalrecord);
	  int pagesize=pagebean.getPagesize();
	  int totalpages=pagebean.getTotalpages();
	  if(totalrecord%pagesize==0)
	      totalpages=totalrecord/pagesize;
	  else totalpages=totalrecord/pagesize+1;
	  pagebean.setTotalpages(totalpages);
	%>  
        
        <%
	if(totalpages>=1){
	   if(pagebean.getCurrentpage()<1){pagebean.setCurrentpage(pagebean.getTotalpages());}
	   if(pagebean.getCurrentpage()>pagebean.getTotalpages()){pagebean.setCurrentpage(1);}
	   int index=(pagebean.getCurrentpage()-1)*pagesize;
	   int start=index;
	   for(int i=index;i<pagesize+index;i++){
	       if(i==totalrecord){break;}
		   out.print("<tr>");
		   for(int j=0;j<6;j++){    %>
        <td class="td"> <%= tablerecord[i][j] %></td>
		     
		   <% }
		   out.print("<tr>");
	   }
	}
	%></table>
	<table bgcolor="#FFFFFF">
	<tr><td class="td1">每页做多显示5条信息,当前显示第<jsp:getProperty name="pagebean" property="currentpage" />页共有<jsp:getProperty name="pagebean" property="totalpages" />页 </td>
    </tr>
    </table>
  </div>

	
	<table>
	<tr><td width="201"><form action="" method="post">
	
	    <div align="center">
	      <input type="hidden" name="currentpage" value="<%= pagebean.getCurrentpage()-1 %>" />
	      <input type="submit" name="g" value="上一页" style="height:36px;font-size:26px;" />
        </div>
	</form></td>
	<td width="149"><form action="" method="post">
	<input type="hidden" name="currentpage" value="<%= pagebean.getCurrentpage()+1 %>" />
	<input type="submit" name="g" value="下一页" style="height:36px;font-size:26px;" />
	</form></td>
	<td width="367"><form action="" method="post" style="background-color:#FFFFFF">
	    输入页码：<input type="text" name="currentpage" size=2 style="height:32px;font-size:24px;" />
	  <input type="submit" name="g" value="提交" style="height:36px;font-size:26px;" />
	  </form></td>
	</tr>
	</table>
<form id="form1" name="form1" method="post" action="" style="background-color:#666666">
  <p>其他链接：<a href="http://www.wkdty.com/">武汉科技大学附属天佑医院</a> <a href="http://bbs.wust.edu.cn/portal.php">武汉科技大学绿水青山BBS</a> <a href="http://www.city.wust.edu.cn/">武汉科技大学城市学院</a></p>
  <p>Copyright 2019 ? 武科大信管1601　版权所有 地址：武汉洪山区青菱街道武科大	邮编：430081</p>
  <strong>鄂ICP备:201505165033</strong>
</form>
<p>&nbsp;</p>
</body>
</html>
