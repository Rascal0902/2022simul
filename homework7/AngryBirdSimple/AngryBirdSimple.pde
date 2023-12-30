import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Redbird redbird;
Floor floor1;Floor2 floor2;
Resortera resortera;
Bar1 bar1;Bar2 bar2;Bar3 bar3;Bar4 bar4;Bar5 bar5;Bar6 bar6;Bar7 bar7;Bar8 bar8;Bar9 bar9;Bar10 bar10;Bar11 bar11;
Pig pig;Pignew pignew;
float a[][] = new float[10000][2];int aend=0;
PImage sky,slingshot,sceen1,screen2,sc,start,second;
boolean shot = false;
int stage =0,points = 0,time=0;
void setup() {
  size(1000, 335);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0.0,-5.0);
  box2d.listenForCollisions();
  sky = loadImage("sky.png");
  slingshot = loadImage("slingshot.png");
  start = loadImage("gshslogo.png");
  second = loadImage("second.png");
  sceen1 = loadImage("gshslogo.png");
  sc = loadImage("play.png");
 
}
float oneloop1,oneloop2;
void draw() {
  box2d.step();time++;
  if(mousepress==1){framecount++;}
  if(stage == 0){
    background(255);
    image(start,0,0,1000,335);image(sc, 450,200,100,50);
    if(mouseX>=450 && mouseX<550 && mouseY>=200 && mouseY<250 && key==' ' && keyPressed && time>60){time=0;stage=1;} 
  }
  else if(stage==1){
    background(255);image(second,0,0,1000,335);
    fill(#F07E05);stroke(#F06F05);strokeWeight(10);rectMode(CORNER);rect(200,100,100,100);rect(700,100,100,100);
    textAlign(CENTER);textSize(60);fill(0);stroke(0);text("1",250,170);text("2",750,170);
    if(mouseX>=200 && mouseX<300 && mouseY>=100 && mouseY<200 && key==' ' && keyPressed && time>60){mousepress=0;oneloop1=0;points=0;time=0;stage=2;} 
    if(mouseX>=700 && mouseX<800 && mouseY>=100 && mouseY<200 && key==' ' && keyPressed && time>60){mousepress=0;oneloop2=0;points=0;time=0;stage=3;}
    if(key=='b' && keyPressed && time>60){time=0; stage=0;}
  }
  else if(stage == 2){
    if(oneloop1==0){oneloop1=1;makeBar1();}
    if(key=='b' && keyPressed && time>60){time=0; stage=1;}
  background(sky);
  redbird.display();
  floor1.display();floor2.display();
  resortera.display();
  bar1.display();bar2.display();bar3.display();bar4.display();bar5.display();bar6.display();bar7.display();bar8.display();
  pig.display();
  image(slingshot,20,165); 
  fill(255);textSize(20);text("stage : 1",60,20);
  fill(255);textSize(20);text("Score:", 800, 20); text(points, 900, 20);   
  ashow();
  } 
  else if(stage == 3){
    if(oneloop2==0){oneloop2=1;makeBar2();}
    if(key=='b' && keyPressed && time>60){time=0; stage=1;}
  background(sky);
  redbird.display();
  floor1.display();
  floor2.display();
  resortera.display();
  bar1.display();bar2.display();bar3.display();bar4.display();bar5.display();bar7.display();bar9.display();bar10.display();bar11.display();
  pig.display();pignew.display();
  image(slingshot,70,165); 
  fill(255);textSize(20);text("stage : 2",60,20);
  fill(255);textSize(20);text("Score:", 800, 20); text(points, 900, 20);   
  ashow();
  } 
}
void ashow(){
  for(int i=0;i<aend;i++){
    fill(0);stroke(0);
    ellipse(a[i][0],a[i][1],4,4);
  }
  return;
}
int mousepress=0,framecount=0;
void mousePressed(){
  if (mouseButton == RIGHT && mousepress==0 && mouseX>60 && mouseY>70) {
    mousepress=1;
    Vec2 asdf=new Vec2(mouseX-60,190-mouseY);
    asdf.normalize();
    resortera.move(new Vec2(asdf.x*30,asdf.y*30));
  }
}

void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  //println(o1.getClass(),o2.getClass(),Redbird.class);
  if (o1.getClass() == Redbird.class && o2.getClass() != Floor.class && o2.getClass() != Resortera.class) {
    //println("collision Redbird");
     points = points + 100 ;
  } 
  else if (mousepress==1 && o2.getClass() == Pig.class) {
    points = points + 500 ;
    pig.die=true;
    //println("pig collision");
  }
  else if (mousepress==1 && o2.getClass() == Pignew.class) {
    points = points + 1000 ;
    pignew.die=true;
    //println("pig2 collision");
  }
}


// Objects stop touching each other
void endContact(Contact cp) {
}
void makeBar1(){
  bar1 = new Bar1();
  bar2 = new Bar2();
  bar3 = new Bar3();
  bar4 = new Bar4();
  bar5 = new Bar5();
  bar6 = new Bar6();
  bar7 = new Bar7();
  bar8 = new Bar8();
  pig = new Pig();
  redbird = new Redbird();
  floor1 = new Floor();
  floor2 = new Floor2();
  resortera = new Resortera();
}
void makeBar2(){
  bar1 = new Bar1();
  bar2 = new Bar2();
  bar3 = new Bar3();
  bar4 = new Bar4();
  bar5 = new Bar5();
  bar7 = new Bar7();
  bar9 = new Bar9();
  bar10 = new Bar10();
  bar11 = new Bar11();
  pig = new Pig();pignew = new Pignew();
  redbird = new Redbird();
  floor1 = new Floor();
  floor2 = new Floor2();
  resortera = new Resortera();
}
