/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author windows
 */
public class feedback extends HttpServlet {

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
                    String url = "jdbc:mysql://localhost:3306/online2";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps;
                     HttpSession so = request.getSession(true);
                       InetAddress myIP=InetAddress.getLocalHost();
            Statement st = con.createStatement();
               Statement st1 = con.createStatement();
            String s1=request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String a1= request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
            String a5 = request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a7 = request.getParameter("a7");
            System.out.println(a5);
       int flag=0,f=0,v=0;
          //   System.out.println("insert into product values('"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8 +"'");
            if((s1!=null) )
            {
                 
            if((a1!=null)||(a2!=null)||(a3!=null)||(a4!=null) )
            {    int pid1=0,pid=0,v1=0;
           
              ResultSet rs1 = (ResultSet) st1.executeQuery("select max(fid) from feedback");
       if(rs1.next()){
                     pid1=Integer.parseInt(rs1.getString(1));
           pid=pid1+1;
       }
                 ResultSet rs3 = (ResultSet) st1.executeQuery("select pname from purchase where pname='"+a2+"' and uname='"+so.getAttribute("un")+"'");
       if(rs3.next()){
        ResultSet rs13 = (ResultSet) st1.executeQuery("select count(pname) from feedback where pname='"+a2+"' and uname='"+so.getAttribute("un")+"' and ipaddress='"+myIP.getHostAddress()+"'");
       if(rs13.next()){

            

       f=Integer.parseInt(rs13.getString(1))+1;
       }else{
           
          f=f+1;
     
     
        }  if(f<=3){
               System.out.println("insert into feedback values('"+pid+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+so.getAttribute("un")+"','"+a6+"','"+myIP.getHostAddress()+"','Normal Review')");
          v=st.executeUpdate("insert into feedback values('"+pid+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+so.getAttribute("un")+"','"+a6+"','"+myIP.getHostAddress()+"','Normal Review')");
           
           }else{
             System.out.println("insert into feedback values('"+pid+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+so.getAttribute("un")+"','"+a6+"','"+myIP.getHostAddress()+"','Fake Review')");
           v=st.executeUpdate("insert into feedback values('"+pid+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+so.getAttribute("un")+"','"+a6+"','"+myIP.getHostAddress()+"','Fake Review')");
   
       }
     
                if((v==1))  {
  

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Review Stored Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("u7.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Review Failed To Store");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("u7.jsp");
                    requestdispatcher.forward(request, response);
                }  
       
       }  else{
           request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Review option not allowed");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("u7.jsp");
                    requestdispatcher.forward(request, response);
       }   
            
       
       
       
       
       
       
   
        
                     
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("u7.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("u7.jsp");
			requestdispatcher.forward(request, response);
            }
            
            
            
            
            
            
        }catch(Exception e) {
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
