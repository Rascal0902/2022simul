// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Liquid class 
class Liquid {


  // Liquid is a rectangle
  float x, y, w, h;
  // Coefficient of drag
  float c;
  float C;

  Liquid(float x_, float y_, float w_, float h_, float c_,float C_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    C = C_;
  }

  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.position;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }

  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
  
  // Calculate up force
  PVector up(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float upMagnitude = C * speed * speed;
    PVector upForce = m.velocity.get();

    // Scale according to magnitude
    // Force.setMag(dragMagnitude);
    upForce.normalize();
   upForce.mult(upMagnitude);
    return upForce;
  }

  void display() {
    noStroke();
    fill(255);
    rect(x, y, w, h);
  }
}
