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
    lifespan -= 0.1;
  }

  // Method to display
  void display() {
    strokeWeight(2);
    float temp=random(3);
    if(temp<1){stroke(255,0,0,lifespan);fill(255,0,0,lifespan);}
    if(temp<2 || temp>=1){stroke(255,255,0,lifespan);fill(255,255,0,lifespan);}
    if(temp<3 || temp>=2){stroke(255,170,0,lifespan);fill(255,170,0,lifespan);}
    ellipse(position.x,position.y,2,2);
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
