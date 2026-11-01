/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import dataset.Block;
import dataset.Transaction;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Random;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
public class purchase extends HttpServlet {

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
            HttpSession so = request.getSession(true);
            InetAddress myIP = InetAddress.getLocalHost();
            String url = "jdbc:mysql://localhost:3306/online2";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps;
            int pid = 0, pid1 = 0;
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st = con.createStatement();
            String s1 = request.getParameter("s1");
            String s2 = request.getParameter("s2");
             String s3 = request.getParameter("s3");String s4= request.getParameter("f2");
            String a1 = request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
            String a5 = request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a8 = request.getParameter("a7");
            String a10 = request.getParameter("a8");
            String a11 = request.getParameter("a9");
            String a12 = request.getParameter("a10");
            String h1 = "", h2 = "", h3 = "", h4 = "", h5 = "";
            int t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0;
            int t11 = 0, t12 = 0, t13 = 0, t14 = 0, t15 = 0;
            if ((s1 != null)) {
                if ((a1 != null) || (a2 != null) || (a3 != null) || (a4 != null) || (a5 != null) || (a6 != null)) {
                    java.util.Date st11 = new java.util.Date();
                    // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    String f = formatter.format(st11);
                    System.out.println("Formatted date is ==>" + f);
                    t1 = Integer.parseInt(a5);
                    t2 = Integer.parseInt(a6);
                    t3 = (t1 * t2);
                    String a7 = t3 + "";
                    ResultSet rs12 = (ResultSet) st.executeQuery("select * from register where username='" + so.getAttribute("un") + "'");
                    if (rs12.next()) {
                        ResultSet rs3 = (ResultSet) st1.executeQuery("select * from product where pid='" + a1 + "'");
                        if (rs3.next()) {
                            t11 = Integer.parseInt(rs3.getString(7));
                            System.out.println(t11);
                        }
                        t12 = Integer.parseInt(a6);
                        System.out.println(t12);
                        t13 = t11 - t12;
                        System.out.println(t13);

//                        ResultSet rs1 = (ResultSet) st1.executeQuery("select max(pid) from purchase");
//                        if (rs1.next()) {
//
//                            pid1 = Integer.parseInt(rs1.getString(1));
//                            pid = pid1 + 1;
//                            System.out.println(a1 + a2 + a3 + a4 + a5 + a6 + t2 + t3);
//                            System.out.println("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a1 + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a8 + "','" + myIP.getHostAddress() + "')");
//                            int v = st2.executeUpdate("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a8 + "','" + myIP.getHostAddress() + "')");
//                            System.out.println("update product set stock='" + t13 + "' where pid='" + a1 + "' ");
//                            int v1 = st2.executeUpdate("update product set stock='" + t13 + "' where pid='" + a1 + "' ");
//                            if ((v == 1) && (v1 == 1)) {
//
//                                request.setAttribute("ok", "1");
//                                request.setAttribute("a1", a6);
//                                request.setAttribute("a2", a7);
//                                request.setAttribute("msg", "Account Registered Successfully");
//                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
//                                requestdispatcher.forward(request, response);
//                            } else {
//
//                                request.setAttribute("ok", "1");
//                                request.setAttribute("msg", "Password didnot match");
//                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
//                                requestdispatcher.forward(request, response);
//                            }
//
//                        } else {
//                            pid = 1000;
//                            System.out.println("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a1 + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "')");
//                            int v = st2.executeUpdate("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a8 + "')");
//                            int v1 = st2.executeUpdate("update product set stock='" + t13 + "' where pid='" + a1 + "' ");
//                            if ((v == 1) && (v1 == 1)) {

                                request.setAttribute("ok", "1");
                                request.setAttribute("a1", a6);
                                request.setAttribute("a2", a7);
                                request.setAttribute("msg", "");
                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                                requestdispatcher.forward(request, response);
//                            } else {
//
//                                request.setAttribute("ok", "1");
//                                request.setAttribute("msg", "Password didnot match");
//                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
//                                requestdispatcher.forward(request, response);
//                            }
                       // }
                    } else {

                        request.setAttribute("ok", "1");
                        request.setAttribute("msg", "Password didnot match");
                        RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                        requestdispatcher.forward(request, response);
                    }

                } else {
                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please Enter all the Values");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                    requestdispatcher.forward(request, response);
                }

            } else       if ((s3 != null)) {
                if ((a1 != null) || (a2 != null) || (a3 != null) || (a4 != null) || (a5 != null) || (a6 != null)) {
                    
                    if((a10.length()==16)&&(a11.length()==3)&&(a12.length()==4)){
                        java.util.Date st11 = new java.util.Date();
                    // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    String f = formatter.format(st11);
                    System.out.println("Formatted date is ==>" + f);
                    t1 = Integer.parseInt(a5);
                    t2 = Integer.parseInt(a6);
                    t3 = (t1 * t2);
                    String a7 = t3 + "";
                    ResultSet rs12 = (ResultSet) st.executeQuery("select * from register where username='" + so.getAttribute("un") + "'");
                    if (rs12.next()) {
                        ResultSet rs3 = (ResultSet) st1.executeQuery("select * from product where pid='" + a1 + "'");
                        if (rs3.next()) {
                            t11 = Integer.parseInt(rs3.getString(7));
                            System.out.println(t11);
                        }
                        t12 = Integer.parseInt(a6);
                        System.out.println(t12);
                        t13 = t11 - t12;
                        System.out.println(t13);

                        ResultSet rs1 = (ResultSet) st1.executeQuery("select max(pid) from purchase");
                        if (rs1.next()) {

                            pid1 = Integer.parseInt(rs1.getString(1));
                            pid = pid1 + 1;
                            System.out.println(a1 + a2 + a3 + a4 + a5 + a6 + t2 + t3);
                            System.out.println("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a1 + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a10 + "','" + myIP.getHostAddress() + "')");
                            int v = st2.executeUpdate("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a10 + "','" + myIP.getHostAddress() + "','Pending')");
                            System.out.println("update product set stock='" + t13 + "' where pid='" + a1 + "' ");
                            int v1 = st2.executeUpdate("update product set stock='" + t13 + "' where pid='" + a1 + "' ");
                          int randomInt = 0;
                Random randomGenerator = new Random();
                for (int idx = 1; idx <= 10; ++idx) {
                    randomInt = randomGenerator.nextInt(10000000);

                }  Transaction transaction1 = new Transaction(a1, rs12.getString(3), 100000000000000000L);
             Transaction transaction2 = new Transaction(a1, rs12.getString(3), 10000000000000L);
//        Transaction transaction3 = new Transaction(vname, vpass, 1000L);
//        Transaction transaction4 = new Transaction(vname, vpass, 150L);

        Block firstBlock = new Block(0, Arrays.asList(transaction1, transaction2));
        int has=firstBlock.hashCode()+randomInt;
        String hass=has+"";
     //SHA256Helper sha=new SHA256Helper();
              int hash=randomInt+firstBlock.hashCode()+randomInt;
        String hashs=hash+"";
        System.out.println("insert into  purchases values('"+pid+"','"+toHexString(getSHA(hashs))+"','"+ toHexString(getSHA(hass))+"','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a1 + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a10 + "','" + myIP.getHostAddress() + "')");
             int sts=st1.executeUpdate("insert into  purchases values('"+pid+"','"+toHexString(getSHA(hashs))+"','"+ toHexString(getSHA(hass))+"','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a10 + "','" + myIP.getHostAddress() + "','Pending')");
   if ((v == 1) && (v1 == 1) && (sts == 1)) {

                                request.setAttribute("ok", "1");
                                request.setAttribute("a1", a6);
                                request.setAttribute("a2", a7);
                                request.setAttribute("msg", "Order Placed Successfully");
                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                                requestdispatcher.forward(request, response);
                            } else {

                                request.setAttribute("ok", "1");
                                request.setAttribute("msg", "Order failure");
                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                                requestdispatcher.forward(request, response);
                            }

                        } else {
                            pid = 1000;
                            System.out.println("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a1 + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "')");
                            int v = st2.executeUpdate("insert into purchase values('" + pid + "','" + rs12.getString(3) + "','" + rs12.getString(8) + "','" + rs12.getString(7) + "','" + a2 + "','" + a3 + "','" + a4 + "','" + a5 + "','" + a6 + "','" + t3 + "','" + f + "','" + a8 + "')");
                            int v1 = st2.executeUpdate("update product set stock='" + t13 + "' where pid='" + a1 + "' ");
                            if ((v == 1) && (v1 == 1)) {

                                request.setAttribute("ok", "1");
                                request.setAttribute("a1", a6);
                                request.setAttribute("a2", a7);
                                request.setAttribute("msg", "Order Placed Successfully");
                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                                requestdispatcher.forward(request, response);
                            } else {

                                request.setAttribute("ok", "1");
                                request.setAttribute("msg", "Order failure");
                                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                                requestdispatcher.forward(request, response);
                            }
                        }
                    } else {

                        request.setAttribute("ok", "1");
                        request.setAttribute("msg", "Data missmatch");
                        RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                        requestdispatcher.forward(request, response);
                    }
                    }else{
                        request.setAttribute("ok", "1");
                        request.setAttribute("msg", "CREDENCIAL missmatch");
                        RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                        requestdispatcher.forward(request, response);
                    }
                    

                } else {
                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please Enter all the Values");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                    requestdispatcher.forward(request, response);
                }

            }else       if ((s4 != null)){request.setAttribute("ok", "1");
                request.setAttribute("msg", "PURCHASE PRODUCT");
                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                requestdispatcher.forward(request, response);
            } else {
                request.setAttribute("ok", "1");
                request.setAttribute("msg", "Please Enter all the Values");
                RequestDispatcher requestdispatcher = request.getRequestDispatcher("u4.jsp");
                requestdispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
		StringBuilder hexString = new StringBuilder(number.toString(16));

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
