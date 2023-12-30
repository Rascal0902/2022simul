World world;
void setup() {
  size(800, 800);
  world = new World();
  smooth();
}
void draw() {
  background(255);
  world.run();
  if(key=='a'){world.virus_born(random(800),random(800));}
  textSize(20);fill(0);stroke(0);text("press a to make virus",20,750);
}
void mousePressed() {world.born(mouseX,mouseY); }
void mouseDragged() {world.born(mouseX,mouseY) ;}
