

// A random walker object!

class Walker {
  float x,y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    point(x,y);
  }

  void step() {
    
    int choice = int(random(2));
    
    if (choice == 0) {
      x+=(mouseX-width/2)/sqrt((mouseX-width/2)*(mouseX-width/2)+(mouseY-height/2)*(mouseY-height/2));
      y+=(mouseY-height/2)/sqrt((mouseX-width/2)*(mouseX-width/2)+(mouseY-height/2)*(mouseY-height/2));
      println(x,y);
    } 

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
    println(x,y);
    println();
  }
}
