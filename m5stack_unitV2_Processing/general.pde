import javax.imageio.*;
import java.awt.Image.*;
import java.io.ByteArrayInputStream;
import java.awt.image.BufferedImage;
import java.util.stream.IntStream;

String dataIn;
boolean new_data = false;

String b64image = null;

int roiX = 0;
int roiY = 0;
int roiW = 0;
int roiH = 0;
boolean inputROI = false;


PImage base64toImage(String base64string){
  
  byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64string);
  
  try{
    BufferedImage bimg = ImageIO.read(new ByteArrayInputStream(imageBytes));
   PImage pimg = new PImage(bimg.getWidth(),bimg.getHeight(),PConstants.ARGB);
    bimg.getRGB(0, 0, pimg.width, pimg.height, pimg.pixels, 0, pimg.width);
    pimg.updatePixels();
    return pimg;
  }catch(Exception e){
    println("invalid image string");
  }  
  return null;
}

void mousePressed(){
  inputROI = true;
  roiX = mouseX;
  roiY = mouseY;
}

void mouseDragged(){
}

void mouseReleased(){
  roiW = mouseX - roiX;
  roiH = mouseY - roiY;
  inputROI = false;
  
  if (function == "Color_Tracker"){
    ColorTracker_sendROI();
  }
  else if (function == "Target_Tracker") {
    TargetTracker_sendROI();
  }
}

void keyPressed(){
 if (function == "Color_Tracker"){
    if (key == 'l' || key == 'L') {
      ColorTracker_sendLAB();
      delay(500);
    }
 }
}
