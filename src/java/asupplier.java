/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import dataset.AesEncryption;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
 * @author Loginn
 */
public class asupplier extends HttpServlet {

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
            Statement st = con.createStatement();
               Statement st1 = con.createStatement();
            String s1=request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String s3=request.getParameter("s3");
            String s4=request.getParameter("s4");
              String s5=request.getParameter("s5");
            String a1= request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3 ="C:\\Users\\Karthika Devi\\OneDrive\\Documents\\ONLINE\\ONLINE\\web\\certificate\\"+ request.getParameter("a3");
            String a4 = request.getParameter("a4");
            String a5 = request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a7 = request.getParameter("a7");
            System.out.println(a5);
         String a8 = request.getParameter("a8");
            String a9 = request.getParameter("a9");
            // System.out.println("insert into supplier values('"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8 +"','"+so.getAttribute("un") +"'");
            if((s1!=null) )
            {
                  String newDir = "new_dir";
        boolean success = (new File(newDir)).mkdir();

        if (success) {
            System.out.println("Successfully created directory: " + newDir);
        } else {
            System.out.println("Failed to create directory: " + newDir);
        }

        // Create a directory; all non-existent ancestor directories are
        // automatically created.
        newDir = "C:\\Users\\Karthika Devi\\OneDrive\\Documents\\ONLINE\\ONLINE\\web\\certificate";
        success = (new File(newDir)).mkdirs();

        if (success) {
            System.out.println("Successfully created directory: " + newDir);
        } else {
            System.out.println("Failed to create directory: " + newDir);
        }

                  InputStream inStream = null;
	OutputStream outStream = null;

 
    	    File afile =new File(a3);
            System.out.println(afile);
       
    	    File bfile =new File("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\ONLINE\\ONLINE\\web\\certificate\\"+a1+".jpg");

    	    inStream = new FileInputStream(afile);
    	    outStream = new FileOutputStream(bfile);
 
    	    byte[] buffer = new byte[1024];
 
    	    int length;
    	    //copy the file content in bytes 
    	    while ((length = inStream.read(buffer)) > 0){
 
    	    	outStream.write(buffer, 0, length);
 
    	    }
 
    	    inStream.close();
    	    outStream.close();
// int width = 200;
//           int height = 200;
//              AesEncryption asc=new AesEncryption();
////             String as=a1;
//           BitMatrix bitMatrix;
//        try {
//            bitMatrix = new QRCodeWriter().encode(asc.toEncrypt(a1.getBytes()), BarcodeFormat.QR_CODE, width, height);
//            MatrixToImageWriter.writeToStream(bitMatrix, "png", new FileOutputStream(new File("C:\\Users\\Win11\\Desktop\\Fake\\Fake Review\\web\\QRCode\\"+a1+".png")));
//        } catch (WriterException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    	    System.out.println("File is copied successful!");
            if((a1!=null)||(a2!=null)||(a3!=null)||(a4!=null)||(a5!=null)||(a6!=null)||(a7!=null) )
            {
             
                      System.out.println("insert into supplier values('"+a1+"','"+a2+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a7+"'");
           int v=st.executeUpdate("insert into supplier values('"+a1+"','"+a2+"','"+a1+".jpg','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"','"+so.getAttribute("un") +"')");
              
                if((v==1))  {
  

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Product Added Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Product Added Failed");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else if((s4!=null) )
            {
             

            if((a1!=null) )
            {
           
//                      System.out.println("update product set pname='"+a2+"',image='"+a1+".jpg',pdetail='"+a4+"',price='"+a5+"',discount='"+a6+"',stock='"+a7+"',type='"+a8+"',uname='"+so.getAttribute("un") +"' where pid='"+a1+"'");
//           int v=st.executeUpdate("update product set pname='"+a2+"',image='"+a1+".jpg',pdetail='"+a4+"',price='"+a5+"',discount='"+a6+"',stock='"+a7+"',type='"+a8+"',uname='"+so.getAttribute("un") +"' where pid='"+a1+"'");
            ResultSet rs1=st1.executeQuery("select * from supplier where sid='"+a1+"'");
                 if(rs1.next()){
                        a1= rs1.getString(1);
            a2 = rs1.getString(2);
           a3 = rs1.getString(3);
           a4 = rs1.getString(4);
           a5 = rs1.getString(5);
           a6 = rs1.getString(6);
         a7 = rs1.getString(7);
                  a8 = rs1.getString(8);
         a9 = rs1.getString(9);    
                   request.setAttribute("ok1", "1");
                    request.setAttribute("a1", a1);
                    request.setAttribute("a2", a2);
                    request.setAttribute("a3", a3);
                    request.setAttribute("a4", a4);
                    request.setAttribute("a5", a5);
                    request.setAttribute("a6", a6);
                    request.setAttribute("a7", a7);
                      request.setAttribute("a8", a8);
                    request.setAttribute("a9", a9);
                    request.setAttribute("msg", "");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                 }else{
                            a1= "";
            a2 = "";
           a3 = "";
           a4 = "";
           a5 = "";
           a6 = "";
         a7 = "";
                  a8 = "";
         a9 = "";     
                   request.setAttribute("ok1", "1");
                    request.setAttribute("a1", a1);
                    request.setAttribute("a2", a2);
                    request.setAttribute("a3", a3);
                    request.setAttribute("a4", a4);
                    request.setAttribute("a5", a5);
                    request.setAttribute("a6", a6);
                    request.setAttribute("a7", a7);
                     request.setAttribute("a6", a6);
                    request.setAttribute("a7", a7);
                     request.setAttribute("a8", a8);
                    request.setAttribute("a9", a9);
                   request.setAttribute("msg", "Product id not exist");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                 }
          
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else  if((s3!=null) )
            {
                  String newDir = "new_dir";
        boolean success = (new File(newDir)).mkdir();

        if (success) {
            System.out.println("Successfully created directory: " + newDir);
        } else {
            System.out.println("Failed to create directory: " + newDir);
        }

        // Create a directory; all non-existent ancestor directories are
        // automatically created.
        newDir = "C:\\Users\\Karthika Devi\\OneDrive\\Documents\\ONLINE\\ONLINE\\web\\certificate";
        success = (new File(newDir)).mkdirs();

        if (success) {
            System.out.println("Successfully created directory: " + newDir);
        } else {
            System.out.println("Failed to create directory: " + newDir);
        }

                  InputStream inStream = null;
	OutputStream outStream = null;

 
    	    File afile =new File(a3);
            System.out.println(afile);
       
    	    File bfile =new File("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\ONLINE\\ONLINE\\web\\certificate\\"+a1+".jpg");

    	    inStream = new FileInputStream(afile);
    	    outStream = new FileOutputStream(bfile);
 
    	    byte[] buffer = new byte[1024];
 
    	    int length;
    	    //copy the file content in bytes 
    	    while ((length = inStream.read(buffer)) > 0){
 
    	    	outStream.write(buffer, 0, length);
 
    	    }
 
    	    inStream.close();
    	    outStream.close();
 
    	    System.out.println("File is copied successful!");
            if((a1!=null)||(a2!=null)||(a3!=null)||(a4!=null)||(a5!=null)||(a6!=null)||(a7!=null) )
            {
             
                      System.out.println("update supplier set sname='"+a2+"',image='"+a1+".jpg',caddress='"+a4+"',phone='"+a5+"',email='"+a6+"',cname='"+a7+"',pname='"+a8+"',uname='"+so.getAttribute("un") +"' where sid='"+a1+"'");
           int v=st.executeUpdate("update supplier set sname='"+a2+"',image='"+a1+".jpg',caddress='"+a4+"',phone='"+a5+"',email='"+a6+"',cname='"+a7+"',pname='"+a8+"',uname='"+so.getAttribute("un") +"' where sid='"+a1+"'");
//              ResultSet rs11=st1.executeQuery("select * from register");
//                 while(rs11.next()){
//                     SMS s=new SMS();
//                String cv=rs11.getString(5);
//                                   String v1=s.SendSMS(cv, "Book Id"+a1+"Book Name:"+a2+"Price:"+a5);
//
////                                     String url1 = "http://ubaid.tk/sms/sms.aspx?uid=9791334452&pwd=bharathprabhu&msg=NewBook"+a2+"&phone="+rs11.getString(5) +"&provider=way2sms";
////                          JEditorPane editorPane = new JEditorPane(url1);
////    editorPane.setEditable(false);
//                     System.out.println(v1);
//                 }
                if((v==1))  {
  

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Product Updated Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Product Updated Failed");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else if((s5!=null) )
            {
               
            if((a1!=null) )
            {
             
                      System.out.println("delete from supplier  where sid='"+a1+"'");
           int v=st.executeUpdate("delete from supplier  where sid='"+a1+"'");
//              ResultSet rs11=st1.executeQuery("select * from register");
//                 while(rs11.next()){
//                     SMS s=new SMS();
//                String cv=rs11.getString(5);
//                                   String v1=s.SendSMS(cv, "Book Id"+a1+"Book Name:"+a2+"Price:"+a5);
//
////                                     String url1 = "http://ubaid.tk/sms/sms.aspx?uid=9791334452&pwd=bharathprabhu&msg=NewBook"+a2+"&phone="+rs11.getString(5) +"&provider=way2sms";
////                          JEditorPane editorPane = new JEditorPane(url1);
////    editorPane.setEditable(false);
//                     System.out.println(v1);
//                 }
                if((v==1))  {
  

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Product deleted Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Product deletion Failed");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }
                
               
               
              
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
			requestdispatcher.forward(request, response);
            }
            
            
            
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
			requestdispatcher.forward(request, response);
            }
            
        }catch(Exception e) {
        e.printStackTrace();
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
