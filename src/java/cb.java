/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Loginn
 */
public class cb extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
              Connection con=null;
      	      String url="jdbc:mysql://localhost:3306/online2";
	      String driver="com.mysql.jdbc.Driver";
	      Class.forName(driver);
	       con=(Connection)DriverManager.getConnection(url, "root","root");
                 Statement st=con.createStatement();
                 Statement st1=con.createStatement();
            String a1=request.getParameter("a1");
             String a2=request.getParameter("a2");
                         String a3=request.getParameter("a3");
                           String a4=request.getParameter("a4");
            
                         
                         
 String s1 = null;
		String s2 = null;
		String s3 = null;
                                         
 String s4 = null;
		String s5 = null;
		String s6 = null;                         
String s7 = null;    
		ArrayList al=new ArrayList();

               
  
             if(request.getParameter("Add")!=null){
                 int pro1=0,pro=0;
                 ResultSet rs = st.executeQuery("select max(cid) from chat");


          if (rs!=null) {  
            if(rs.next()){
				pro=Integer.parseInt(rs.getString(1));
				pro1=pro+1;
					s1=pro1+"";
                                                                               }
				}else{
				pro1=1000;
				s1=pro1+"";
				}
          System.out.println("select * from chatbot where question ='"+a1+"'");
          ResultSet rs2 = st.executeQuery("select * from chatbot where question like '%"+a1+"%' and status='admin'");


          if (rs2.next()) { 
              s6=rs2.getString(3);
                   HttpSession so = request.getSession(true);
               	System.out.println("insert into chat values('" + a1 + "','" + a2 + "','" + a3 + "')");
	      int v=st.executeUpdate("insert into chat values('" + s1 + "','" +a1 + "','" + s6 + "','user')");
                if(v==1){
                    request.setAttribute("ok", "1");
                        request.setAttribute("msg",a1+s6);
                   RequestDispatcher rs1=request.getRequestDispatcher("i3.jsp");
                    rs1.forward(request, response);
                }else{
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs1=request.getRequestDispatcher("i3.jsp");
                    rs1.forward(request, response);
                }
          }else{
               int pro11=0,pro12=0;
               String s11 = "";
                   ResultSet rs12 = st.executeQuery("select max(cid) from chatbot");


          if (rs12!=null) {  
            if(rs12.next()){
				pro11=Integer.parseInt(rs12.getString(1));
				pro12=pro11+1;
					s11=pro12+"";
                                                                               }
				}
          
             int v=st.executeUpdate("insert into chatbot values('" + s11 + "','" +a1 + "','','User')"); 
                  HttpSession so = request.getSession(true);
               	System.out.println("insert into chat values('" + a1 + "','" + a2 + "','" + a3 + "')");
	      v=st.executeUpdate("insert into chat values('" + s1 + "','" +a1 + "','" + s6 + "','user')");
                if(v==1){
                    request.setAttribute("ok", "1");
                        request.setAttribute("msg",a1+s6);
                   RequestDispatcher rs1=request.getRequestDispatcher("i3.jsp");
                    rs1.forward(request, response);
                }else{
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs1=request.getRequestDispatcher("i3.jsp");
                    rs1.forward(request, response);
                }
          }
          //  System.out.println("select * from chatbot where question ='"+a1+"'");

        
             }else
                  if(request.getParameter("delete")!=null){
                 int pro1=0,pro=0;
                 
             HttpSession so = request.getSession(true);
               System.out.println("delete from  chat  where user'user'");
	      int v=st.executeUpdate("delete from  chat  where user!='SIVA'");
                if(v==1){
                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Successfully stored");
                   RequestDispatcher rs1=request.getRequestDispatcher("i3.jsp");
                    rs1.forward(request, response);
                }else{
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs1=request.getRequestDispatcher("i3.jsp");
                    rs1.forward(request, response);
                }
             
             }
              
		
              
                else{
                          
                
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs=request.getRequestDispatcher("i3.jsp");
                    rs.forward(request, response);
                }
                 
        }catch(Exception e){
            e.printStackTrace();
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
