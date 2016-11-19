import processing.video.*;
import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);
Capture video;
int circleSizeX = int(random(6,7)); 
int circleSizeY = int(random(6,7)); // to get the shimmer effect I had to make sure that the width and height of the circle were only sometimes equal to one another
int saturation = 200; // default saturation value of the generated circles so that it would

  
void setup() {
  fullScreen();
  noCursor();
  frameRate(10);
  video = new Capture(this,640,480, 15); // capturing frames
  video.start(); 
}

void draw() {
  background(255); // Clear the background on every frame
  
  if (video.available()) {
    video.read();
  } 
  else
  {
    println("No video detected");
  }
  video.loadPixels(); // to access the video frame pixels I need to load them
 
  sc.pan(mouseX); // pan the generated audio as the mouse is moved from left to right
  sc.instrument(constrain(mouseY, 1, 120)); // // change the instrument type by the mouseY value -- constraint used because midi instruments are stored in an indexed array ~ between 1 - 120
  sc.playNote(random(1,255), random(1,255), video.frameRate); // playNote(pitch, dynamic, duration[bpm]) -- used to generate random notes and also be in sync with the video frame
  
  // sampling only every 16th and 15th row and column
  for (int y = 0; y < video.height; y+=16 ) {
    for (int x = 0; x < video.width; x+=15 ) {
      
      int imgloc = x + y*video.width; // Calculate the location in the image
      
      // Image Processing Algorithm would go here
      float r = red(video.pixels[imgloc]);
      float g = green(video.pixels[imgloc]);
      float b = blue(video.pixels[imgloc]);
      
      // Image Processing would go here     
      fill(r,g,b, saturation); // a circle of random dimensions of color I sampled from the image
      noStroke();
      
      int shapeX, shapeY; // centre the drawing in the window
      shapeX = x + (width - video.width)/2;
      shapeY = y + (height - video.height)/2;
      
       if(mouseX >= (shapeX - 100)) {  
      circleSizeX = circleSizeY = mouseX/int((random(10, 70))); // allows for dynamic resizing of circles with mouse movement and hence a variety of styles
      saturation =  (mouseY/6); // increase the saturation of the circles as the mouse travels downward, further increasing style variety

      }
      else{
        circleSizeX = circleSizeY = int(random(7,8)); // reset value for the circles when mouseX is not over them -- wanted a "normal" view so that the user recognised dramatic change when using the mouse
      }      
      ellipse(shapeX,shapeY,circleSizeX, circleSizeX);
    }
  }
}