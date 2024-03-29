class Floor2 { 
  Body body;
  int r = 16;
  boolean thrusting = false;

  Floor2() {
    makeBody(new Vec2(width/2,175),0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
  
  void makeBody(Vec2 position, float angle, Vec2 vel,float omega) {
    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-500,height/3));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-500,height/2));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(500,height/2));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(500,height/3));

    // Define a polygon 
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
   
    // next line would be: |> for angle=0
    bd.angle = angle; 
    // If we draw ship pointing UP at the beggining: ^
    // There is an angular difference of PI/2 (see below)
    
    body = box2d.createBody(bd);
    
    body.createFixture(ps, 1.0);
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }

  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    noStroke();
    strokeWeight(2);
    noFill();
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }


}
