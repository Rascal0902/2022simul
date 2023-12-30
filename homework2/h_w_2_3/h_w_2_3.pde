/*
 * Jonghwa Park
 * suakii@gmail.com
*/
World world;

boolean simpleGraphics;
int time=0;
void setup() {

  size(800, 800);
  simpleGraphics = false;
  world = new World(20);
  smooth();
  

}

void draw() {
  background(255);

  world.run();
  
  fill(0);
  text("Press 's' to view SimpleMode", 30, height-16);

  time++;

}

void mousePressed() {
  world.born(mouseX,mouseY); 
}

void mouseDragged(){
if(time%20==0){
  world.born(mouseX,mouseY); 
}
}

void keyPressed() {

  if (key == 's') {
    changeGraphicsMode();
  }
}

void changeGraphicsMode() {
    simpleGraphics = !simpleGraphics;
}
