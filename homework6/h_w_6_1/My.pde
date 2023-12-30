public class O2 extends Agentforce{
  float angle=0;
  float w;
  float swing=1;
  boolean vir=true;
  O2(PVector l) {super(l);this.angle=random(360);if(random(2)<1){swing=-1;}}
  
  void display(boolean show){
    pushMatrix();
    float temp=map(p.position.x,200,600,0,360);
    translate(location.x,location.y);
    rotate(radians(temp*swing+this.angle));
    noStroke();
    fill(63,200,255,health);
    ellipse(5,0,15,15);
    ellipse(-5,0,15,15);
    popMatrix();
  }
   void check(){
    for(int i=0;i<2;i++){
    x=location.x-tempx+25;
    y=location.y-tempy+25;
    tempx=location.x+25;tempy=location.y+25;
    ps.addParticle();
    ps.run();
    x=0;y=0;
    }
  }
  
}
class red_blood_cell extends Agentforce {
  
  float s = random(10,30);
  float d = random(5,15);
  boolean vir = false;
  
  red_blood_cell(PVector l) {super(l);}
  void drawBody(boolean t) {
    pushMatrix();
      translate(location.x, location.y);
      rotate(velocity.heading()-radians(90));
      stroke(200,20,20,health);
      fill(200,20,20, health);  
      ellipse(0,0,s,d);
      stroke(150,20,20,health);
      fill(150,20,20, health);
      ellipse(0,0,s/2,d/2);
    popMatrix();
  }
}
class white_blood_cell extends Agentforce {
  float r = random(20,40);
  float q=1;
  boolean vir = false;
  white_blood_cell(PVector l) {super(l);}
  void drawBody(boolean t) {
    pushMatrix();
      strokeWeight(1);
      translate(location.x, location.y);
      rotate(velocity.heading()-radians(90));
      stroke(0,health);
      fill(255,255,255, health);  
      ellipse(0,0,r,r);
      stroke(255,255,255,health);
      for(int i=(int)(0.75*r);i>=0;i--){
        fill(i*4/(3*r)*255,i*4/(3*r)*255,255, health);  
        ellipse(r/4,0,i*3/5,i*3/5);
      }
    popMatrix();
  }
}
class virus extends Agentforce{
  float r = random(5,10);
  float q=1;
  boolean vir = false;
  virus(PVector l) {super(l);}
  void drawBody(boolean t) {
    pushMatrix();
      strokeWeight(1);
      translate(location.x, location.y);
      rotate(velocity.heading()-radians(90));
      for(int i=(int)(0.75*r);i>=0;i--){
        fill(255-i*4/(3*r)*255,255-i*4/(3*r)*255,0, health);  stroke(255-i*4/(3*r)*255,255-i*4/(3*r)*255,0, health);
        ellipse(r/4,0,i*3/5,i*3/5);
      }
      fill(0);stroke(0);
    popMatrix();
  }
}
