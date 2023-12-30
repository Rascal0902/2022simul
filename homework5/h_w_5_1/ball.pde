class ball{
  PVector position=new PVector(950,550);
  PVector velocity=new PVector(0,0);
  PVector accleration=new PVector(0,0);
  float angle=50;
  float w=0;
  
  ball(){
  }
  void addForce(PVector force){
    accleration.add(force.mult(0.1));
  }
  void update(){
    velocity.add(accleration);
    velocity.mult(0.99);
    position.add(velocity);
    angle+=velocity.x*(-1);
  }
  void hitwall(){
    if(position.x<0){position.x*=-1;velocity.x*=-0.5;}
    if(position.y<0){position.y*=-1;velocity.y*=-0.5;}
    if(position.x>width){position.x=2*width-position.x;velocity.x*=-0.5;}
    if(position.y>height){position.y=2*height-position.y;velocity.y*=-0.5;}
  }
  void display(){
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians(angle));
    image(ball,-25,-25,50,50);
    popMatrix();
  }
}
