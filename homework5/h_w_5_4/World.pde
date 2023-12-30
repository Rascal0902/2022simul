/*
 * Jonghwa Park
 * suakii@gmail.com
*/
red_blood_cell[] red = new red_blood_cell[100000]; int redcnt=0;
white_blood_cell[] white = new white_blood_cell[100000]; int whitecnt=0;
virus[] bad = new virus[1000000]; int viruscnt=0;
O2[] oxy = new O2[1000000]; int O2cnt=30;

class World {
  void born(float x, float y) {
    float ran=random(4);
    PVector l = new PVector(x,y);
       if(ran>=1){ 
         red[redcnt]=new red_blood_cell(l);redcnt++;}
       else{
         white[whitecnt]=new white_blood_cell(l);whitecnt++;}
  }
  void virus_born(float x,float y){
      bad[viruscnt]=new virus(new PVector(x,y));viruscnt++;
  }
  void run() {
    float k=0.01;
    for(int i=0;i<redcnt;i++){
      red[i].velocity.x = map(noise(red[i].xoff),0,1,-red[i].maxspeed,red[i].maxspeed);
      red[i].velocity.y = map(noise(red[i].yoff),0,1,-red[i].maxspeed,red[i].maxspeed);
      
    }
    for(int i=0;i<whitecnt;i++){
      white[i].velocity.x = map(noise(white[i].xoff),0,1,-white[i].maxspeed,white[i].maxspeed);
      white[i].velocity.y = map(noise(white[i].yoff),0,1,-white[i].maxspeed,white[i].maxspeed);
    }
    for(int i=0;i<O2cnt;i++){
      oxy[i].velocity.x = map(noise(oxy[i].xoff),0,1,-oxy[i].maxspeed,oxy[i].maxspeed);
      oxy[i].velocity.y = map(noise(oxy[i].yoff),0,1,-oxy[i].maxspeed,oxy[i].maxspeed);
    }
    float min=10000;
    int take=0;
    for(int i=0;i<viruscnt;i++){
      if(bad[i].health<=0){continue;}
      min=10000;
      take=0;
      bad[i].velocity.x = map(noise(bad[i].xoff),0,1,-bad[i].maxspeed,bad[i].maxspeed);
      bad[i].velocity.y = map(noise(bad[i].yoff),0,1,-bad[i].maxspeed,bad[i].maxspeed);
      for(int j=0;j<whitecnt;j++){
        float dist=(new PVector(white[j].location.x-bad[i].location.x,white[j].location.y-bad[i].location.y)).mag();
        if(dist<50){bad[i].health=0;}
        else{if(dist<min){min=dist;take=j;}}
      }
      if(take!=0){
        bad[i].accleration= (new PVector(-white[take].location.x+bad[i].location.x,-white[take].location.y+bad[i].location.y)).mult(k);
      }
    }
    for(int i=0;i<whitecnt;i++){
      min=10000;
      take=0;
      for(int j=0;j<viruscnt;j++){
        float dist=(new PVector(white[i].location.x-bad[j].location.x,white[i].location.y-bad[j].location.y)).mag();
        if(dist<min){min=dist;take=j;}
      }
      if(take!=0){
        white[i].accleration= (new PVector(-bad[take].location.x+white[i].location.x,-bad[take].location.y+white[i].location.y)).mult(k);
      }
    }
    for(int i=0;i<redcnt;i++){
      red[i].update();
      red[i].borders();
      if(window==0 || window==1){red[i].display(red[i].vir);}
    }
    for(int i=0;i<whitecnt;i++){
      white[i].update();
      white[i].borders();
      if(window==0){white[i].display(white[i].vir);}
    }
    for(int i=0;i<viruscnt;i++){
      bad[i].update();
      bad[i].borders();
      if(window==0){bad[i].display(bad[i].vir);}
    }
    for(int i=0;i<O2cnt;i++){
      oxy[i].update();
      oxy[i].borders();
      if(window==1){oxy[i].display();}
    }
  }
  
}
