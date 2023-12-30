
Mover m1,m2;

void setup() {
  size(640,360);
  m1 = new Mover(300,200,1); 
  m2 = new Mover(400,200,2); 
}

void draw() {
  background(255);
  float force;
  force=0.1*m1.q*m2.q/abs(m1.position.x-m2.position.y)*abs(m1.position.x-m2.position.y);
  m1.applyForce(new PVector(-force,0));
  m2.applyForce(new PVector(force,0));

  m1.update();
  m2.update();
  m1.display();
  m2.display();
  m1.checkEdges();
  m2.checkEdges();

}
