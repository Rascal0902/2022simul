
void setup() {
  size(640, 360);
  background(255);
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = randomGaussian();
  float Rloc = randomGaussian();
  float Gloc = randomGaussian();
  float Bloc = randomGaussian();
  
  float sd = 60;                // Define a standard deviation
  float mean = width/2;         // Define a mean value (middle of the screen along the x-axis)
  xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
  Rloc = ( Rloc * 127 ) +127;
  Gloc = ( Gloc * 127 ) +127;
  Bloc = ( Bloc * 127 ) +127;
  
  fill(Rloc,Gloc,Bloc, 10);
  noStroke();
  ellipse(xloc, height/2, 16, 16);   // Draw an ellipse at our "normal" random location
}
