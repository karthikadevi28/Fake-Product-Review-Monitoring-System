

import dataset.Block;
import dataset.Transaction;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Random;import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            Statement st = con.createStatement();
             Statement st1 = con.createStatement();
            String s1=request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String a1= request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3,a4,a5=null,a6=null;
                 HttpSession so = request.getSession(true);
                  int randomInt = 0;
                Random randomGenerator = new Random();
                for (int idx = 1000000; idx <= 100; ++idx) {
                    randomInt = randomGenerator.nextInt(1000000000);

                }
                          java.util.Date date = new java.util.Date();
SimpleDateFormat sdf;
  String f11="";
sdf = new SimpleDateFormat("yyyy-M-dd");
 f11=sdf.format(date);
            int flag=0;
           if((s1!=null) )
            {
            if((a1!=null)|| (a2!=null) )
            {
              ResultSet rs = (ResultSet) st.executeQuery("select * from register where username='"+a1+"'");
        
                 
	        while(rs.next())
	   	      {
	   		a3=rs.getString(1);
                        a4=rs.getString(2);
                         	   
	        if((a1.equalsIgnoreCase(a3))&&(a2.equalsIgnoreCase(a4))) {
                      a5=rs.getString(7);
                       a6=rs.getString(8);
                       Transaction transaction1 = new Transaction(a1, a2, 100000000000000000L);
             Transaction transaction2 = new Transaction(a3, a4, 10000000000000L);
//        Transaction transaction3 = new Transaction(a1, a2, 1000L);
//        Transaction transaction4 = new Transaction(a1, a2, 150L);

        Block firstBlock = new Block(0, Arrays.asList(transaction1, transaction2));
        int has=firstBlock.hashCode()+randomInt;
        String hass=has+"";
     //SHA256Helper sha=new SHA256Helper();
              int hash=randomInt+firstBlock.hashCode()+randomInt;
        String hashs=hash+"";
                    
    int sts=st1.executeUpdate("insert into loginblock values('"+toHexString(getSHA(hashs))+"','"+a1+"','"+f11+"','Valid','User Login')");
	   	 flag=1;
                }
                      }
                 if((a1.equalsIgnoreCase("admin"))&&(a2.equalsIgnoreCase("admin"))) {
                    Transaction transaction1 = new Transaction(a1, a2, 100000000000000000L);
             Transaction transaction2 = new Transaction("admin", "admin", 10000000000000L);
//        Transaction transaction3 = new Transaction(a1, a2, 1000L);
//        Transaction transaction4 = new Transaction(a1, a2, 150L);

        Block firstBlock = new Block(0, Arrays.asList(transaction1, transaction2));
        int has=firstBlock.hashCode()+randomInt;
        String hass=has+"";
     //SHA256Helper sha=new SHA256Helper();
              int hash=randomInt+firstBlock.hashCode()+randomInt;
        String hashs=hash+"";
                    
    int sts=st1.executeUpdate("insert into loginblock values('"+toHexString(getSHA(hashs))+"','"+a1+"','"+f11+"','Valid','Admin Login')");
	   	 flag=2;
                }
                   so.setAttribute("un", a1);
                so.setAttribute("un1", a2);
                  so.setAttribute("un2", a5);
                    so.setAttribute("un3", a6);
                if((flag==1)){
                  
                  new transactsol(flag+"");
            new blocksol(flag+"");
                  

                    request.setAttribute("ok", "1");
                   
                        RequestDispatcher requestdispatcher = request.getRequestDispatcher("u1.jsp");
                    requestdispatcher.forward(request, response);
                
                }else if(flag==2){
                  
new transactsol(flag+"");
            new blocksol(flag+"");
                    request.setAttribute("ok", "1");
                   
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a1.jsp");
                    requestdispatcher.forward(request, response);
                
                }else {
                    new transactsol(flag+"");
            new blocksol(flag+"");
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Invalid Username && Password");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("i2.jsp");
	       requestdispatcher.forward(request, response); 
            }
               
               
              
            }else {
                new transactsol(flag+"");
            new blocksol(flag+"");
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("i2.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
               new transactsol(flag+"");
            new blocksol(flag+"");
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("i2.jsp");
			requestdispatcher.forward(request, response);
            }
            
            
            
            
            
            
        }catch(Exception e) {
        e.printStackTrace();
        }
        finally {            
            out.close();
        }
    }
public static byte[] getSHA(String input) throws NoSuchAlgorithmException
	{
		// Static getInstance method is called with hashing SHA
		MessageDigest md = MessageDigest.getInstance("SHA-256");

		// digest() method called
		// to calculate message digest of an input
		// and return array of byte
		return md.digest(input.getBytes(StandardCharsets.UTF_8));
	}
	
	public static String toHexString(byte[] hash)
	{
		// Convert byte array into signum representation
		BigInteger number = new BigInteger(1, hash);

		// Convert message digest into hex value
		StringBuilder hexString = new StringBuilder(number.toString(19));

		// Pad with leading zeros
		while (hexString.length() < 64)
		{
			hexString.insert(0, '0');
		}

		return hexString.toString();
	}
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
