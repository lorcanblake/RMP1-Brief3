  PImage img;
// Step 1. Import the video library
import processing.video.*;
// Step 2. Declare a Capture object
Capture video;

void setup() {
  fullScreen();
  img = loadImage("amy.jpg");
  img.resize(width,height);
  frameRate(10);
  
   // Step 3. Initialize Capture object via Constructor
  // video is 320 x 240, @15 fps
  video = new Capture(this,320*2,240*2, 15);
  
  // Step 4. Start capturing frames
  video.start();
}

void draw() {
  // Clear the background on every frame
  background(255);
  // Check to see if a new frame is available
  if (video.available()) {
    // If so, read it.
    video.read();
  } 
  else
  {
    println("No video detected");
  }
  
  // Playing with video tint
  //tint(mouseX,mouseY,255);
  
  // Display the video image (aka the video frame)
  //image(video,0,0); 
  
  // Since we are going to access the images pixels I need
  // to load them
  img.loadPixels();
  video.loadPixels();
  
  // Notice also I am sampling only every 10th row and column
  
  for (int y = 0; y < video.height; y+=16 ) {
    for (int x = 0; x < video.width; x+=18 ) {
      
      // Calculate the location in the image
      int imgloc = x + y*video.width;
      
      // Image Processing Algorithm would go here
      float r = red(video.pixels[imgloc]);
      float g = green(video.pixels[imgloc]);
      float b = blue(video.pixels[imgloc]);
      
      // Image Processing would go here
      

      // a rectangle of random dimensions of color I sampled from the image
      fill(r,g,b, 130);
      noStroke();
      
      // The following three lines centre the drawing in the window
      int shapeX, shapeY;
      shapeX = x + (width - video.width)/2;
      shapeY = y + (height - video.height)/2;
      
      // Lets move the x and y a bit
      shapeX += random(-5,-5);
      //shapeY += random(-5,-5);
      
      //rect(shapeX,shapeY,random(10,20), random(10,20));
       //ellipse(shapeX,shapeY,10, 10);
       ellipse(shapeX,shapeY,random(10,11), random(10,11));

    }
  }
 
  // Comment this back it to see a "static
  //noLoop();
}