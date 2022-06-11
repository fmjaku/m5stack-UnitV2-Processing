int lastCX = 0;
int lastCY = 0;
int lastR = 0;
int lastMX = 0;
int lastMY = 0;

int L_min = 0;
int L_max = 0;
int A_min = 0;
int A_max = 0;
int B_min = 0;
int B_max = 0;

void ColorTracker_readResponse() {
    if (dataClient != null & new_data == true){
      new_data = false;
      
      dataIn = dataClient;
      String[] parts = dataIn.split(",");
      b64image = (trim(parts[5]));
      
      try{
        image(base64toImage(b64image),0,0, 640, 480);
      }catch (Exception e){
        //println(e);
      }
      
      if(inputROI){
        noFill();
        stroke(255,0,0);
        strokeWeight(4);
        rect(roiX, roiY, mouseX - roiX, mouseY - roiY);
      }
      lastCX = int((trim(parts[0])));
      lastCY = int((trim(parts[1])));
      lastR = int((trim(parts[2])));
      lastMX = int((trim(parts[3])));
      lastMY = int((trim(parts[4])));

      println("CXCY: " + str(lastCX) + ", " + str(lastCY) + ", " + str(lastR));
    
      noFill();
      stroke(0,255,0);
      strokeWeight(4);
      circle(lastCX, lastCY, lastR);
      circle(lastMX, lastMY, 3);
    }
} 

void ColorTracker_sendLAB(){  
  unitV2.write("LAB" + "," + str(L_min) + "," + str(L_max) + "," + str(A_min) + "," + str(A_max) + "," + str(B_min) + "," + str(B_max));
  println("LAB Sent: "+ str(L_min) + ", " + str(L_max) + ", " + str(A_min) + ", " + str(A_max) + ", " + str(B_min) + ", " + str(B_max));
}

void ColorTracker_sendROI(){
  unitV2.write("ROI" + "," + str(roiX) + "," + str(roiY) + "," + str(roiW) + "," + str(roiH));
  println("ROI Sent: " + roiX + ",  " + roiY + ",  " + roiW + ",  " + roiH);
}
