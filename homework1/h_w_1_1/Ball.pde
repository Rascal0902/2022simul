int[][] oneloop = new int[n][2];
class Ball {

  float x;       // x location of square 
  float y;       // y location of square 
  float speed;   // speed of square 
  float w;       // size
  float R;
  float G;
  float B;
  float delta;

  // Ball constuctor
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }


  void display(int i) {
    if(oneloop[i][0]==0){
      R=random(255);
      G=random(255);
      B=random(255);
      
      oneloop[i][0]=1;
    }
    fill(R,G,B);
    stroke(0); 
    ellipse(x,y,w,w); 
  }

  void update(int i) {
    if(oneloop[i][1]==0){
      float temp=random(4);
      if(temp<=1){
        delta=0;
      }
      else if(temp>1 && temp<=2)
      {
        delta=1;
      }
      else if(temp>2 && temp<=3)
      {
        delta=2;
      }
      else 
      {
        delta=3;
      }
      oneloop[i][1]=1;
    }
   if(delta==0){x = x + speed;
     if (x > width) { 
      speed = speed * -0.95;  
    } 
   }
   if(delta==1){x = x - speed;
     if (x < 0) { 
      speed = speed * -0.95;  
    } 
   }
   if(delta==2){y = y + speed; 
      if (y > height) { 
      speed = speed * -0.95;  
    } 
   }
   if(delta==3){y = y - speed; 
     if (y < 0) { 
      speed = speed * -0.95;  
    } 
   }


    // Add gravity to speed
    speed = speed + gravity; 
  }
}
