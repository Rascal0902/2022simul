float xoff=0,yoff=0,zoff=0;
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
    lifespan -= 3;
  }

  // Method to display
  void display() {
    strokeWeight(2);
    fill(255*noise(xoff,yoff,zoff),255*noise(xoff,yoff+100,zoff+200),255*noise(xoff,yoff+200,zoff+400));
    stroke(255*noise(xoff,yoff,zoff),255*noise(xoff,yoff+100,zoff+200),255*noise(xoff,yoff+200,zoff+400));
    xoff++;yoff+=10;zoff+=20;
    ellipse(position.x,position.y,5,5);
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
