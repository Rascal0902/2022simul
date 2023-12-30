ParticleSystem ps;
float x,y;
float tempx=0,tempy=0;
class grid{
  int n;
  PVector position;
  boolean colored=false;
  
  grid(int n, PVector p){
    this.n=n; this.position=p;
  }
  void display(){
    if(colored){fill(255,0,0,20); stroke(0);}
    else{fill(255);stroke(0);}
    rect(position.x,position.y,50,50);
    textAlign(CENTER);strokeWeight(2);
    textSize(15);fill(0);stroke(0);text(n,position.x+25,position.y+25);
  }
  void check(){
    colored=true;
    for(int i=0;i<2;i++){
    x=position.x-tempx+25;
    y=position.y-tempy+25;
    tempx=position.x+25;tempy=position.y+25;
    ps.addParticle();
    ps.run();
    x=0;y=0;
    }
  }
}
