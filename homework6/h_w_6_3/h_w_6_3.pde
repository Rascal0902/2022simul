Asteroids a= new Asteroids();
ParticleSystem ps;
float x,y;
float tempx=0,tempy=0;
float gofront=0;
void setup(){
   size(700,700);
   background(255);
   x=0;y=0;
   ps = new ParticleSystem(new PVector(0,0));
}
void draw(){
  //a.printf();
  a.update();
  a.hitwall();
  a.display();
  x=a.position.x-tempx;
  y=a.position.y-tempy;
  tempx=a.position.x;tempy=a.position.y;
  ps.addParticle();
  if(gofront>0){ps.run();}
  else{ps.run2();}
  x=0;y=0;
  if(gofront>0){gofront-=0.1;}
  if(key=='z' || keyCode==LEFT || keyCode==RIGHT){gofront=1;}
}
void keyPressed(){
  if(keyCode==LEFT){
  a.anglevelocity=-a.k;}
  else if(keyCode==RIGHT){
  a.anglevelocity=a.k;}
  else{a.anglevelocity=0;}
  if(key=='z'){gofront=1;a.addForce(new PVector(0,-1));}
  if(key=='a'){gofront=1;a.st();}
}
