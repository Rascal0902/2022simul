class Agentforce {
  PVector location,velocity,accleration;
  float health;
  float xoff,yoff;
  float r;
  float maxspeed;
  
  Agentforce(PVector l) {
    location = l;health = 200;
    xoff = random(1000);yoff = random(1000);
    maxspeed = map(random(1), 0, 1, 15, 0);
    r = map(random(1), 0, 1, 0, 50);
    velocity = new PVector(0, 0);
    accleration = new PVector(0 , 0);}
  
  
  void update() {
    if(!(this instanceof O2)){health-=1;}
    velocity.add(accleration);
    location.add(velocity);
    xoff+=0.01;yoff+=0.01;}
  
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;}
  
  void display(boolean s) {
    pushMatrix();
    drawBody(s);
    popMatrix();
  }
  void drawBody(boolean s) {
  
  }
}
