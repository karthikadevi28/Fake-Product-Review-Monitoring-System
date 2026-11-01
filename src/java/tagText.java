/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SEKAR
 */
import java.io.IOException;
import edu.stanford.nlp.tagger.maxent.MaxentTagger;
 
public class tagText {
public static void main(String[] args) throws IOException,
ClassNotFoundException {
 
// Initialize the tagger
MaxentTagger tagger = new MaxentTagger("models/left3words-wsj-0-18.tagger");
 
// The sample string
String sample = "This is a sample text";
 
// The tagged string
String tagged = tagger.tagString(sample);
 
//output the tagged sample string onto your console
System.out.println("Input: " + sample);
System.out.println("Output: "+ tagged);
}
}
