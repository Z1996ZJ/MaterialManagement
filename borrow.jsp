<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="pagebean" class="mybean.data.Borrow_Bean" scope="session" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" type="text/css" href="css/zzj.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ƴ���Ϣ�����豸���</title>
<style type="text/css">
<!--
body,td,th {
	font-size: xx-large;
	font-family: ����;
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
	String[] th={"�¼����","�ʲ����","�����˱��","����ʱ��","�黹ʱ��","�¼�����"};
%>
<form id="form1" name="form1" method="post" action="insertServlet">
   <label></label>
   <p align="center">
     <label></label>
     <label>��ѡ���ʲ�����
     <input type="radio" name="radiobutton" value="fixedassets" />
     �̶��ʲ�</label>
     <label>
     <input type="radio" name="radiobutton" value="consumableassets" />
     �׺��ʲ�</label>
   </p>
   <p align="center">��ѡ���¼�����
     <label>
     <input type="radio" name="radiobutton1" value="��" />
     ��</label>
     <label>
     <input type="radio" name="radiobutton1" value="��" />
     ��</label>
     <br />
     �������ʲ����         
       <label>
       <input name="text1" type="text" style="height:32px;font-size:24px;"/>
       </label>
  </p>
   <p align="center">����������˱��
     <label>
     <input type="text" name="text2" style="height:32px;font-size:24px;" />
     </label>
  </p>
   <p align="center">���ʱ��
     <label>
     <input type="text" name="text3" style="height:32px;font-size:24px;"/>
     </label>
  </p>
   <p align="center">�黹ʱ��
     <label>
     <input type="text" name="text4" style="height:32px;font-size:24px;"/>
	  <input type="submit" value="�ύ" name="submit"style="height:36px;font-size:26px;" />
     </label></p>
</form>
<form id="form2" name="form2" method="post" action="QueryServlet"><br />
  <label></label>
  <p align="center"> ��ӭʹ�ý��ü�¼��ѯ����</p>
  <p align="center"> �������ѯ���ʲ����
    <input type="text" name="text5" style="height:32px; font-size:24px" />
  �������ѯ�Ľ����˱��
  <input type="text" name="text6" style="height:32px; font-size:24px"  />
  <label>
  <input type="submit" name="Submit" value="ȷ��" style="height:36px;font-size:26px;"  />
  </label>
  </form>
  <div align="center">
    <table class="table" style="background-color:#FFFFFF" cellpadding="0" cellspacing="0">
      <%for(int i=0;i<column;i++){%>
      <th class="td"><%=th[i] %></th>
	  <%} %>
        
        <% String[][]tablerecord=pagebean.getTablerecord();
		int totalrecord;
      if(tablerecord==null){out.print("û�м�¼");
	  totalrecord=0;}
	  else{totalrecord=tablerecord.length;}
	  out.print("ȫ����¼��"+totalrecord);
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
	<tr><td class="td1">ÿҳ������ʾ5����Ϣ,��ǰ��ʾ��<jsp:getProperty name="pagebean" property="currentpage" />ҳ����<jsp:getProperty name="pagebean" property="totalpages" />ҳ </td>
    </tr>
    </table>
  </div>

	
	<table>
	<tr><td width="201"><form action="" method="post">
	
	    <div align="center">
	      <input type="hidden" name="currentpage" value="<%= pagebean.getCurrentpage()-1 %>" />
	      <input type="submit" name="g" value="��һҳ" style="height:36px;font-size:26px;" />
        </div>
	</form></td>
	<td width="149"><form action="" method="post">
	<input type="hidden" name="currentpage" value="<%= pagebean.getCurrentpage()+1 %>" />
	<input type="submit" name="g" value="��һҳ" style="height:36px;font-size:26px;" />
	</form></td>
	<td width="367"><form action="" method="post" style="background-color:#FFFFFF">
	    ����ҳ�룺<input type="text" name="currentpage" size=2 style="height:32px;font-size:24px;" />
	  <input type="submit" name="g" value="�ύ" style="height:36px;font-size:26px;" />
	  </form></td>
	</tr>
	</table>
<form id="form1" name="form1" method="post" action="" style="background-color:#666666">
  <p>�������ӣ�<a href="http://www.wkdty.com/">�人�Ƽ���ѧ��������ҽԺ</a> <a href="http://bbs.wust.edu.cn/portal.php">�人�Ƽ���ѧ��ˮ��ɽBBS</a> <a href="http://www.city.wust.edu.cn/">�人�Ƽ���ѧ����ѧԺ</a></p>
  <p>Copyright 2019 ? ��ƴ��Ź�1601����Ȩ���� ��ַ���人��ɽ������ֵ���ƴ�	�ʱࣺ430081</p>
  <strong>��ICP��:201505165033</strong>
</form>
<p>&nbsp;</p>
</body>
</html>
