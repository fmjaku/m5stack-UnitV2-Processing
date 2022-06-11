void CameraStream_readResponse() {
    if (dataClient != null & new_data == true){
      new_data = false;
      
      dataIn = dataClient;
      b64image = (trim(dataIn));
      
      try{
        image(base64toImage(b64image),0,0, 640, 480);
      }catch (Exception e){
        //println(e);
      }
    }
} 
