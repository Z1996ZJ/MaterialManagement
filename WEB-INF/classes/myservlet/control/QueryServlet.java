package myservlet.control;
import mybean.data.Borrow_Bean;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class QueryServlet extends HttpServlet{
      public void init(ServletConfig config) throws ServletException{
         super.init(config);
         try{Class.forName("com.mysql.jdbc.Driver");}
         catch(Exception e){}
        }
       public void doPost(HttpServletRequest request,HttpServletResponse response)
       throws ServletException,IOException{
         request.setCharacterEncoding("gb2312");
         response.setContentType("text/html;charset=gb2312");
         String uri="jdbc:mysql://127.0.0.1/materialmanagement";
         String user="root";
         String password="";
         String sql=null;
         String s1=request.getParameter("text5");//资产编号
         String s2=request.getParameter("text6");//借用人编号
         HttpSession session=request.getSession(true);
         Connection conn=null;
         Borrow_Bean pagebean=null;
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
          if(s1==""&&s2=="")sql="select * from borrowedlist";
          if(s1==""&&s2!="")sql="select * from borrowedlist where BorrowUser='"+s2+"'";
          if(s1!=""&&s2=="")sql="select * from borrowedlist where ANo='"+s1+"'";
          if(s1!=""&&s2!="")sql="select * from borrowedlist where ANo='"+s1+"' and BorrowUser='"+s2+"'";
          else{out.println("输入出错!");}
          try{
                pagebean=(Borrow_Bean)session.getAttribute("pagebean");
                if(pagebean==null){
                pagebean=new Borrow_Bean();
                session.getAttribute("pagebean");}
                }catch(Exception ex){
                 pagebean=new Borrow_Bean();
                 session.getAttribute("pagebean");}
            try{
                 conn=DriverManager.getConnection(uri,user,password);
                 Statement st=conn.createStatement();
                 ResultSet rs=st.executeQuery(sql);
                 ResultSetMetaData metaData=rs.getMetaData();
                 int columCount=metaData.getColumnCount();
                 rs.last();
                 int rownumber=rs.getRow();
                 String[][] tablerecord=pagebean.getTablerecord();
                 tablerecord=new String[rownumber][columCount];
                 rs.beforeFirst();
                 int i=0;
                 while(rs.next()){ 
                         for(int k=0;k<columCount;k++){tablerecord[i][k]=rs.getString(k+1);}
                            i++;
                           }
                   pagebean.setTablerecord(tablerecord);
                   conn.close();
                   response.sendRedirect("borrow.jsp");
                     } catch(SQLException e){System.out.println(e);}
               
                out.println("</body></html>");  
       }
        public void doGost(HttpServletRequest request,HttpServletResponse response)
          throws ServletException,IOException  {doPost(request,response);}
}