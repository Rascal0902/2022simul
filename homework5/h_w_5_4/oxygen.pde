public class O2 extends Agentforce{
  float angle=0;
  float w;
  float swing=1;
  O2(PVector l) {super(l);this.angle=random(360);if(random(2)<1){swing=-1;}}
  
  void display(){
    pushMatrix();
    float temp=map(p.position.x,200,600,0,360);
    translate(location.x,location.y);
    rotate(radians(temp*swing+this.angle));
    noStroke();
    fill(63,200,255);
    ellipse(5,0,15,15);
    ellipse(-5,0,15,15);
    popMatrix();
  }
}
