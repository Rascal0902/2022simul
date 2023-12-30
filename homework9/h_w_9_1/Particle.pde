class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    position = l.get();
    lifespan = 255.0;
  }
  void run() {
    update();
    display();
  }
  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 30;
  }

  // Method to display
  void display() {
    if(lifespan>0){
    strokeWeight(2);
    float temp=random(3);
    fill(0,0,255);stroke(0,0,255);
    ellipse(position.x,position.y,10,10);}
  }
  void update2(){
    lifespan-=100;
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
