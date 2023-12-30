World world;
float window=0;
Pendulum p;
void setup() {
  size(800, 800);
  world = new World();
  smooth();
  for(int i=0;i<O2cnt;i++){
     oxy[i]=new O2(new PVector(random(width),random(height)));
  }
  p = new Pendulum(new PVector(width/2,0),175);
}
void draw() {
  p.go();
  background(255);
  world.run();
  textSize(20);fill(0);stroke(0);text("window: "+(int)window,20,20);
  textSize(20);fill(0);stroke(0);text("press a to make virus",20,750);
  textSize(20);fill(0);stroke(0);text("press number to change window",20,775);
}
void mousePressed() {world.born(mouseX,mouseY); }
void mouseDragged() {world.born(mouseX,mouseY) ;}
void keyPressed(){ 
  if(key=='a'){world.virus_born(random(800),random(800));}
  if(key=='0'){window=0;}
  if(key=='1'){window=1;}
  if(key=='2'){window=2;}
}
