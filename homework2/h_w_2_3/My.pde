class red_blood_cell extends Agent {
  
  float s = random(10,30);
  float d = random(5,15);
  
  red_blood_cell(PVector l) {super(l);}
  void drawBody() {
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
class white_blood_cell extends Agent {
  
  float r = random(20,40);
  white_blood_cell(PVector l) {super(l);}
  void drawBody() {
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
