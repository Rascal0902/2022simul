// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ParticleSystem ps;
float x,y;
float tempx=0,tempy=0;
void setup() {
  size(640,360);
  x=0;y=0;
  ps = new ParticleSystem(new PVector(x,y));
}

void draw() {
  background(255);
  ps.addParticle();
  x=0;y=0;
  ps.run();
  textSize(10); fill(0); stroke(0); text("click mouse to move particle",20,340);
}
void mousePressed(){
  x=mouseX-tempx;
  y=mouseY-tempy;
  tempx=mouseX;tempy=mouseY;
}
