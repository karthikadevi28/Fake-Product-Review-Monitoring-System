/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import com.opencsv.CSVWriter;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author ADMIN
 */
public class blocksol {

    /**
     * @param args the command line arguments
     */
    blocksol(String as) {
         try {
                    String url = "jdbc:mysql://localhost:3306/online2";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps;
            Statement st = con.createStatement();    
            CSVWriter writer = new CSVWriter(new FileWriter("C:\\Users\\Loginn\\Documents\\NetBeansProjects\\ONLINE\\web\\block\\loginblock.sol"));
                   ResultSet rs13 = (ResultSet) st.executeQuery("select * from loginblock ");
        
                 
	        while(rs13.next())
	   	      {

              String line1[]={rs13.getString(1),rs13.getString(2),rs13.getString(3),rs13.getString(4),rs13.getString(5)};
      writer.writeNext(line1);
                      } 
      //Flushing data from writer to file
      writer.flush();
   } catch (Exception e) {
            e.printStackTrace();
        } finally {            
           
        } 
    }

    
    
}
