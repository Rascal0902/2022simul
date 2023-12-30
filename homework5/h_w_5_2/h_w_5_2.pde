float r=0;
float angle=0;
void setup(){
  size(800,400);
  background(255);
  frameRate(400);
}
void draw(){
  translate(400,200);
  fill(0);stroke(0);strokeWeight(3);
  ellipse(r*cos(radians(angle)),r*sin(radians(angle)),10,10);
  r+=0.1;
  angle++;
}
