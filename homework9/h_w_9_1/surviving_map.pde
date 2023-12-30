class MAP{
  float set;
  float[][] m = new float[50][20];
  float[][] vecx = new float[50][20];
  float[][] vecy = new float[50][20];
  float[] dx = {0,1,1,1,0,-1,-1,-1};
  float[] dy = {1,1,0,-1,-1,-1,0,1};
  MAP(){
    set=0;
    for(int i=0;i<50;i++){
      for(int j=0;j<20;j++){
        m[i][j]=127;
      }
    }
  }
  float surviving(float x,float y){
    return m[(int)(x/50)][(int)(y/50)];
  }
  PVector vec(float x,float y){
    return new PVector(vecx[(int)(x/50)][(int)(y/50)],vecy[(int)(x/50)][(int)(y/50)]);
  }
  void update(){
    for(int i=0;i<50;i++){
      for(int j=0;j<20;j++){
         float max=m[i][j],maxk=0;
         for(int k=0;k<8;k++){
           if(i+dx[k]>=0 && i+dx[k]<50 && j+dy[k]>=0 && j+dy[k]<20 && m[(int)(i+dx[k])][(int)(j+dy[k])]>max){
             max=m[(int)(i+dx[k])][(int)(j+dy[k])];maxk=k;
           }
         }
           if(max>m[i][j]+2){
             vecx[i][j]=dx[(int)maxk];vecy[i][j]=dy[(int)maxk];
           }
           else{
             vecx[i][j]=0;vecy[i][j]=0;
           }
      }
    }
  }
  void display(){
    for(int i=0;i<width;i+=50){
      for(int j=0;j<height;j+=50){
        stroke(255-m[i/50][j/50],255,m[i/50][j/50]);
        fill(255-m[i/50][j/50],255,m[i/50][j/50]);
        rect(i,j,50,50);
        fill(0);stroke(0);point(i+25,j+25);
        fill(0,0,255);stroke(0,0,255);line(i+25,j+25,i+25+10*vecx[i/50][j/50],j+25+10*vecy[i/50][j/50]);
      }
    }
    if(window==2){textSize(20);fill(0);stroke(0);text("virus environment",620,20);}
  }
  void died(float x,float y){
    for(int i=0;i<50;i++){
      for(int j=0;j<20;j++){
          if(i==(int)x/50 && j==(int)y/50){
            m[i][j]-=50;
            m[i][j]=constrain(m[i][j],0,255);
          }
          else{
            m[i][j]+=50/32;
            m[i][j]=constrain(m[i][j],0,255);
          }
      }
    }
  }
}
