class Ball {
  PVector position;
  PVector velocity;
  float r;
  
  Ball() {
    position = new PVector(100, 100);
    velocity = new PVector(2.5, 5);
    r=0;
  }

  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    r=50-mouse.dist(position)/10;
    // Add the current speed to the position.
    position.add(velocity);
    if ((position.x > width) || (position.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((position.y > height) || (position.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  void display() {
    // Display circle at x position
    stroke(0);
    fill(175);
    ellipse(position.x, position.y, r, r);
  }
}
