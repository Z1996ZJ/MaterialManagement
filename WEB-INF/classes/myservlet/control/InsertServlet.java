package myservlet.control;
import mybean.data.Borrow_Bean;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class InsertServlet extends HttpServlet{
      public void init(ServletConfig config) throws ServletException{
         super.init(config);
         try{Class.forName("com.mysql.jdbc.Driver");}
         catch(Exception e){}
        }
       public void doPost(HttpServletRequest request,HttpServletResponse response)
       throws ServletException,IOException{
         request.setCharacterEncoding("gb2312");
         response.setContentType("text/html;charset=gb2312");
         String uri="jdbc:mysql://127.0.0.1/materialmanagement?useUnicode=true&characterEncoding=UTF-8";
         String user="root";
         String password="";
         String s1=request.getParameter("radiobutton");//�ʲ�����
         String s2=request.getParameter("radiobutton1");//�¼�����
         String s3=request.getParameter("text1");//�ʲ����
         String s4=request.getParameter("text2");//�����˱��
         String s5=request.getParameter("text3");//���ʱ��
         String s6=request.getParameter("text4");//�黹ʱ��
         HttpSession session=request.getSession(true);
         Connection conn=null;
         Borrow_Bean pagebean=null;
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
          if(s1==null||s2==null||s3==""||s4==""||s5==""||s6==""){out.println(s1+s2+s3+s4+s5+s6+"��������������");}
          else{
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
                       ResultSet rs=st.executeQuery("select * from "+s1+" where No='"+s3+"'");
                     rs.last();int row=rs.getRow();
                       ResultSet rs1=st.executeQuery("select * from teacher where TeacherNo='"+s4+"'");
                      rs1.last();int row1=rs1.getRow();
                       if(row==0){out.println("���������Ʒ��Ų�����");
                           if(row1==0){out.println("������Ľ�ʦ��Ų�����");}}
                       if(row!=0&&row1!=0){
                            st.executeUpdate("insert into borrowedlist(ANo,BorrowUser,BorrowedTime,ReturnTime,event) values('"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s2+"')");
                              out.println("�����ɹ�");
                              conn.close();
                               response.sendRedirect("borrow.jsp");}
                     } catch(SQLException e){System.out.println(e);}
               }
                out.println("</body></html>");  
       }
        public void doGost(HttpServletRequest request,HttpServletResponse response)
          throws ServletException,IOException  {doPost(request,response);}
}