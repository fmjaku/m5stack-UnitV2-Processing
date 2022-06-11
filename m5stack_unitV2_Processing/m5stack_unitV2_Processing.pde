import processing.net.*; 

Client unitV2;

String function = "Camera_Stream"; // "Camera_Stream", "Target_Tracker", "Color_Tracker"

void setup() {
  size(640, 480);
  frameRate(600);
  surface.setLocation(100, 100);
  background(255);   
  
  try{
    unitV2 = new Client(this, "10.254.239.1", 5555); //blue camera
  }catch(Exception e){
    println("Couldn't connect to unitV2: ");
    println(e);
  }
 
}

void draw(){
  if (function == "Camera_Stream"){
    CameraStream_readResponse();
  } else if (function == "Target_Tracker") {
    TargetTracker_readResponse();
  }else if (function == "Color_Tracker"){
    ColorTracker_readResponse();
  }
}


String dataClient;
void clientEvent(Client someClient) {
  new_data = true;
  dataClient = someClient.readStringUntil(byte('\n'));
  //println(dataClient);
  redraw();
}
