
class Box{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float m;
  Box(float x, float y, float vx, float vy, float m){
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0);
    this.m = m;
  }
  void applyForce(PVector F){
    F.div(m);
    acceleration.add(F);
  }
  void display(float theta){
    pushMatrix();
    stroke(0);
    fill(128);
    translate(position.x, position.y);
    rotate(-theta);
    rect(0, 0, 50, -30);
    popMatrix();
  }
  void update(){
    position.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
}
