World world;
float window=0;
Pendulum p;
ParticleSystem ps;
float x,y;
float tempx=0,tempy=0;
void setup() {
  size(800, 800);
  world = new World();
  smooth();
  for(int i=0;i<O2cnt;i++){
     oxy[i]=new O2(new PVector(random(width),random(height)));
  }
  p = new Pendulum(new PVector(width/2,0),175);
  ps = new ParticleSystem(new PVector(0,0));
}
void draw() {
  p.go();
  background(255);
  world.run();
  textSize(20);fill(0);stroke(0);text("red: "+(int)checkred,700,700);
  textSize(20);fill(0);stroke(0);text("white: "+(int)checkwhite,700,725);
  textSize(20);fill(0);stroke(0);text("virus: "+(int)checkvirus,700,750);
  textSize(20);fill(0);stroke(0);text("oxy: "+(int)checkO2,700,775);

  textSize(20);fill(0);stroke(0);text("window: "+(int)window,20,20);
  textSize(20);fill(0);stroke(0);text("press a to make virus",20,750);
  textSize(20);fill(0);stroke(0);text("press f to make oxygen",20,725);
  textSize(20);fill(0);stroke(0);text("press number to change window",20,775);
}
void mousePressed() {world.born(mouseX,mouseY); }
void mouseDragged() {world.born(mouseX,mouseY) ;}
void keyPressed(){ 
  if(key=='a'){world.virus_born(random(800),random(800));}
  if(key=='f'){world.oxy_born(random(800),random(800));}
  if(key=='0'){window=0;}
  if(key=='1'){window=1;}
  if(key=='2'){window=2;}
}
