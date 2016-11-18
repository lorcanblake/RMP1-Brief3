import processing.video.*;
Capture video;

void setup() {
  fullScreen();
  frameRate(10);
  video = new Capture(this,640,480, 15);   // capturing frames
  video.start(); 
}

void draw() {
  background(255);   // Clear the background on every frame
  if (video.available()) {
    video.read();
  } 
  else
  {
    println("No video detected");
  }
  
  video.loadPixels();   // to access the video frame pixels I need to load them
  
  // sampling only every 16th and 15th row and column
  for (int y = 0; y < video.height; y+=15 ) {
    for (int x = 0; x < video.width; x+=16 ) {
      
      int imgloc = x + y*video.width;      // Calculate the location in the image
      
      // Image Processing Algorithm would go here
      float r = red(video.pixels[imgloc]);
      float g = green(video.pixels[imgloc]);
      float b = blue(video.pixels[imgloc]);
      
      // Image Processing would go here     
      fill(r,g,b, 130);  // a circle of random dimensions of color I sampled from the image
      noStroke();
      
      int shapeX, shapeY;       // centre the drawing in the window
      shapeX = x + (width - video.width)/2;
      shapeY = y + (height - video.height)/2;
      
      ellipse(shapeX,shapeY,random(10,11), random(10,11));
    }
  }
}