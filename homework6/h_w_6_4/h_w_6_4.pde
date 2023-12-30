int N=180;
float time=0;
grid[] plate =new grid[100000];
void setup(){
  size(1000,500);
  background(255);
  float tempx,tempy;
  for(int i=1;i<=N;i++){
    tempx = (i-1)%20;
    tempy = (i-1)/20;
    plate[i]= new grid(i,new PVector(tempx*50,tempy*50));
    if(i==1){plate[i].colored=true;}
  }
  ps = new ParticleSystem(new PVector(0,0));
  frameRate(20);
}
void draw(){
  fill(255);stroke(255);rect(0,450,1000,50);
  if(time%1==0){go();}
  for(int i=1;i<=N;i++){
    plate[i].display();
  }
  fill(255);stroke(255);rect(0,450,1000,50);fill(0);stroke(0);
  text("Checking: "+Integer.toString(goi),60,480);
  time++;
}
int goi=2,goj=3;
void go(){
  if(plate[goi].colored){goi++;goj=goi+1;}
  if(goj%goi==0 && plate[goj].colored==false){
      plate[goj].check();
  }
  goj++;
  if(goj>180){goi++; goj=goi+1;}
  return;
}
