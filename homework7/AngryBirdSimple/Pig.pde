class Pig { 
  Body body;
  float r = 5;   // Size
  PImage pig;
  boolean die=false;
  Pig() {
    makeBody(new Vec2(560,120),0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
  void makeBody(Vec2 position, float angle, Vec2 vel,float omega) {
    // Define a polygon 
    PolygonShape ps = new PolygonShape();
    float w = box2d.scalarPixelsToWorld(10);
    float h = box2d.scalarPixelsToWorld(30);
    ps.setAsBox(w, h);
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
    // next line would be: |> for angle=0
    bd.angle = angle; 
    // If we draw ship pointing UP at the beggining: ^
    // There is an angular difference of PI/2 (see below)
    body = box2d.createBody(bd);
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 4;
    fd.friction = 2;
    body.createFixture(fd);
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }
  
  void angular(float angulo){
      body.setAngularVelocity(angulo);
    }
  // Draw the ship
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    if(!die){
    pushMatrix();
    pig = loadImage("pig.png");
    image(pig,pos.x,pos.y,30,30);
    popMatrix();}
    if(die){
    pushMatrix();
    pig = loadImage("pigdie.png");
    image(pig,pos.x,pos.y,30,30);
    popMatrix();}
  }
}
class Pignew { 
  Body body;
  float r = 5;   // Size
  PImage pig2;
  boolean die=false;

  Pignew() {
    makeBody(new Vec2(720,140),0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
  
  void makeBody(Vec2 position, float angle, Vec2 vel,float omega) {
    // Define a polygon 
    PolygonShape ps = new PolygonShape();
    float w = box2d.scalarPixelsToWorld(10);
    float h = box2d.scalarPixelsToWorld(30);
     
    ps.setAsBox(w, h);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
    
   
    // next line would be: |> for angle=0
    bd.angle = angle; 
    // If we draw ship pointing UP at the beggining: ^
    // There is an angular difference of PI/2 (see below)
    
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 4;
    fd.friction = 2;

    body.createFixture(fd);
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }
  
  void angular(float angulo){
      body.setAngularVelocity(angulo);
    }
  

  // Draw the ship
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    if(!die){
    pushMatrix();
    pig2 = loadImage("pig2.png");
    image(pig2,pos.x,pos.y-20,50,50);
    popMatrix();}
    if(die){
    pushMatrix();
    pig2 = loadImage("pig2die.png");
    image(pig2,pos.x,pos.y-20,50,50);
    popMatrix();}
  }
}
