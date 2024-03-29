

// A random walker object!

class Walker {
  int x,y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    point(x,y);
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
    int choice = int(random(6));
    
    if (choice == 0 || choice ==1) {
      x++;
    } else if (choice == 2 || choice==3) {
      y++;
    } else if (choice == 4) {
      x--;
    } else {
      y--;
    }

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}
