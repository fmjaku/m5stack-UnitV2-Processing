int lastX = 0;
int lastY = 0;
int lastW = 0;
int lastH = 0;

void TargetTracker_readResponse() {
    if (dataClient != null & new_data == true){
      new_data = false;
      
      dataIn = dataClient;
      String[] parts = dataIn.split(",");
      b64image = (trim(parts[4]));
      
      try{
        image(base64toImage(b64image),0,0, 640, 480);
      }catch (Exception e){
        //println(e);
      }
      
      if(inputROI){
        rect(roiX, roiY, mouseX - roiX, mouseY - roiY);
      }
      
      lastX = int((trim(parts[0])));
      lastY = int((trim(parts[1])));
      lastW = int((trim(parts[2])));
      lastH = int((trim(parts[3])));

      noFill();
      stroke(0,255,0);
      strokeWeight(2);
      rect(lastX, lastY, lastW, lastH);
    }
} 

void TargetTracker_sendROI(){
  unitV2.write("ROI" + "," + str(roiX) + "," + str(roiY) + "," + str(roiW) + "," + str(roiH));
  println("ROI Sent: " + roiX + ",  " + roiY + ",  " + roiW + ",  " + roiH);
}
