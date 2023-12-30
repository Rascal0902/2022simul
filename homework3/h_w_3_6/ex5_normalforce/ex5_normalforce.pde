
Box mybox;
float theta = 0.3;
float c = 0.1;
void setup(){
  size(1000, 500);
  mybox = new Box(width, height-width*tan(theta), 0, 0, 0.5);
}


void draw(){
  background(255);
  line(0, height, width, height-width*tan(theta));
  println(height-width*tan(theta));
  PVector gravity = new PVector(0, 0.3);
  gravity.mult(mybox.m);
  
  float fg= gravity.mag();
  mybox.applyForce(gravity); //gravity
  
  mybox.display(theta);
  //mybox.update();
  
}
