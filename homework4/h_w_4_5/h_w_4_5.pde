
Snake s;
int scl = 20;
PVector food;
int cols,rows,point;
float oneloop=0;
void setup() {
  size(600, 600);
  s = new Snake();
  cols = width/scl;
  rows = height/scl;
  frameRate(10);
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
  
}

void draw() {
  background(51);
  fill(255, 0, 100);
  rect(food.x, food.y, scl, scl);
  if(s.death()){if(oneloop==0){fill(255);textAlign(CENTER);text("GAME OVER",300,300);
  println("%%%%%%%%%%%%%%%%%%%%%%%%%");
  println("point= " + point);
  println("%%%%%%%%%%%%%%%%%%%%%%%%%");oneloop=1;}}
  else{s.update();s.show();}
  textSize(20);fill(255);stroke(255);textAlign(LEFT);text("point  "+point,10,20);noStroke();
  
}





void keyPressed() {
  if (keyCode == UP || key == 'w') {
    s.dir(0, -1);
  } else if (keyCode == DOWN || key =='s') {
    s.dir(0, 1);
  } else if (keyCode == RIGHT || key =='d') {
    s.dir(1, 0);
  } else if (keyCode == LEFT || key == 'a') {
    s.dir(-1, 0);
  }
}
