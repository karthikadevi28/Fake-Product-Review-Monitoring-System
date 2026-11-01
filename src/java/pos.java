/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import edu.stanford.nlp.tagger.maxent.MaxentTagger;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SAI_Bharath
 */
public class pos extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
          
 String tagged;
 
 // Initialize the tagger
 MaxentTagger tagger = new MaxentTagger("models/left3words-wsj-0-18.tagger");
 
 // The sample string
 String sample = "i can man the controls of this machine";
 
 //The tagged string
 tagged = tagger.tagString(sample);
 
 //output the tagged sample string onto your console
 System.out.println(tagged);
 
 /* next we will pick up some sentences from a file input.txt and store the output of
 tagged sentences in another file output.txt. So make a file input.txt and write down
 some sentences separated by a new line */
 
 FileInputStream fstream = new FileInputStream("E:\\dataset1.txt");
 DataInputStream in = new DataInputStream(fstream);
 BufferedReader br = new BufferedReader(new InputStreamReader(in));
 
 //we will now pick up sentences line by line from the file input.txt and store it in the string sample
 while((sample = br.readLine())!=null)
 {
 //tag the string
 tagged = tagger.tagString(sample);
 FileWriter q = new FileWriter("E:\\output.txt",true);
 BufferedWriter out1 =new BufferedWriter(q);
 //write it to the file output.txt
 out1.write(tagged);
 out1.newLine();
 out1.close();
 }
          } catch (ClassNotFoundException ex) {
            Logger.getLogger(pos.class.getName()).log(Level.SEVERE, null, ex);
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
