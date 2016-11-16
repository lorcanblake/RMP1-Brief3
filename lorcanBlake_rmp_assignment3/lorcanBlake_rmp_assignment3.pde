PImage img;

void setup() {
  fullScreen();
  img = loadImage("amy.jpg");
  img.resize(width,height);
  frameRate(10);
}

void draw() {
  // Clear the background on every frame
  background(255);
  
  // Since we are going to access the images pixels I need
  // to load them
  img.loadPixels();
  
  // Notice also I am sampling only every 10th row and column
  
  for (int y = 0; y < img.height; y+=16 ) {
    for (int x = 0; x < img.width; x+=18 ) {
      
      // Calculate the location in the image
      int imgloc = x + y*img.width;
      
      // Image Processing Algorithm would go here
      float r = red(img.pixels[imgloc]);
      float g = green(img.pixels[imgloc]);
      float b = blue(img.pixels[imgloc]);
      
      // Image Processing would go here

      // a rectangle of random dimensions of color I sampled from the image
      fill(r,g,b, 130);
      noStroke();
      
      // The following three lines centre the drawing in the window
      int shapeX, shapeY;
      shapeX = x + (width - img.width)/2;
      shapeY = y + (height - img.height)/2;
      
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