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
import java.text.SimpleDateFormat;
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
public class v1 extends HttpServlet {

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

            String url1;

            HttpSession so = request.getSession(true);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online2", "root", "root");
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            Statement st4 = con.createStatement();
            Statement st5 = con.createStatement();
            Statement st6 = con.createStatement();
            int size; 
            int flag=0;
            String mail="";
            String a11=request.getParameter("a1");
                        String a12=request.getParameter("a2");
            long mob = 0;
            String b = request.getParameter("b");
            String b1 = request.getParameter("b1");
            String a1="",a2="",a3="",a4="",bt1="",phone="",phone1=""; 
         
   ResultSet rs=st.executeQuery("select * from purchase where pid='"+b+"'");
       if(rs!=null){
          
            if (request.getParameter("t1") != null) {
                String v = null;
                java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10
     
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);

                int vv=0;
                    String pid = null,pname = null;
                 int v1=st.executeUpdate("update purchase set status ='Accept' where pid='"+b+"'");
                    ResultSet rs111=st.executeQuery("select * from purchase where pid='"+b+"'");
                     if(rs111.next()){
                         vv= Integer.parseInt(rs111.getString(9));
                     System.out.println("select * from product where pname= (select pname from purchase where pid='"+b+"') and stock <= 5");
                          ResultSet rs1=st.executeQuery("select * from product where pname = ( select pname from purchase where pid ='"+b+"' ) ");
       if(rs1.next()){
           vv=Integer.parseInt(rs1.getString(7))+vv;
       pid=rs1.getString(1); pname=rs1.getString(2);
         ResultSet rs10=st.executeQuery("select * from product where pname = '"+b+"' and stock<=5 ");
       if(rs10.next()){
                         ResultSet rs11=st.executeQuery("select max(pdfid) from pdfgen ");
       if(rs11.next()){
           vv=Integer.parseInt(rs11.getString(1))+1;
       }          ResultSet rs12=st.executeQuery("select * from supplier where pname= (select pname from purchase where pid='"+b+"') ");
       if(rs12.next()){
          
      
                       v1=st.executeUpdate("insert into pdfgen values('"+vv+"','"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(4)+"','"+rs1.getString(8)+"','5','"+f+"','"+rs12.getString(1)+"','"+rs1.getString(2) +"','"+rs12.getString(6)+"','"+rs1.getString(5) +"')");
            } }}}
                 if(v1>=1){
                     new Testings(pid,pname);
//                  request.setAttribute("ok", "1");
//                          request.setAttribute("FromDate", pid);
//                               request.setAttribute("ToDate", pname);
//                       RequestDispatcher rs2 = request.getRequestDispatcher("pdfgenerator.jsp");
//                rs2.forward(request, response);
               
                          request.setAttribute("msg", "Accepted Succesfully");
                              
                       RequestDispatcher rs42 = request.getRequestDispatcher("a7.jsp");
                rs42.forward(request, response);
                 
                 //else{
         
       //}
                        
                 }else{
                 
                         request.setAttribute("ok", "1");
                          request.setAttribute("msg", "Accepted failed");
                              
                       RequestDispatcher rs2 = request.getRequestDispatcher("a7.jsp");
                rs2.forward(request, response);
                 }
                     
                     
                    } else   if (request.getParameter("t2") != null) {
                String v = null;
                java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);

                int vv = 0;
                String pid = null,pname = null;
                int v1 = st.executeUpdate("update purchase set Status='cancel' where pid='" + b + "'");
                ResultSet rs11 = st.executeQuery("select * from  purchase where pid='" + b + "'");
                if (rs11.next()) {
                    vv = Integer.parseInt(rs11.getString(7));
                }
                ResultSet rs1 = st.executeQuery("select * from product where pname= (select pname from purchase where pid='" + b + "')");
                if (rs1.next()) {
                    vv = Integer.parseInt(rs1.getString(7)) + vv;
                      pid=rs1.getString(1); pname=rs1.getString(2);
                }

                v1 = st.executeUpdate("update product set stock='" + vv + "' where pname= (select pname from purchase where pid='" + b + "')");
                ResultSet rs10=st.executeQuery("select * from product where pname = '"+b+"' and stock<=5 ");
       if(rs10.next()){
                         ResultSet rs14=st.executeQuery("select max(pdfid) from pdfgen ");
       if(rs14.next()){
           vv=Integer.parseInt(rs14.getString(1))+1;
       }          ResultSet rs12=st.executeQuery("select * from supplier where pname= (select pname from purchase where pid='"+b+"') ");
       if(rs12.next()){
          
      
                       v1=st.executeUpdate("insert into pdfgen values('"+vv+"','"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(4)+"','"+rs1.getString(8)+"','5','"+f+"','"+rs12.getString(1)+"','"+rs1.getString(2) +"','"+rs12.getString(6)+"','"+rs1.getString(5) +"')");
            }  request.setAttribute("ok", "1");
                          request.setAttribute("FromDate", pid);
                               request.setAttribute("ToDate", pname);
                               new Testings(pid,pname);
//                       RequestDispatcher rs2 = request.getRequestDispatcher("pdfgenerator.jsp");
//                rs2.forward(request, response);
//       response.sendRedirect("a7.jsp");
       }if (v1 >= 1) {

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Denied Succesfully");

                    RequestDispatcher rs2 = request.getRequestDispatcher("a7.jsp");
                    rs2.forward(request, response);
                } else {

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Denied failed");

                    RequestDispatcher rs2 = request.getRequestDispatcher("a7.jsp");
                    rs2.forward(request, response);
                }
                     
                     
                    }else {
                         RequestDispatcher rs2 = request.getRequestDispatcher("a7.jsp");
                rs2.forward(request, response);
                    }

    

       }else{
                         RequestDispatcher rs2 = request.getRequestDispatcher("a7.jsp");
                rs2.forward(request, response);
                    }


        } catch (Exception e) {
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
