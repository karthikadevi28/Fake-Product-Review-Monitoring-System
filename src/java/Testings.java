/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Loginn
 */
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Date;
 import javax.print.*;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.OrientationRequested;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.print.attribute.standard.OrientationRequested;
 
/**
* Java Program to generate PDF document using iText library.
*
* @author Javin
*/
public class Testings {
 public Testings(String pid,String pname){
        OutputStream file = null;
        try {

            file = new FileOutputStream(new File("f://Contacts.pdf"));
            try {
                int flag = 0;
                String max = null;
                String url = "jdbc:mysql://localhost:3306/online2";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "root");
                Statement st = con.createStatement();
                // Create a new Document object
                Document document = new Document();

                // You need PdfWriter to generate PDF document
                PdfWriter.getInstance(document, file);

                // Opening document for writing PDF
                document.open();
 
            
                ResultSet rs11 = st.executeQuery("select * from supplier where  pname= '" + pname + "'");

                while (rs11.next()) {

                    String Name = rs11.getString(1);
                    String ComplaintSubject = rs11.getString(2);
                    String ComplaintMessageBox = rs11.getString(4);
                    String MobileNo = rs11.getString(8);

                    // Add meta data information to PDF file
                    document.addCreationDate();
                    document.add(new Paragraph("Supplier Id :" +Name + " \n Supplier NAME :" + ComplaintSubject + " \n PRODUCT DESCRIBTION :" + ComplaintMessageBox + "\n TYPE :" + MobileNo + " " ));

                }
                // Writing content
                 document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------------"));
                document.add(new Paragraph("PID" + "       " + "PRODUCT NAME" + "       " + "PRODUCT DESCRIBTION" + "       " + "TYPE" + "       " + "QUANTITY" + "       " + "DATE"));
                document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------------"));
                java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
                ResultSet rs1 = st.executeQuery("select * from product where pid ='" + pid + "' and pname= '" + pname + "' and stock<=5");

                while (rs1.next()) {

                    String Name = rs1.getString(1);
                    String ComplaintSubject = rs1.getString(2);
                    String ComplaintMessageBox = rs1.getString(4);
                    String MobileNo = rs1.getString(8);

                    // Add meta data information to PDF file
                    document.addCreationDate();
                    document.add(new Paragraph(Name + "  " + ComplaintSubject + "  " + ComplaintMessageBox + " " + MobileNo + " " + "10" + "       " + f));
                    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------------"));
               
                }
                document.close();
            } catch (Exception e) {
                System.out.println(e);
            }

            // close the document
            System.out.println("Your PDF File is succesfully created");

        } catch (Exception e) {
            e.printStackTrace();

        } finally {

            // closing FileOutputStream
            try {
                if (file != null) {
                    file.close();
                }
            } catch (IOException io) {/*Failed to close*/

            }

        }
    }

    public static void main(String args[]) {
        //Testings as = new Testings("10000000", "SAMSUNG LAPTOP X11");
 //Testing("10000000","SAMSUNG LAPTOP X11");

    }
 
}
