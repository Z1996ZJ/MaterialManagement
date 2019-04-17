<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" type="text/css" href="css/table.css" />
<%
	int line=3,column=3;
	String[] th={"姓名","性别","学号"};
%>

<table class="table" cellpadding="0" cellspacing="0">
	<%for(int i=0;i<column;i++){%>
		<th class="td"><%=th[i] %></th>
	<%} %>
	<%for(int i=0;i<line;i++){
		%>
		<tr>
		<%for(int j=0;j<column;j++){ %>
			<td class="td">123
	<%	}
	  }	 %>	
</table>