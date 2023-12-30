// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-2: Bouncing Ball, with PVector!
PVector position;
PVector velocity;

void setup() {
  size(200,200);
  background(255);
  position = new PVector(100,100);
  velocity = new PVector(2.5,5);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // Add the current speed to the position.
  if(keyPressed){
    position.add(velocity);
  }
  else{
    position.add(velocity.mul(2));
  }

  if ((position.x > width) || (position.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((position.y > height) || (position.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  // Display circle at x position
  stroke(0);
  fill(175);
  ellipse(position.x,position.y,16,16);
}
class PVector{
  float x,y; 
  PVector(float x,float y){
    this.x=x;
    this.y=y;
  }
  void add(PVector d){
    this.x+=d.x;this.y+=d.y;
  }
  PVector mul(int add){
     PVector temp = new PVector(this.x*add,this.y*add);
     return temp;
  }
}
