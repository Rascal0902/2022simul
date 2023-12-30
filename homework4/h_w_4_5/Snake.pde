
class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  ArrayList<PVector> temp = new ArrayList<PVector>();
  Snake() {
    tail.add(new PVector(0,0));
  }

  boolean eat(PVector pos) {
    if(food.x==pos.x && food.y==pos.y){
      food = new PVector(floor(random(cols)), floor(random(rows)));
      food.mult(scl);
      point++;
      println(point);
      return true;
    }
    return false;
  }

  void dir(float x, float y) {
     xspeed = x;
     yspeed = y;
  }

  boolean death() {
    if(tail.get(0).x<0 || tail.get(0).x>=width || tail.get(0).y<0 || tail.get(0).y>=height){
      return true;
    }
    return false;
  }

  void update() {
    boolean longer=eat(new PVector(x,y));
    temp = new ArrayList<PVector>();
    x = x + xspeed*scl;
    y = y + yspeed*scl;
    temp.add(new PVector(x,y));
    if(longer){
      for(int i=0;i<tail.size();i++){temp.add(tail.get(i));}
    }
    else{
      for(int i=0;i<tail.size()-1;i++){temp.add(tail.get(i));}
    }
      tail = new ArrayList<PVector>();
      for(int i=0;i<temp.size();i++){tail.add(temp.get(i));}
  }

  void show() {
    fill(255);
    for (PVector v : tail) {
      rect(v.x, v.y, scl, scl);
    }
  }
}
