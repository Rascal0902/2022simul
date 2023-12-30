// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover m;
float xoff=0;
void setup() {
  size(640,360);
  m = new Mover(); 
}

void draw() {
  background(255);
  PVector wind = new PVector((noise(xoff)-0.5)%0.1,0);
  xoff++;
  PVector buoyancy = new PVector(0,-0.01);
  float k=0.001;
  m.applyForce(wind);
  m.applyForce(buoyancy);
  m.velocity.mult(1-k);

  m.update();
  m.display();
  m.checkEdges();

}
