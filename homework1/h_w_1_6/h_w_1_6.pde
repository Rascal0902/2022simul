float increment = 0.02;
float zincrement = 0.02; 
float zoff = 0.0;

void setup() {
  size(1000,1000);
  frameRate(50);
}

void draw() {
  loadPixels();
  float xoff = 0.0;
  for (int x = 0; x < width; x++) {
    xoff += increment;  
    float yoff = 0.0; 
    for (int y = 0; y < height; y++) {
      yoff += increment;
      
      float bright = noise(xoff,yoff,zoff)*255;
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
  zoff += zincrement; 
}

/*
float increment = 0.02;

void setup() {
  size(640,360);
  noLoop();
}

void draw() {
  background(0);
  
  
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = noise(xoff,yoff)*255;

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright);
    }
  }
  
  updatePixels();
}
*/
