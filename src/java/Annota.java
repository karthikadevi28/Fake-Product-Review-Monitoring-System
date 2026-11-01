/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asvpp
 */
public class Annota extends HttpServlet {

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
                 Connection con = null;
    Statement st = null;
    String t3 = null, t4 = "";
    ResultSet rs, rs1 = null;

                String v="",v1="",v2="",v3="",v4="",v5="",v6="",v7="",v8="";
String input=request.getParameter("input");
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/anntoating", "root", "root");
                st = con.createStatement();
                String a = request.getParameter("textarea2");
                String c = request.getParameter("textarea3");
                String d = request.getParameter("textarea4");
                String b = request.getParameter("button2");
                String b1 = request.getParameter("button3");
                String b2 = request.getParameter("button4");String b3 = request.getParameter("pos");
                if (b != null) {
//                    rs = st.executeQuery("select text from dataset ");
//                    while (rs.next()) {
//                        t3 = rs.getString("text");
//                    }
//                    StringBuffer fileData = new StringBuffer();
//                          ArrayList st1=new ArrayList();
//                     BufferedReader reader = new BufferedReader(new FileReader("D:\\dataset.txt"));
//        char[] buf = new char[175];
//           String readData = null;
//        int numRead=0;
//        while((numRead=reader.read(buf)) != -1){
//  
//            readData = String.valueOf(numRead);
//            fileData.append(readData);
//      
//                  
//            st1.add(readData);
//        }
                  
                    String text = request.getParameter("textarea1");
                    String line = "";
                    text = text.replaceAll("[^a-zA-Z ]", " ");

                    String fun[] = {" to ", " with ", " of ", " at ", " in ", " without ", " between ", " the ", " a ", " that ", " my ", " more ", " much ", " either ", " neither ", " and ", " that ", " when ", " while ", " although ", " or ", " is ", " am ", " are ", " have ", " got ", " do ", " no ", " not ", " nor ", " as ", " but ", " yet ", " still "};
                    int len = fun.length;
                    line = text.replaceAll(fun[0], " ");

                    for (int j = 0; j < len; j++) {
                        line = line.replaceAll(fun[j], " ");
                    }
                    FileWriter writer = new FileWriter("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\Stopwords.txt", true);
                    writer.write(line + "\n");

                    writer.close();
                  //  st.executeUpdate("insert into stopwords values('"+line+"')");
                    // System.out.println(line);
                    request.setAttribute("mes", "success");
                    request.setAttribute("ok", line);
                    RequestDispatcher rd = request.getRequestDispatcher("Stopwords.jsp");
                    rd.forward(request, response);
                } 
                
                
                
                else if (b1 != null) {

                    String u = "";
                    ArrayList aa = new ArrayList();
                    char[] w = new char[501];
                    Stemmer s = new Stemmer();

                    try {
                        FileInputStream in = new FileInputStream("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\Stopwords.txt");
                        while (true) {
                            int ch = in.read();
                            if (Character.isLetter((char) ch)) {
                                int j = 0;
                                while (true) {
                                    ch = Character.toLowerCase((char) ch);
                                    w[j] = (char) ch;
                                    if (j < 100) {
                                        j++;
                                    }
                                    ch = in.read();
                                    if (!Character.isLetter((char) ch)) {
                                        for (int c1 = 0; c1 < j; c1++) {
                                            s.add(w[c1]);
                                        }
                                        s.stem();
                                        {

                                            u = s.toString();
                                            System.out.println(u);
                                            aa.add(u + "     ");
                                            //System.out.println(u);
                                            FileWriter writer = new FileWriter("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\Stemming.txt", true);
                                            writer.write(u + "     "+ "\n");

                                            writer.close();
                                      
                                            //text.append(u+"\n");
                                        }
                                        break;

                                    }

                                }
                            }
                            if (ch < 0) {
                                break;
                            }
                        }

                    } catch (Exception ex) {
                        System.out.println(ex.getMessage());
                    }
                    
                   
                     String sa="";
                  
                                  
                      st.executeUpdate("insert into stemm values('"+u+"')");
                     
                    
                       
                    //}
                    request.setAttribute("mes", "success");
                    request.setAttribute("ok1", aa);
                    RequestDispatcher rd = request.getRequestDispatcher("Stemming.jsp");
                    rd.forward(request, response);
                } else if (b2 != null) {
                    SynonymMap sy = new SynonymMap(null);
                    rs1 = st.executeQuery("select text from dataset ");
                    if (rs1.first()) {
                        t3 = rs1.getString("text");
                    }
                    String text = t3;
                    String line1 = "";
                    text = text.replaceAll("[^a-zA-Z ]", " ");

                    String fun[] = {" to ", " with ", " of ", " at ", " in ", " without ", " between ", " the ", " a ", " that ", " my ", " more ", " much ", " either ", " neither ", " and ", " that ", " when ", " while ", " although ", " or ", " is ", " am ", " are ", " have ", " got ", " do ", " no ", " not ", " nor ", " as ", " but ", " yet ", " still "};
                    int len = fun.length;
                    line1 = text.replaceAll(fun[0], " ");

                    for (int j = 0; j < len; j++) {
                        line1 = line1.replaceAll(fun[j], " ");
                    }
                    FileWriter writer = new FileWriter("C:\\Users\\Karthika Devi\\OneDrive\\Documents\\dataset.txt", true);
                    writer.write(line1 + "\n");
                    writer.close();
                      st.executeUpdate("insert into syn values('"+line1+"')");
                    // System.out.println(line);
                    request.setAttribute("mes", "success");
                    request.setAttribute("ok2", line1);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }else if (b3 != null) {
                  tagTextToFile as=new tagTextToFile();
                    RequestDispatcher rd = request.getRequestDispatcher("Stemming.jsp");
                    rd.forward(request, response);
                }else{
                    RequestDispatcher rd = request.getRequestDispatcher("Stemming.jsp");
                    rd.forward(request, response);  
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

         finally {
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
