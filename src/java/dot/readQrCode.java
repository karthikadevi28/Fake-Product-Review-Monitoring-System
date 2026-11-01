package dot;


import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import java.io.FileInputStream;
import javax.imageio.ImageIO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Asvperumal
 */
public class readQrCode {
    public static String readQrCode(String filename, String charset) {
        String ss = null;
        try
        {
             BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(new FileInputStream(filename)))));
        Result result = new MultiFormatReader().decode(binaryBitmap);

        ss=result.getText() ; 
         
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
            return ss; 
    }
}
