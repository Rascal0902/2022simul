Mover1 ball1=new Mover1(5,200,600);
Mover2 ball2=new Mover2(5,200,200);
float mu1=0.02,mu2=0.04;
void setup(){
  size(1000,800);
  background(255);
}
void draw(){
  background(255);
  fill(200);stroke(0);rect(0,250,1000,150);
  fill(200);stroke(0);rect(0,650,1000,150);
  fill(125);stroke(0);rect(700,250,200,150);
  fill(0);stroke(0);rect(700,650,200,150);
  if(ball1.position.x>=700 && ball1.position.x<=900){ball1.applyForce(new PVector((-1)*ball1.velocity.x/abs(ball1.velocity.x)*mu1*ball1.mass*10,0,0));}
  if(ball2.position.x>=700 && ball2.position.x<=900){ball2.applyForce(new PVector((-1)*ball2.velocity.x/abs(ball2.velocity.x)*mu2*ball2.mass*10,0,0));}
  if(abs(ball1.velocity.x)<=0.01){ball1.velocity.x=0;}
  if(abs(ball2.velocity.x)<=0.01){ball2.velocity.x=0;}
  ball1.update();
  ball2.update();
  ball1.checkEdges();
  ball2.checkEdges();
  ball1.display();
  ball2.display();
}
