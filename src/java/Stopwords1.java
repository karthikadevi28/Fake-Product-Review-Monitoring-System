
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.StringTokenizer;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Java
 */
public class Stopwords1 {
    public static void main(String args[]){
         String u=""; 
           char[] w = new char[501];
        Stemmer s = new Stemmer();

 
		try{
                    FileInputStream in = new FileInputStream("D:\\dataset.txt");
                            while(true){
                                int ch = in.read();
                                if (Character.isLetter((char) ch)){
                                    int j = 0;
                                    while(true){
                                        ch = Character.toLowerCase((char) ch);
                                        w[j] = (char) ch;
                                        if (j < 100) j++;
                                        ch = in.read();
                                        if (!Character.isLetter((char) ch)){
                                            for (int c1 = 0; c1 < j; c1++) s.add(w[c1]);
                                                s.stem();
                                                {
                                    
                                                u = s.toString();
                                             
                                                System.out.println(u);
                                                  FileWriter writer = new FileWriter("D:\\dataset1.txt",true);
                                               writer.write(u+"\n");
                                               
                                               writer.close();
                                                //text.append(u+"\n");
                                                }
                                            break;
                                          
                                        }
                                        
                                    }
                                }
                                if (ch < 0) break;
                            }
                       
                            
                           
                        }
                        catch (Exception ex){
                            System.out.println(ex.getMessage());
                        }
    }
    
}
