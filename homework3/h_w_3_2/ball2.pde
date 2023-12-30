class Mover2 {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover2(float m, float x , float y) {
    mass = m;
    position = new PVector(x,y);
    velocity = new PVector(10,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(200,200,255);
    ellipse(position.x,position.y,mass*20,mass*20);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }

  }

}
