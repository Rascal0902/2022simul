PImage canon,ball;
int oneloop=0,oneloop2=0,oneloop3=0;
ball b=new ball();
void setup(){
  size(1100,700);
  background(255);
  smooth();
  canon=loadImage("canon.png");
  ball=loadImage("ball.png");
}
void draw(){
  if(mousePressed && oneloop==0){b.velocity.add(new PVector(-10,-10));oneloop=1;}
  if(key==' '){if(oneloop2==0){b.addForce(new PVector(-3,0));oneloop2=1;}}else{oneloop2=0;}
  background(255);
  if(oneloop==1){
  b.addForce(new PVector(0,0.1));
  b.update();
  b.hitwall();
  b.display();
  }
  image(canon,900,500,200,200);
}
