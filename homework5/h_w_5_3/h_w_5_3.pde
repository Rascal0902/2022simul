Asteroids a= new Asteroids();
void setup(){
   size(700,700);
   background(255);
}
void draw(){
  a.printf();
  a.update();
  a.hitwall();
  a.display();
}
void keyPressed(){
  if(keyCode==LEFT){
  a.anglevelocity=-a.k;}
  else if(keyCode==RIGHT){
  a.anglevelocity=a.k;}
  else{a.anglevelocity=0;}
  if(key=='z'){a.addForce(new PVector(0,-1));}
  if(key=='a'){a.st();}
}
