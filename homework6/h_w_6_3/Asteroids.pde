public class Asteroids{
  PVector position= new PVector(350,350);
  PVector velocity= new PVector(0,0.001);
  PVector accleration= new PVector(0,0.0000001);
  float angle=0;
  float anglevelocity;
  float m=1;
  float k=1;
  Asteroids(){}
  void printf(){
    println("*************");
    println("position",position);
    println("velocity",velocity);
    println("accleration",accleration);
    println("angle",angle);
    println("*************");
  }
  void st(){
    velocity.mult(0.5);
    accleration.mult(0.5);
    anglevelocity*=0.5;
  }
  void addForce(PVector F){
    accleration.add(F.div(m));
    accleration.normalize();
  }
  void hitwall(){
    if(position.x<0 || position.x>width){
      position.x+=width;
      position.x%=width;
    }
    if(position.y<0 || position.y>height){
      position.y+=height;
      position.y%=height;
    }
  }
  void display(){
    background(255);
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians((int)angle));
    fill(127);stroke(0);strokeWeight(2);
    beginShape();
    vertex(0,-20);vertex(-10,0);vertex(10,0);vertex(0,-20);
    endShape();strokeWeight(2);
    beginShape();
    vertex(3,0);vertex(3,5);vertex(8,5);vertex(8,0);
    endShape();
    beginShape();
    vertex(-3,0);vertex(-3,5);vertex(-8,5);vertex(-8,0);
    endShape();
    popMatrix();
  }
  void update(){
    angle+=anglevelocity;
    velocity.add(accleration);
    if(velocity.mag()>20){
      velocity.normalize().mult(19);
    }
    PVector temp=velocity.copy();
    position.add(temp.rotate(radians((int)angle)));
  }
}
